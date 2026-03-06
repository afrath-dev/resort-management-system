package com.user.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.dao.ReservationDAO;
import com.db.DBconnect;

@WebServlet("/processPayment")
public class ProcessPayment extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

        int id = Integer.parseInt(req.getParameter("resId"));

        try(Connection conn = DBconnect.getConn()){

            ReservationDAO dao = new ReservationDAO(conn);

            dao.updateStatus(id,"Approved");

            PrintWriter out = resp.getWriter();
            resp.setContentType("text/html");

            resp.sendRedirect("receipt?id=" + id);

        }catch(Exception e){
            e.printStackTrace();
        }
    }
}