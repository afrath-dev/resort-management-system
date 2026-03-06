package com.user.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.dao.UserDAO;
import com.db.DBconnect;
import com.entity.User;

@WebServlet("/userLogin")
public class UserLogin extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String email = req.getParameter("email");
        String password = req.getParameter("password");

        HttpSession session = req.getSession();

        // 🔐 Basic Validation
        if (email == null || password == null ||
            email.trim().isEmpty() || password.trim().isEmpty()) {

            PrintWriter out = resp.getWriter();
            resp.setContentType("text/html");

            out.println("<script>");
            out.println("alert('All fields are required!');");
            out.println("window.location='user.jsp';");
            out.println("</script>");
            return;
        }

        try (Connection conn = DBconnect.getConn()) {

            UserDAO dao = new UserDAO(conn);
            User user = dao.login(email, password);

            if (user != null) {

                session.setAttribute("userObj", user);
                resp.sendRedirect("userDashboard");

            } else {

                PrintWriter out = resp.getWriter();
                resp.setContentType("text/html");

                out.println("<script>");
                out.println("alert('Invalid Email or Password');");
                out.println("window.location='user.jsp';");
                out.println("</script>");
            }

        } catch (Exception e) {

            e.printStackTrace();

            PrintWriter out = resp.getWriter();
            resp.setContentType("text/html");

            out.println("<script>");
            out.println("alert('Server Error! Please try again.');");
            out.println("window.location='user.jsp';");
            out.println("</script>");
        }
    }
}