/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dbconnection.controllers;

import com.dbconnection.dao.NoteDAO;
import com.dbconnection.models.HashtagModel;
import com.dbconnection.models.NoteModel;
import com.dbconnection.models.UserModel;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;



@WebServlet(name = "CreateNoteController", urlPatterns = {"/CreateNoteController"})
public class CreateNoteController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        String description = request.getParameter("description1");
        String stringHashtag=request.getParameter("hashtag");
        int hashtag=Integer.parseInt(stringHashtag,10);
        Integer idUserS = (Integer)session.getAttribute("ID User");
        //int idUser=Integer.parseInt(session.getAttribute("ID User").toString());

        NoteModel note = new NoteModel(description, new UserModel(idUserS), new HashtagModel(hashtag));
        try {
			NoteDAO.insertNote(note);
                        response.sendRedirect("./LogInController"); 
		} catch (Exception e) {
			e.printStackTrace();
		}
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
