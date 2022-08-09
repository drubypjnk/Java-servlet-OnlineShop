/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package PayLib;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;

/**
 *
 * @author Admin
 */
public class main {
    public static void main(String[] args) throws NoSuchAlgorithmException, UnsupportedEncodingException {
        Encryption e=new Encryption();
        String t1 = e.Sha256("BAGAOHAPRHKQZASKQZASVPRSAKPXNYXSvnp_Amount=1000000&vnp_BankCode=NCB&vnp_BankTranNo=VNP13812549&vnp_CardType=ATM&vnp_OrderInfo=Thanh toan don hang&vnp_PayDate=20220808000636&vnp_ResponseCode=00&vnp_TmnCode=GHHNT2HB&vnp_TransactionNo=13812549&vnp_TxnRef=18");
        String t2="32389e2ee8ff467f31f7354a00f6d96c32d7d2b8d416bcb8e4af03d268b4ccb5";
        System.out.println("test:1");
        System.out.println(""+t1);
        System.out.println("Test2:");
        System.out.println(""+t2);
        System.out.println(t1.equalsIgnoreCase(t2));
    }
}
//"a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3"