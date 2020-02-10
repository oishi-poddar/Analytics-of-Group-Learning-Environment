/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package utilities;

import java.io.*;
import java.util.Scanner;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author mayank
 */
/**
 * The HtmlUtility class is responsible for generation of a dynamic jsp page out
 * of the parsed html string which is passed to it based on the document id and
 * the lagnuage id .
 *
 * @author Ingit Arora
 */
public class HtmlUtility {

    final static String FS = System.getProperty("file.separator"); /*
     * String to store the file separator system property
     */

    final static String NL = System.getProperty("line.separator"); /*
     * String to store the new line system property
     */


    /**
     * Function to read the contents of a particular file by passing its path
     * and the file name using the scanner utility
     */
    public static String read(String filePath, String fileName) throws IOException {
        StringBuilder text = new StringBuilder();
        Scanner scanner = new Scanner(new FileInputStream(filePath + FS + fileName), "UTF-8");
        try {
            while (scanner.hasNextLine()) {
                text.append(scanner.nextLine() + NL);
            }
        } finally {
            scanner.close();
        }
        return text.toString();
    }

    /**
     * Write fixed content to the given file.
     */
    public static void write(String fileName, String filePath, String contents) throws IOException {
        Writer out = new OutputStreamWriter(new FileOutputStream(filePath + FS + fileName), "UTF-8");
        try {
            out.write(contents);
        } finally {
            out.close();
        }
    }
}