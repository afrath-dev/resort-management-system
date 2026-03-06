<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.entity.User"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
HttpSession sess = request.getSession(false);

if (sess == null || sess.getAttribute("userObj") == null) {
	response.sendRedirect("../user.jsp");
	return;
}

User user = (User) sess.getAttribute("userObj");

response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Dashboard | Ocean View Resort</title>

<%@include file="../component/allcss.jsp"%>

<style>
body {
	background-color: #f4f6f9;
	padding-top: 90px;
}

/* Welcome Section */
.welcome-box {
	background: linear-gradient(135deg, #0d6efd, #198754);
	color: white;
	padding: 25px;
	border-radius: 15px;
	box-shadow: 0 6px 20px rgba(0, 0, 0, 0.15);
}

/* Dashboard Card */
.dashboard-card {
	box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
	border-radius: 15px;
}

/* Button animation */
.btn-sm {
	transition: 0.2s ease;
}

.btn-sm:hover {
	transform: scale(1.05);
}

.btn-danger:hover{
transform: scale(1.05);
}
</style>

</head>

<body>

	<%@include file="userNavbar.jsp"%>

	<div class="container mt-5">

		<!-- ================= WELCOME NOTE ================= -->

		<div class="welcome-box mb-5 text-center">

			<h4>
				Welcome,
				<%=user.getFullName()%>
				👋
			</h4>

			<p class="mb-0">Here are your reservations and booking status.</p>

		</div>


		<!-- ================= RESERVATION TABLE ================= -->

		<div class="card dashboard-card p-4">

			<h5 class="text-center mb-4">My Reservations</h5>

			<div class="table-responsive">

				<table
					class="table table-bordered table-hover text-center align-middle">

					<thead class="table-dark">

						<tr>
							<th>Reservation No</th>
							<th>Room Type</th>
							<th>Check-in</th>
							<th>Check-out</th>
							<th>Status</th>
							<th>Action</th>
						</tr>

					</thead>

					<tbody>
					
						<jsp:useBean id="now" class="java.util.Date"/>

						<c:forEach var="r" items="${reservationList}">

							<tr>

								<td>${r.id}</td>

								<td>${r.roomType}</td>

								<td>${r.checkIn}</td>

								<td>${r.checkOut}</td>


								<!-- ================= STATUS BADGE ================= -->

								<td><c:choose>
								
										<c:when test="${r.checkIn.time lt now.time && r.status == 'Pending'}">
									        <span class="badge bg-secondary">Check-in Expired</span>
									    </c:when>

										<c:when test="${r.status == 'Approved'}">
											<span class="badge bg-success">Approved</span>
										</c:when>

										<c:when test="${r.status == 'Cancelled'}">
											<span class="badge bg-danger">Cancelled</span>
										</c:when>

										<c:when test="${r.status == 'Pending'}">
											<span class="badge bg-warning text-dark">Pending</span>
										</c:when>

										<c:otherwise>
											<span class="badge bg-secondary">${r.status}</span>
										</c:otherwise>

									</c:choose></td>


								<!-- ================= ACTION BUTTONS ================= -->

								<td>

									<c:choose>
									
									    <c:when test="${r.status == 'Cancelled' && r.checkIn.time lt now.time}">
									
									        <span class="text-secondary fw-bold">Check-in Expired</span>
									
									    </c:when>
									
									    <c:when test="${r.status == 'Cancelled'}">
									
									        <span class="text-danger fw-bold"> Removed </span>
									
									    </c:when>
									
									    <c:when test="${r.status == 'Pending'}">
									
									        <a href="payment?id=${r.id}"
									        	class="btn btn-success btn-sm">
									            Make Payment
									        </a>
									
									        <a href="cancelReservation?id=${r.id}"
									           class="btn btn-danger btn-sm"
									           onclick="return confirm('Do you want to remove this reservation?')">
									           Cancel
									        </a>
									
									    </c:when>
									
									    <c:when test="${r.status == 'Approved'}">
									
									        <span class="text-success fw-bold"> Completed </span>
									
									    </c:when>
									
									</c:choose>
									
								</td>

							</tr>

						</c:forEach>


						<c:if test="${empty reservationList}">

							<tr>
								<td colspan="6">No reservations found</td>
							</tr>

						</c:if>

					</tbody>

				</table>

			</div>

		</div>

	</div>

</body>
</html>