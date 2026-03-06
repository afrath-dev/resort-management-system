package com.user.servlet;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.dao.ReservationDAO;
import com.db.DBconnect;
import com.entity.Reservation;

@WebServlet("/receipt")
public class ReceiptPage extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("id"));

        try (Connection conn = DBconnect.getConn()) {

            ReservationDAO dao = new ReservationDAO(conn);
            Reservation r = dao.getReservationById(id);

            req.setAttribute("reservation", r);

            req.getRequestDispatcher("user/receipt.jsp").forward(req, resp);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}