/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package survey;

import utilities.SimpleStringCipher;

/**
 *
 * @author abinaya
 */
public class TestClass {

    public static void main(String args[]) throws Exception {

        String Status = "Cancelled,Confirmed,Completed,Accepted";
        Status = "\"" + Status.replaceAll(",", "\" or \"") + "\"";
        System.out.println(Status);
    }
}
