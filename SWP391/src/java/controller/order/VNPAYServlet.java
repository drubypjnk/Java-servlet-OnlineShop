/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.order;

import PayLib.PayLib;
import dal.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.Date;
import java.util.Enumeration;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Order;

/**
 *
 * @author win
 */
public class VNPAYServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet VNPAYServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet VNPAYServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         ServletContext context = getServletContext();
        String hashSecret = context.getInitParameter("HashSecret"); //chuỗi bí mật
        PayLib pay = new PayLib();
        String vnp_ResponseCode = null;
        String vnp_SecureHash = null;
        String mess = "";
            try {
        for (Enumeration params = request.getParameterNames(); params.hasMoreElements();) {
                //vnp_Amount=1000000&vnp_BankCode=NCB&vnp_BankTranNo=VNP13812516&vnp_CardType=ATM&vnp_OrderInfo=Thanh+toan+don+hang&vnp_PayDate=20220807224141&vnp_ResponseCode=00&vnp_TmnCode=GHHNT2HB&vnp_TransactionNo=13812516&vnp_TxnRef=13&vnp_SecureHashType=SHA256&vnp_SecureHash=2541ac05b034c9d3cc73fb9c5729ba78f72b6fd01c54f7ce71a8235d305ab831
                String key = (String) params.nextElement();
                String value = request.getParameter(key);
                if (key.equalsIgnoreCase("vnp_SecureHash")) {//hash của dữ liệu trả về
                    vnp_SecureHash = value;
                }
                 if (key.equalsIgnoreCase("vnp_ResponseCode")) {
                    vnp_ResponseCode = value;
                }
                 if ((key != null) && key.startsWith("vnp_") && (value.length() > 0)) {
                    pay.AddResponseData(key, value);
                }
                 }
                boolean checkSignature = pay.ValidateSignature(vnp_SecureHash, hashSecret); //check chữ ký đúng hay không?

                        int order_id = Integer.parseInt(pay.getRespondData("vnp_TxnRef"));
                            String orderID_encode = order_id + "";
            String orderID_encoded = Base64.getEncoder().encodeToString(orderID_encode.getBytes("UTF-8"));

                if (checkSignature) {
                    if (vnp_ResponseCode.equals("00")) {
                        //Thanh toán thành công
                        mess = "Thanh toán thành công hóa đơn ";
                  OrderDAO orderDAO = new OrderDAO();
            Order order = orderDAO.getOrderByOrderID(order_id);
            order.setPayment("VN-PAY");
            orderDAO.UpdateOrderInformation(order);
                    } else {
                        //Thanh toán không thành công. Mã lỗi: vnp_ResponseCode
                        mess = "Có lỗi xảy ra trong quá trình xử lý hóa đơn ";
                    }
                } else {
                    mess = "Có lỗi xảy ra trong quá trình xử lý";
                }
               PrintWriter out = response.getWriter();
                out.println("<script type=\"text/javascript\">");
            out.println("alert('"
                    + mess+
                    "');");
            out.println("window.location.href = \"cartcompletion?orderid="
                    + orderID_encoded
                    + "\";");
            out.println("</script>");

            } catch (NoSuchAlgorithmException ex) {
                System.out.println("ex");
            }

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            try {
                int order_id=(int)request.getAttribute("order_id");
                 String orderID_encode = order_id + "";
            String orderID_encoded = Base64.getEncoder().encodeToString(orderID_encode.getBytes("UTF-8"));
                double total_price  =(double)request.getAttribute("total_price");
            response.setContentType("text/html");
            ServletContext context = getServletContext();
            String url = context.getInitParameter("Url");
            String returnUrl = context.getInitParameter("ReturnUrl");
            String tmnCode = context.getInitParameter("TmnCode");
            String hashSecret = context.getInitParameter("HashSecret");
            PayLib pay = new PayLib();
            SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
            Date date = new Date(System.currentTimeMillis());
            //add request data to vn
            pay.AddRequestData("vnp_Version", "2.0.0"); //Phiên bản api mà merchant kết nối. Phiên bản hiện tại là 2.0.0
            pay.AddRequestData("vnp_Command", "pay"); //Mã API sử dụng, mã cho giao dịch thanh toán là 'pay'
            pay.AddRequestData("vnp_TmnCode", tmnCode); //Mã website của merchant trên hệ thống của VNPAY (khi đăng ký tài khoản sẽ có trong mail VNPAY gửi về)
            pay.AddRequestData("vnp_Amount", (int)total_price*100+""); //số tiền cần thanh toán, công thức: số tiền * 100 - ví dụ 10.000 (mười nghìn đồng) --> 1000000
            pay.AddRequestData("vnp_BankCode", ""); //Mã Ngân hàng thanh toán (tham khảo: https://sandbox.vnpayment.vn/apis/danh-sach-ngan-hang/), có thể để trống, người dùng có thể chọn trên cổng thanh toán VNPAY
            pay.AddRequestData("vnp_CreateDate", formatter.format(date)); //ngày thanh toán theo định dạng yyyyMMddHHmmss
            pay.AddRequestData("vnp_CurrCode", "VND"); //Đơn vị tiền tệ sử dụng thanh toán. Hiện tại chỉ hỗ trợ VND
            pay.AddRequestData("vnp_IpAddr", "::1"); //Địa chỉ IP của khách hàng thực hiện giao dịch
            pay.AddRequestData("vnp_Locale", "vn"); //Ngôn ngữ giao diện hiển thị - Tiếng Việt (vn), Tiếng Anh (en)
            pay.AddRequestData("vnp_OrderInfo", "Thanh toan don hang"); //Thông tin mô tả nội dung thanh toán
            pay.AddRequestData("vnp_OrderType", "other"); //topup: Nạp tiền điện thoại - billpayment: Thanh toán hóa đơn - fashion: Thời trang - other: Thanh toán trực tuyến
            pay.AddRequestData("vnp_ReturnUrl", returnUrl); //URL thông báo kết quả giao dịch khi Khách hàng kết thúc thanh toán
            pay.AddRequestData("vnp_TxnRef", order_id+""); //mã hóa đơn
            String paymentUrl = pay.CreateRequestUrl(url, hashSecret);
//            pay.AddRequestData("vnp_TxnRef", DateTime.Now.Ticks.ToString()); //mã hóa đơn
            response.sendRedirect(paymentUrl);
        } catch (Exception ex) {
            System.out.println(ex);
        }

    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
