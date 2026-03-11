<!DOCTYPE html>
<html>

<head>

<title>Applicant Login</title>

<link rel="stylesheet"
href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>

body{
background:linear-gradient(120deg,#00c5c8,#0072ff);
height:100vh;
display:flex;
justify-content:center;
align-items:center;
font-family:Arial, Helvetica, sans-serif;
}

.loginbox{
width:380px;
background:white;
padding:35px;
border-radius:12px;
box-shadow:0px 8px 20px rgba(0,0,0,0.25);
}

.login-title{
font-weight:bold;
margin-bottom:25px;
}

.form-control{
border-radius:8px;
}

.input-group{
position:relative;
}

.password-toggle{
position:absolute;
right:12px;
top:38px;
cursor:pointer;
color:#555;
}

.btn-login{
background:#0072ff;
border:none;
border-radius:8px;
}

.btn-login:hover{
background:#0056d6;
}

.register-link a{
text-decoration:none;
font-weight:bold;
}

</style>

</head>

<body>

<div class="loginbox">

<h3 class="text-center login-title">
<i class="fa-solid fa-user"></i> Applicant Login
</h3>

<!-- ERROR MESSAGE -->

<%
String error = (String)request.getAttribute("error");

if(error != null){
%>

<div class="alert alert-danger text-center">
<%= error %>
</div>

<%
}
%>

<form action="/loginuser" method="post">

<div class="mb-3">

<label class="form-label">
<i class="fa-solid fa-user"></i> Username
</label>

<input type="text"
class="form-control"
name="username"
placeholder="Enter username"
required>

</div>

<div class="mb-3 input-group">

<label class="form-label">
<i class="fa-solid fa-lock"></i> Password
</label>

<input type="password"
class="form-control"
id="password"
name="password"
placeholder="Enter password"
required>

<i class="fa-solid fa-eye password-toggle"
onclick="togglePassword()"></i>

</div>

<div class="form-check mb-3">

<input class="form-check-input"
type="checkbox"
name="remember">

<label class="form-check-label">
Remember Me
</label>

</div>

<button class="btn btn-login text-white w-100">
<i class="fa-solid fa-right-to-bracket"></i> Login
</button>

</form>

<p class="text-center mt-3 register-link">

Not a member yet?

<a href="/register">Register</a>

</p>

</div>

<script>

function togglePassword(){

let password = document.getElementById("password");

if(password.type === "password"){
password.type = "text";
}else{
password.type = "password";
}

}

</script>

</body>

</html>