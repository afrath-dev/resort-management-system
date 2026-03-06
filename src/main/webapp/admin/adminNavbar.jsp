<nav class="navbar navbar-expand-lg navbar-dark fixed-top custom-navbar">
  <div class="container">
    <a class="navbar-brand fw-bold fs-4" href="index.jsp">
      <i class="fa-solid fa-umbrella-beach me-2"></i>Ocean View Resort
    </a>

    <button class="navbar-toggler" type="button" 
        data-bs-toggle="collapse" 
        data-bs-target="#navbarSupportedContent">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav ms-auto mb-2 mb-lg-0">

        <li class="nav-item">
		    <a class="nav-link"
		       href="<%= request.getContextPath() %>/index.jsp">
		        Home
		    </a>
		</li>
		
		<li class="nav-item"><a class="nav-link"
			href="<%=request.getContextPath()%>/admin/helpAdmin.jsp"> Help? </a></li>
		
		<li class="nav-item ms-3">
		    <a class="btn btn-danger px-3"
		       href="<%= request.getContextPath() %>/adminLogout">
		        Logout
		    </a>
		</li>

      </ul>
    </div>
  </div>
</nav>