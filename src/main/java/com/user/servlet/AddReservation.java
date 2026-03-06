package com.user.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.dao.ReservationDAO;
import com.db.DBconnect;
import com.entity.Reservation;
import com.entity.User;

@WebServlet("/addReservation")
public class AddReservation extends HttpServlet {

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {

		try {

			HttpSession session = req.getSession();
			User user = (User) session.getAttribute("userObj");

			int userId = user.getId();

			String address = req.getParameter("address");
			String contact = req.getParameter("contact");
			String roomType = req.getParameter("roomType");

			Date checkIn = Date.valueOf(req.getParameter("checkIn"));
			Date checkOut = Date.valueOf(req.getParameter("checkOut"));

			Reservation r = new Reservation(userId, address, contact, roomType, checkIn, checkOut);

			Connection conn = DBconnect.getConn();

			ReservationDAO dao = new ReservationDAO(conn);

			boolean f = dao.saveReservation(r);

			if (f) {

				resp.getWriter().println("<script>alert('New Reservation added Successfully');"
						+ "window.location='userDashboard';</script>");

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}