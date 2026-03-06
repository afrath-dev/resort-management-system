package com.admin.servlet;

import java.io.IOException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/adminLogout")
public class AdminLogout extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

        HttpSession session = req.getSession(false);

        if (session != null) {
            session.removeAttribute("adminObj");
            session.invalidate();   // 🔥 Destroy session completely
        }

        resp.sendRedirect(req.getContextPath() + "/admin.jsp");
    }
}