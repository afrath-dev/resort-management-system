package com.user.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.ReservationDAO;
import com.dao.UserDAO;
import com.db.DBconnect;
import com.entity.Reservation;
import com.entity.User;

@WebServlet("/user_register")
public class UserRegister extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
	        throws ServletException, IOException {

	    resp.setContentType("text/html");
	    PrintWriter out = resp.getWriter();

	    Connection conn = null;

	    try {

	        // USER DATA
	        String fullName = req.getParameter("fullName");
	        String email = req.getParameter("email");
	        String password = req.getParameter("password");

	        // RESERVATION DATA
	        String address = req.getParameter("address");
	        String contact = req.getParameter("contact");
	        String roomType = req.getParameter("roomType");
	        Date checkIn = Date.valueOf(req.getParameter("checkIn"));
	        Date checkOut = Date.valueOf(req.getParameter("checkOut"));

	        conn = DBconnect.getConn();

	        
	        conn.setAutoCommit(false);

	        // Insert User
	        UserDAO udao = new UserDAO(conn);
	        int userId = udao.register(new User(fullName, email, password));

	        if (userId <= 0) {
	            throw new Exception("User Insert Failed");
	        }

	        // Insert Reservation
	        ReservationDAO rdao = new ReservationDAO(conn);
	        Reservation r = new Reservation(userId, address, contact,
	                roomType, checkIn, checkOut);

	        boolean reservationSaved = rdao.saveReservation(r);

	        if (!reservationSaved) {
	            throw new Exception("Reservation Insert Failed");
	        }

	        // If both succeed → COMMIT
	        conn.commit();

	        out.println("<script>");
	        out.println("alert('Registration & Booking Successful!');");
	        out.println("window.location='user.jsp';");
	        out.println("</script>");

	    } catch (Exception e) {

	        try {
	            if (conn != null) {
	                conn.rollback();
	            }
	        } catch (Exception ex) {
	            ex.printStackTrace();
	        }

	        out.println("<script>");
	        out.println("alert('Registration & Booking Failed!');");
	        out.println("window.location='signup.jsp';");
	        out.println("</script>");

	    } finally {

	        try {
	            if (conn != null) {
	                conn.setAutoCommit(true);
	                conn.close();
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	}
}
