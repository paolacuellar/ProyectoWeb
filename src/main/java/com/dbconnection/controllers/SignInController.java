/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dbconnection.controllers;

import com.dbconnection.dao.UserDAO;
import com.dbconnection.models.UserModel;
import com.dbconnection.utils.FileUtils;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

/**
 *
 * @author ae_sq
 */
@WebServlet(name = "SignInController", urlPatterns = {"/SignInController"})
@MultipartConfig(maxFileSize = 1000 * 1000 * 5, maxRequestSize = 1000 * 1000 * 25, fileSizeThreshold = 1000 * 1000)
public class SignInController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String fecha = request.getParameter("dob");// Obtenemos el nombre debe coincidir con el name del input
        String email = request.getParameter("email");
        String password = request.getParameter("pass");  // Obtenemos el contraseña debe coincidir con el name del input
        String nickname = request.getParameter("nickname");
        
        String path = request.getServletContext().getRealPath("");
        
        File fileSaveDir = new File(path + FileUtils.RUTE_USER_IMAGE); // Obtenemos la Direccion donde deseamos guardarlo
        // Sino existe el directorio la creamos
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdir();
        }

        
        Part file = request.getPart("image"); // Obtenemos la imagen, debe coincidir con el name del input
        String contentType = file.getContentType();
        System.out.println("Imagen: " + file.getName());
        
        
        String nameImage = file.getName() + System.currentTimeMillis() + FileUtils.GetExtension(contentType); // Remplazamos el nombre que tiene para que no existan duplicados
        String fullPath = path + FileUtils.RUTE_USER_IMAGE + "/" + nameImage;
        
        file.write(fullPath); // Copiamos la imagen en la ruta especificada
        UserModel user = new UserModel(name, fecha, email, nickname, password, FileUtils.RUTE_USER_IMAGE + "/" + nameImage);
        try {
			UserDAO.insertUser(user);
                        response.sendRedirect("index.jsp"); // Retornamos al index
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
