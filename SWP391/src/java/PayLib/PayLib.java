/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package PayLib;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Map;
import java.util.TreeMap;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class PayLib {

    private TreeMap<String, String> reQuestData = new TreeMap<>();
    private TreeMap<String, String> resPonseData = new TreeMap<>();

    public PayLib() {
    }
//                     Request data

    private String GetRequestRaw() throws UnsupportedEncodingException {
        StringBuilder data = new StringBuilder();
        for (Map.Entry<String, String> entry : reQuestData.entrySet()) {
          
                data.append(entry.getKey() + "=" + entry.getValue() + "&");
            
        }
        //remove last '&'
        if (data.length() > 0) {
            data.deleteCharAt(data.length()-1);
        }
        System.out.println("Request_raw:    " +data.toString());
        return data.toString();
    }

    public void AddRequestData(String key, String value) {
        if (!(value.isEmpty())) {//have data
            reQuestData.put(key, value);
        }
    }

    //create new url
    public String CreateRequestUrl(String baseUrl, String vnpt_HashSecret) throws NoSuchAlgorithmException, UnsupportedEncodingException {
        StringBuilder data = new StringBuilder();
        for (Map.Entry<String, String> entry : reQuestData.entrySet()) {
            if (!(entry.getValue().isEmpty())) {
                try {
                    if (entry.getKey().equalsIgnoreCase("vnp_IpAddr") || entry.getKey().equalsIgnoreCase("vnp_ReturnUrl")) {
                        data.append(entry.getKey() + "=" + URLEncoder.encode(entry.getValue(), StandardCharsets.US_ASCII.toString()).toLowerCase() + "&");
                    } else {
                        data.append(entry.getKey() + "=" + URLEncoder.encode(entry.getValue(), StandardCharsets.US_ASCII.toString()) + "&");
                    }
                } catch (UnsupportedEncodingException ex) {
                    System.out.println(ex);
                }
            }
        }

        String queryString = data.toString();
        String rawData = GetRequestRaw();
        baseUrl += "?" + queryString;
        String vnp_SecureHash = Encryption.Sha256(vnpt_HashSecret+rawData);
        baseUrl += "vnp_SecureHash=" + vnp_SecureHash;
        return baseUrl;
    }
    //respond data

    public void AddResponseData(String key, String value) {
        if (!(value.isEmpty())) {//have data
            resPonseData.put(key, value);
        }
    }

    public String getRespondData(String key) {
        if (resPonseData.containsKey(key)) {
            String data = resPonseData.get(key);
            return data;
        }
        return null;
    }

    private String GetResponseRaw() {
        StringBuilder data = new StringBuilder();
        if(resPonseData.containsKey("vnp_SecureHashType")){
            resPonseData.remove("vnp_SecureHashType");
        }
        if(resPonseData.containsKey("vnp_SecureHash")){
            resPonseData.remove("vnp_SecureHash");
        }
        for (Map.Entry<String, String> entry : resPonseData.entrySet()) {
            if (!(entry.getValue().isEmpty())) {
                data.append(entry.getKey() + "=" + entry.getValue() + "&");
            }
        }
        //remove last '&'
        if (data.length() > 0) {
            data.deleteCharAt(data.length()-1);
        }
        return data.toString();
    }
    //vnp_Amount=1000000&vnp_BankCode=NCB&vnp_BankTranNo=VNP13812546&vnp_CardType=ATM&vnp_OrderInfo=Thanh toan don hang&vnp_PayDate=20220807234714&vnp_ResponseCode=00&vnp_TmnCode=GHHNT2HB&vnp_TransactionNo=13812546&vnp_TxnRef=16
    public Boolean ValidateSignature(String inputHash, String secretKey) throws NoSuchAlgorithmException, UnsupportedEncodingException {
        String response_raw = GetResponseRaw();
        System.out.println("SecretHas:response:" +secretKey+response_raw);
        System.out.println("Input Hash:"+inputHash);
        String myChecksum = Encryption.Sha256(secretKey + response_raw);
        System.out.println("checksum:"+myChecksum);
        System.out.println("result");
        System.out.println(myChecksum.equalsIgnoreCase(inputHash));
        return myChecksum.equalsIgnoreCase(inputHash);
    }
}
