package com.user.servlet;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.dao.ReservationDAO;
import com.db.DBconnect;

@WebServlet("/cancelReservation")
public class CancelReservation extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

        int resNum = Integer.parseInt(req.getParameter("id"));

        try {

            Connection conn = DBconnect.getConn();
            ReservationDAO dao = new ReservationDAO(conn);

            boolean f = dao.cancelReservation(resNum);

            if(f){
                resp.sendRedirect("userDashboard");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}