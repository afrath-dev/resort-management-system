package com.user.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.dao.ReservationDAO;
import com.db.DBconnect;
import com.entity.Reservation;
import com.entity.User;

@WebServlet("/userDashboard")
public class UserDashboard extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);

        if (session == null || session.getAttribute("userObj") == null) {
            resp.sendRedirect("user.jsp");
            return;
        }

        try {

            // Get logged in user
            User user = (User) session.getAttribute("userObj");

            int userId = user.getId();

            Connection conn = DBconnect.getConn();

            ReservationDAO dao = new ReservationDAO(conn);

            // Get reservations of this user
            List<Reservation> reservationList =
                    dao.getReservationsByUser(userId);

            // Send data to JSP
            req.setAttribute("reservationList", reservationList);

            req.getRequestDispatcher("user/userDBoard.jsp")
                    .forward(req, resp);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}