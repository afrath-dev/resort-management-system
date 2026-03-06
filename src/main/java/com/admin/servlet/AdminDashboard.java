package com.admin.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.dao.AdminDAO;
import com.db.DBconnect;
import com.entity.AdminReservationView;

@WebServlet("/adminDashboard")
public class AdminDashboard extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        // 🔐 Session Protection
        HttpSession session = req.getSession(false);

        if (session == null || session.getAttribute("adminObj") == null) {
            resp.sendRedirect(req.getContextPath() + "/admin.jsp");
            return;
        }
        
        // Disable browser cache (VERY IMPORTANT)
        resp.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        resp.setHeader("Pragma", "no-cache");
        resp.setDateHeader("Expires", 0);


        try (Connection conn = DBconnect.getConn()) {

            AdminDAO dao = new AdminDAO(conn);

            // Dashboard counts
            int userCount = dao.getUserCount();
            int reservationCount = dao.getReservationCount();

            // Fetch reservation details
            List<AdminReservationView> reservationList =
                    dao.getAllReservations();

            req.setAttribute("userCount", userCount);
            req.setAttribute("reservationCount", reservationCount);
            req.setAttribute("reservationList", reservationList);

            req.getRequestDispatcher("/admin/adminDBoard.jsp")
               .forward(req, resp);

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect(req.getContextPath() + "/admin.jsp");
        }
    }
}