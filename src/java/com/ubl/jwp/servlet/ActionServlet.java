package com.ubl.jwp.servlet;

import com.ubl.jwp.service.UserService;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * <pre>
 *  com.ubl.jwp.servlet.ActionServlet 
 * </pre>
 *
 * @author edwin < edwinkun at gmail dot com >
 * Apr 12, 2017 10:31:53 AM
 *
 */
public class ActionServlet extends HttpServlet {

    private UserService service = new UserService();
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // tangkap username dan password
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        // misalkan berhasil, maka forward ke halaman admin kemudian berikan session
        if(service.login(username, password) > 0) {
            HttpSession session = request.getSession();
            session.setAttribute("username", username); // set session dengan parameter "username"
            
            response.sendRedirect("admin/RegistrasiServlet");  
        } else {
            // gagal login, arahkan ke index.jsp
            response.sendRedirect("index.jsp?error=fail");  
        }
        
    }
    
}
