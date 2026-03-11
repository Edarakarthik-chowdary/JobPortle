<%@ page contentType="text/html;charset=UTF-8" %>

<%
String username = (String) session.getAttribute("username");
String initial = "";
if(username != null && username.length() > 0){
initial = username.substring(0,1).toUpperCase();
}
%>

<link rel="stylesheet"
href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">

<style>

.navbar{
background: linear-gradient(90deg,#141e30,#243b55);
padding:12px 0;
box-shadow:0 3px 10px rgba(0,0,0,0.3);
}

.navbar-brand{
font-size:24px;
font-weight:bold;
letter-spacing:1px;
color:#00e5ff !important;
}

.nav-link{
color:white !important;
margin-right:15px;
font-weight:500;
transition:0.3s;
}

.nav-link:hover{
color:#00e5ff !important;
transform:translateY(-1px);
}

.search-box{
width:240px;
border-radius:20px;
padding-left:15px;
}

.btn-info{
border-radius:20px;
}

.profile-circle{
width:35px;
height:35px;
border-radius:50%;
background:#00e5ff;
color:black;
display:flex;
align-items:center;
justify-content:center;
font-weight:bold;
margin-right:6px;
}

.dropdown-toggle{
display:flex;
align-items:center;
}

.dropdown-menu{
border-radius:10px;
box-shadow:0 5px 15px rgba(0,0,0,0.2);
}

</style>

<nav class="navbar navbar-expand-lg navbar-dark">

<div class="container">

<a class="navbar-brand" href="/">GETJOBS</a>

<button class="navbar-toggler"
type="button"
data-bs-toggle="collapse"
data-bs-target="#navbarNav">

<span class="navbar-toggler-icon"></span>

</button>

<div class="collapse navbar-collapse" id="navbarNav">

<ul class="navbar-nav me-auto">

<li class="nav-item">
<a class="nav-link" href="/">Home</a>
</li>

<li class="nav-item">
<a class="nav-link" href="/jobsearch">Job Search</a>
</li>

<li class="nav-item">
<a class="nav-link" href="/joblist">Jobs</a>
</li>

<li class="nav-item">
<a class="nav-link" href="/dashboard">Dashboard</a>
</li>

<li class="nav-item">
<a class="nav-link" href="/postjob">Post Job</a>
</li>

</ul>

<!-- SEARCH -->

<form class="d-flex me-3" action="/searchjobs">

<input class="form-control search-box me-2"
type="search"
placeholder="Search jobs..."
name="keyword">

<button class="btn btn-info">Search</button>

</form>

<ul class="navbar-nav">

<% if(username != null){ %>

<li class="nav-item dropdown">

<a class="nav-link dropdown-toggle"
href="#"
role="button"
data-bs-toggle="dropdown">

<div class="profile-circle">
<%=initial%>
</div>

<%=username%>

</a>

<ul class="dropdown-menu dropdown-menu-end">

<li>
<a class="dropdown-item" href="/savedjobs">
Saved Jobs
</a>
</li>

<li>
<a class="dropdown-item" href="/myapplications">
My Applications
</a>
</li>

<li><hr class="dropdown-divider"></li>

<li>
<a class="dropdown-item text-danger" href="/logout">
Logout
</a>
</li>

</ul>

</li>

<% } else { %>

<li class="nav-item">
<a class="nav-link" href="/login">Login</a>
</li>

<% } %>

</ul>

</div>

</div>

</nav>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>