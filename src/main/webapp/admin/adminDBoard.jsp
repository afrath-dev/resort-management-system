<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
if (session.getAttribute("adminObj") == null) {
    response.sendRedirect("../admin.jsp");
    return;
}

response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard | Ocean View Resort</title>

<%@include file="../component/allcss.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<style>
body {
    background-color: #f4f6f9;
    padding-top: 90px;
}

/* Card Styling */
.dashboard-card {
    box-shadow: 0 4px 20px rgba(0,0,0,0.1);
    border-radius: 15px;
    transition: 0.3s ease;
}

.dashboard-card:hover {
    transform: translateY(-4px);
}

/* Equal height row */
.dashboard-row {
    min-height: 420px;
}

/* Welcome Section */
.welcome-box {
    background: linear-gradient(135deg, #0d6efd, #198754);
    color: white;
    padding: 25px;
    border-radius: 15px;
    box-shadow: 0 6px 20px rgba(0,0,0,0.15);
}
</style>

</head>

<body>

<%@include file="adminNavbar.jsp"%>

<div class="container mt-5">

    <!-- ================= WELCOME NOTE ================= -->
    <div class="welcome-box mb-5 text-center">
        <h4>Welcome, Administrator 👋</h4>
        <p class="mb-0">
            Manage users, monitor reservations and oversee system performance in one place.
        </p>
    </div>

    <!-- ================= DASHBOARD GRID ================= -->
    <div class="row align-items-stretch">

	    <!-- LEFT SIDE (Cards stacked) -->
	    <div class="col-md-4 d-flex flex-column justify-content-between">
	
	        <div class="card paint-card p-4 mb-4 flex-fill">
	            <div class="text-success text-center">
	                <i class="fas fa-users fa-3x mb-3"></i>
	                <h5>Total Users</h5>
	                <h2>${userCount}</h2>
	            </div>
	        </div>
	
	        <div class="card paint-card p-4 flex-fill">
	            <div class="text-primary text-center">
	                <i class="fas fa-hotel fa-3x mb-3"></i>
	                <h5>Total Reservations</h5>
	                <h2>${reservationCount}</h2>
	            </div>
	        </div>
	
	    </div>
	
	    <!-- RIGHT SIDE (Chart same height as left side) -->
	    <div class="col-md-8">
	        <div class="card paint-card p-4 h-100">
	            <h5 class="text-center mb-3">System Overview</h5>
	            <div style="height:300px;">
	                <canvas id="dashboardChart"></canvas>
	            </div>
	        </div>
	    </div>
	
	</div>

    <!-- ================= TABLE SECTION ================= -->
    <div class="row mt-5">
        <div class="col-md-12">
            <div class="card dashboard-card p-4">
                <div class="d-flex justify-content-between align-items-center mb-3">
				    <h5 class="mb-0">All Reservations</h5>
				
				    <input type="text"
				           id="reservationSearch"
				           class="form-control w-25"
				           placeholder="Search reservations...">
				</div>

                <div class="table-responsive">
                    <table id="reservationTable"
					       class="table table-bordered table-hover text-center align-middle">
                        <thead class="table-dark">
                            <tr>
                                <th>Full Name</th>
                                <th>Address</th>
                                <th>Contact</th>
                                <th>Room Type</th>
                                <th>Check-in</th>
                                <th>Check-out</th>
                                <th>Status</th>
                            </tr>
                        </thead>

                        <tbody>

                            <c:forEach var="r" items="${reservationList}">
                                <tr>
                                    <td>${r.fullName}</td>
                                    <td>${r.address}</td>
                                    <td>${r.contactNo}</td>
                                    <td>${r.roomType}</td>
                                    <td>${r.checkIn}</td>
                                    <td>${r.checkOut}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${r.status == 'Approved'}">
                                                <span class="badge bg-success">Approved</span>
                                            </c:when>
                                            <c:when test="${r.status == 'Cancelled'}">
                                                <span class="badge bg-danger">Cancelled</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="badge bg-warning text-dark">
                                                    ${r.status}
                                                </span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                </tr>
                            </c:forEach>

                            <c:if test="${empty reservationList}">
                                <tr>
                                    <td colspan="7">No reservations found</td>
                                </tr>
                            </c:if>

                        </tbody>
                    </table>
                </div>

            </div>
        </div>
    </div>

</div>

<!-- ================= CHART ================= -->
<script>
var ctx = document.getElementById('dashboardChart').getContext('2d');

new Chart(ctx, {
    type: 'bar',
    data: {
        labels: ['Users', 'Reservations'],
        datasets: [{
            label: 'System Data',
            data: [${userCount}, ${reservationCount}],
            backgroundColor: ['#198754', '#0d6efd']
        }]
    },
    options: {
        responsive: true,
        maintainAspectRatio: false,
        plugins: {
            legend: { display: false }
        }
    }
});
</script>

<!-- ================= TABLE SEARCH ================= -->
<script>
document.getElementById("reservationSearch").addEventListener("keyup", function () {

    let filter = this.value.toLowerCase();
    let table = document.getElementById("reservationTable");
    let rows = table.getElementsByTagName("tr");

    for (let i = 1; i < rows.length; i++) { // skip header
        let rowText = rows[i].innerText.toLowerCase();

        if (rowText.includes(filter)) {
            rows[i].style.display = "";
        } else {
            rows[i].style.display = "none";
        }
    }
});
</script>

</body>
</html>