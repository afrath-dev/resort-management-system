<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Help | Ocean View Resort</title>

<%@include file="component/allcss.jsp"%>

<style>

body{
    background-color:#f4f6f9;
    padding-top:90px;
}

.help-card{
    border-radius:15px;
    box-shadow:0 4px 20px rgba(0,0,0,0.1);
}

.help-header{
    background:linear-gradient(135deg,#0d6efd,#198754);
    color:white;
    padding:35px;
    border-radius:15px;
    box-shadow:0 6px 20px rgba(0,0,0,0.15);
}

</style>

</head>

<body>

<%@include file="component/navbar.jsp"%>

<div class="container mt-5">

    <!-- PAGE HEADER -->
    <div class="help-header text-center mb-5">
        <h2>Help & User Guide</h2>
        <p class="mb-0">
            Learn how to access and use the Ocean View Resort reservation system.
        </p>
    </div>

    <div class="row">

        <!-- USER GUIDE -->
        <div class="col-md-6 mb-4">

            <div class="card help-card p-4">

                <h4 class="text-primary mb-3">
                    User Guide
                </h4>

                <ol class="text-muted">

                    <li>
                        Click the <b>User</b> option in the navigation bar.
                    </li>

                    <li>
                        If you are a new guest, click <b>Create one</b> to register.
                    </li>

                    <li>
                        Enter your personal details including:
                        <ul>
                            <li>Full Name</li>
                            <li>Email</li>
                            <li>Password</li>
                            <li>Address</li>
                            <li>Contact Number</li>
                        </ul>
                    </li>

                    <li>
                        Select your preferred <b>Room Type</b>.
                    </li>

                    <li>
                        Choose your <b>Check-in</b> and <b>Check-out</b> dates.
                    </li>

                    <li>
                        Click <b>Register & Book</b> to complete the reservation.
                    </li>

                    <li>
                        After registration you can login and view your
                        reservation details in your <b>User Dashboard</b>.
                    </li>

                </ol>

            </div>

        </div>


        <!-- ADMIN GUIDE -->
        <div class="col-md-6 mb-4">

            <div class="card help-card p-4">

                <h4 class="text-danger mb-3">
                    Admin Guide
                </h4>

                <ol class="text-muted">

                    <li>
                        Click the <b>Admin</b> option in the navigation bar.
                    </li>

                    <li>
                        Enter the administrator <b>Email</b> and <b>Password</b>.
                    </li>

                    <li>
                        After successful login you will access the
                        <b>Admin Dashboard</b>.
                    </li>

                    <li>
                        The admin dashboard allows you to:
                        <ul>
                            <li>View all reservations</li>
                            <li>Monitor booking status</li>
                            <li>Approve reservations</li>
                            <li>Delete cancelled reservations</li>
                        </ul>
                    </li>

                    <li>
                        The dashboard also displays system statistics
                        such as total users and reservations.
                    </li>

                </ol>

            </div>

        </div>

    </div>

</div>

</body>
</html>