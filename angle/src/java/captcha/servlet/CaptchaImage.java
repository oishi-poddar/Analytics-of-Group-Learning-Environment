/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package captcha.servlet;



import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import nl.captcha.Captcha;
import nl.captcha.servlet.CaptchaServletUtil;
import nl.captcha.backgrounds.*;
import nl.captcha.text.renderer.*;
import nl.captcha.gimpy.*;
import nl.captcha.noise.*;
import nl.captcha.text.producer.*;
import java.awt.image.*;
import java.awt.Color;
import java.awt.Font;
import java.io.OutputStream;
import javax.imageio.ImageIO;
import java.util.List;
import java.util.ArrayList;
/**
 *
 * @author rkjangir
 */
public class CaptchaImage extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    public void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("image/jpg");
        //PrintWriter out = response.getWriter();
        try {
            Color color = new Color(14,130,222);
            //Font font = new Font("Arial",Font.TRUETYPE_FONT,40);
            Font font = new Font("Arial",Font.ITALIC,40);
            List colorList = new ArrayList();
            List fontList = new ArrayList();
            colorList.add(color);
            fontList.add(font);
            //char[] srcChars = {'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s',
            //                   't','u','v','w','x','y','z','A','B','C','D','E','F','G','H','I','J','K','L',
            //                   'M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','0','1','2','3','4',
            //                   '5','6','7','8','9'};
             char[] srcChars = {'0','1','2','3','4','5','6','7','8','9'};
            Captcha captcha = new Captcha.Builder(206, 50)
                    .addText(new DefaultTextProducer(7,srcChars),new DefaultWordRenderer(colorList,fontList))
                    .addBackground(new TransparentBackgroundProducer())
                    .build();
            //CaptchaServletUtil.writeImage(response, captcha.getImage());
            HttpSession session = request.getSession();
            session.setAttribute(captcha.NAME, captcha);
            //String answer = captcha.getAnswer();
            BufferedImage captchaImage = captcha.getImage();
            OutputStream outStream = response.getOutputStream();
            ImageIO.write(captchaImage, "png", outStream);
            outStream.close();
        } finally { 
            
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
