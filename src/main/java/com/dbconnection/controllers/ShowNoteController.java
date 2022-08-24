/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dbconnection.controllers;

import com.dbconnection.dao.HashtagDAO;
import com.dbconnection.dao.NoteDAO;
import com.dbconnection.models.HashtagModel;
import com.dbconnection.models.NoteModel;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author PaolaAlejandra
 */
@WebServlet(name = "ShowNoteController", urlPatterns = {"/ShowNoteController"})
public class ShowNoteController extends HttpServlet {


    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int idNoteS=Integer.parseInt(request.getParameter("id"));
        NoteModel element = null;
        List<HashtagModel> hashtags= null;
        try {
            element = NoteDAO.getNote(idNoteS);
            hashtags = HashtagDAO.getHashtags();
        } catch (Exception ex) {
            Logger.getLogger(ShowNoteController.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.setAttribute("Note",element);
        request.setAttribute("idNote",idNoteS);
        request.setAttribute("hashtags", hashtags);
        request.getRequestDispatcher("Nota.jsp").forward(request,response);
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
