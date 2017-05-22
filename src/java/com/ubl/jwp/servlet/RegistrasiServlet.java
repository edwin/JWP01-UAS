/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ubl.jwp.servlet;

import com.ubl.jwp.service.UserService;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author edwin < edwinkun at gmail dot com >
 */
public class RegistrasiServlet extends HttpServlet {

    private UserService service = new UserService();
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String nama = request.getParameter("nama");
        String id = request.getParameter("id");
        
        service.saveUser(id, username, password, nama);
        
        response.sendRedirect("/JWP05UTS/admin/RegistrasiServlet");
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // ambil id
        String id = request.getParameter("id");
        if(id != null) {
            String[] user = service.getUser(Integer.parseInt(id));
            request.setAttribute("id", user[0]);
            request.setAttribute("username", user[1]);
            request.setAttribute("nama", user[3]);
        }
        
        // ambil hapus
        String hapus = request.getParameter("hapus");
        if(hapus != null) {
            service.deleteUser(Integer.parseInt(hapus));
        }

        request.setAttribute("data", service.getUsers());
        
        // forward content ke template
        getServletContext().getRequestDispatcher("/admin/registrasi.jsp").forward(request, response);
    }
}
