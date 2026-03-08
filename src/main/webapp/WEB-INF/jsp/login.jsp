<!DOCTYPE html>
<html>

<head>
<title>Applicant Login</title>

<link rel="stylesheet"
href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">

<style>

body{
background:linear-gradient(120deg,#00c5c8,#0072ff);
height:100vh;
display:flex;
justify-content:center;
align-items:center;
font-family:Arial;
}

.loginbox{
width:350px;
background:white;
padding:30px;
border-radius:10px;
box-shadow:0px 4px 12px rgba(0,0,0,0.2);
}

</style>

</head>

<body>

<div class="loginbox">

<h3 class="text-center">Applicant Login</h3>

<!-- Error Message -->

<%
String error = (String)request.getAttribute("error");

if(error != null){
%>

<div class="alert alert-danger">
<%= error %>
</div>

<%
}
%>

<form action="/loginuser" method="post">

<div class="mb-3">

<label>Username</label>
<input type="text"
class="form-control"
name="username"
required>

</div>

<div class="mb-3">

<label>Password</label>
<input type="password"
class="form-control"
name="password"
required>

</div>

<div class="form-check mb-3">

<input class="form-check-input"
type="checkbox"
name="remember">

<label class="form-check-label">
Remember Me
</label>

</div>

<button class="btn btn-success w-100">
Login
</button>

</form>

<p class="text-center mt-3">
Not a member yet?
<a href="/register">Register</a>
</p>

</div>

</body>

</html>