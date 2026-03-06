<%@page import="java.sql.Connection"%>
<%@page import="com.db.DBconnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ocean View Resort</title>
<%@include file="component/allcss.jsp"%>
</head>

<body>

<%@include file="component/navbar.jsp"%>

<!-- HERO CAROUSEL -->
<div id="carouselExampleIndicators" class="carousel slide position-relative" data-bs-ride="carousel">

  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="img/Resort2.jpg" class="d-block w-100" alt="">
    </div>
    <div class="carousel-item">
      <img src="img/Resort3.jpg" class="d-block w-100" alt="">
    </div>
    <div class="carousel-item">
      <img src="img/Resort11.jpg" class="d-block w-100" alt="">
    </div>
  </div>

  <!-- Centered Overlay Text -->
  <div class="hero-overlay">
      <h1>Welcome to Ocean View Resort</h1>
      <p>Luxury • Comfort • Relaxation</p>
  </div>
</div>

<!-- FEATURES SECTION -->
<div class="container p-5 section-bg">
    <p class="text-center fs-2 fw-bold mb-5">Why Choose Our Resort</p>

    <div class="row">

        <div class="col-md-6 col-lg-3 mb-4">
            <div class="card paint-card text-center p-4">
                <i class="bi bi-building feature-icon mb-3"></i>
                <h5 class="fw-semibold">Luxury Rooms</h5>
                <p class="text-muted">
                    Premium suites with breathtaking views and world-class comfort.
                </p>
            </div>
        </div>

        <div class="col-md-6 col-lg-3 mb-4">
            <div class="card paint-card text-center p-4">
                <i class="bi bi-water feature-icon mb-3"></i>
                <h5 class="fw-semibold">Infinity Pool</h5>
                <p class="text-muted">
                    Relax in our stunning infinity pool surrounded by nature.
                </p>
            </div>
        </div>

        <div class="col-md-6 col-lg-3 mb-4">
            <div class="card paint-card text-center p-4">
                <i class="bi bi-cup-hot feature-icon mb-3"></i>
                <h5 class="fw-semibold">Fine Dining</h5>
                <p class="text-muted">
                    Taste exceptional cuisine freshly crafted by expert chefs.
                </p>
            </div>
        </div>

        <div class="col-md-6 col-lg-3 mb-4">
            <div class="card paint-card text-center p-4">
                <i class="bi bi-heart-pulse feature-icon mb-3"></i>
                <h5 class="fw-semibold">Spa & Wellness</h5>
                <p class="text-muted">
                    Rejuvenate your body and mind with luxury spa treatments.
                </p>
            </div>
        </div>

    </div>
</div>

<!-- ROOM TYPES SECTION -->
<div class="container p-5 section-bg">
    <p class="text-center fs-2 fw-bold mb-5">Our Room Types</p>

    <div class="row justify-content-center">

        <!-- Single Room -->
        <div class="col-md-6 col-lg-4 mb-4">
            <div class="card paint-card text-center p-4 h-100">
                <i class="bi bi-person feature-icon mb-3"></i>
                <h5 class="fw-semibold">Single Room</h5>
                <h6 class="text-primary mb-3">LKR 9,000 / Night</h6>
                <p class="text-muted">
                    Comfortable room for one guest with air conditioning, Wi-Fi,
                    TV, private bathroom, peaceful relaxing stay.
                </p>
            </div>
        </div>

        <!-- Twin Room -->
        <div class="col-md-6 col-lg-4 mb-4">
            <div class="card paint-card text-center p-4 h-100">
                <i class="bi bi-people feature-icon mb-3"></i>
                <h5 class="fw-semibold">Twin Room</h5>
                <h6 class="text-primary mb-3">LKR 12,000 / Night</h6>
                <p class="text-muted">
                    Spacious room with two single beds, air conditioning, Wi-Fi,
                    TV, private bathroom, balcony, relaxing resort view.
                </p>
            </div>
        </div>

        <!-- Double Room -->
        <div class="col-md-6 col-lg-4 mb-4">
            <div class="card paint-card text-center p-4 h-100">
                <i class="bi bi-heart feature-icon mb-3"></i>
                <h5 class="fw-semibold">Double Room</h5>
                <h6 class="text-primary mb-3">LKR 15,000 / Night</h6>
                <p class="text-muted">
                    Cozy room with one double bed, air conditioning, Wi-Fi,
                    TV, private bathroom, balcony, beach resort access.
                </p>
            </div>
        </div>

    </div>
</div>

<!-- CALL TO ACTION -->
<div class="text-center p-5">
    <h2 class="fw-bold">Experience the Ultimate Getaway</h2>
    <p class="text-muted">Book your stay today and enjoy unforgettable moments.</p>
    <a href="signup.jsp" class="btn btn-primary btn-lg px-5">Reserve Now</a>
</div>

</body>
</html>