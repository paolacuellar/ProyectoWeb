/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dbconnection.controllers;

import com.dbconnection.dao.NoteDAO;
import com.dbconnection.models.NoteModel;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet(name = "UpdateNoteController", urlPatterns = {"/UpdateNoteController"})
public class UpdateNoteController extends HttpServlet {



    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtenemos las notas del DAO
        List<NoteModel> notes = null;
        String idUserS = request.getParameter("idUser");
        int idUser=Integer.parseInt(idUserS);
        NoteModel note = new NoteModel(idUser);
		try {
			notes = NoteDAO.getNotes(note);
		} catch (Exception e) {
			e.printStackTrace();
		}
        // Lo agregamos como atributo al request
        request.setAttribute("notes", notes);
        // Enviamos el request a dashboard.jsp con la informacion
        request.getRequestDispatcher("dashboard.jsp").forward(request, response);        
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idNoteS = request.getParameter("idNote");
        String description = request.getParameter("description");
        NoteModel note = new NoteModel(description, idNoteS);
        
            try {
		NoteModel result=NoteDAO.updateNote(note);
                        if (result!=null){
                            HttpSession session = request.getSession();
                            session.setAttribute("idNote", result.getId());
                            session.setAttribute("descriptionN", result.getDescription());
                            session.setAttribute("dateN", result.getDate());

                            request.getRequestDispatcher("dashboard.jsp").forward(request,response);
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
