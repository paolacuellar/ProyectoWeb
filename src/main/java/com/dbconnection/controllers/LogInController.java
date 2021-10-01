/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dbconnection.controllers;

import com.dbconnection.dao.UserDAO;
import com.dbconnection.models.UserModel;
import com.dbconnection.utils.FileUtils;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author PaolaAlejandra
 */
@WebServlet(name = "LogInController", urlPatterns = {"/LogInController"})
public class LogInController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nickname = request.getParameter("nickname");
        String password = request.getParameter("pass"); 
        UserModel user = new UserModel(nickname, password);
        
            try {
		UserModel result=UserDAO.logInUser(user);
                        if (result!=null){
                            HttpSession session = request.getSession();
                            session.setAttribute("ID User", result.getId());
                            session.setAttribute("Usernickname", result.getNickname());
                            session.setAttribute("Password", result.getPassword());
                            session.setAttribute("UserEmail", result.getUserEmail());
                            session.setAttribute("UserName", result.getUserName());
                            session.setAttribute("Userdob", result.getUserdob());
                            session.setAttribute("UserImage", result.getUrlImage());
                            request.getRequestDispatcher("loggedPrueba.jsp").forward(request,response);
                        }else {
                            response.sendRedirect("fail.jsp");
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
