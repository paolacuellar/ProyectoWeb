/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dbconnection.controllers;

import com.dbconnection.dao.UserDAO;
import com.dbconnection.models.UserModel;
import com.dbconnection.utils.FileUtils;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;

/**
 *
 * @author PaolaAlejandra
 */
@WebServlet(name = "UpdateUserController", urlPatterns = {"/UpdateUserController"})
@MultipartConfig(maxFileSize = 1000 * 1000 * 5, maxRequestSize = 1000 * 1000 * 25, fileSizeThreshold = 1000 * 1000)
public class UpdateUserController extends HttpServlet {



    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
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
        HttpSession session = request.getSession(false);
        Integer idUserS = (Integer)session.getAttribute("ID User");
        String name = request.getParameter("name");
        String fecha = request.getParameter("dob");
        String email = request.getParameter("email");
        String password = request.getParameter("pass"); 
        String nickname = request.getParameter("nickname");
        
        String path = request.getServletContext().getRealPath("");
        
        File fileSaveDir = new File(path + FileUtils.RUTE_USER_IMAGE); 
        
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdir();
        }

        
        Part file = request.getPart("image"); 
        String contentType = file.getContentType();
        System.out.println("Imagen: " + file.getName());
        
        
        String nameImage = file.getName() + System.currentTimeMillis() + FileUtils.GetExtension(contentType); 
        String fullPath = path + FileUtils.RUTE_USER_IMAGE + "/" + nameImage;
        
        file.write(fullPath); // Copiamos la imagen en la ruta especificada
        UserModel user = new UserModel(new UserModel(idUserS), name, fecha, email, nickname, password, FileUtils.RUTE_USER_IMAGE + "/" + nameImage);
        try {
			UserModel result=UserDAO.updateUser(user);
                        
                        if (result!=null){
                            
                            //session.setAttribute("ID User", result.getId());
                            session.setAttribute("Usernickname", result.getNickname());
                            session.setAttribute("Password", result.getPassword());
                            session.setAttribute("UserEmail", result.getUserEmail());
                            session.setAttribute("UserName", result.getUserName());
                            session.setAttribute("Userdob", result.getUserdob());
                            session.setAttribute("UserImage", result.getUrlImage());
                            response.sendRedirect("Perfil.jsp"); 
                        }else {
                            response.sendRedirect("index.jsp");
                        }
		} catch (Exception e) {
                        //response.sendRedirect("fail.jsp"); 
			e.printStackTrace();
		}
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
