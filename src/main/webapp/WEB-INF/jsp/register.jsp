<%@ include file="navbar.jsp" %>

<!DOCTYPE html>
<html>

<head>

<title>Candidate Registration</title>

<link rel="stylesheet"
href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>

body{
background:linear-gradient(120deg,#00c5c8,#0072ff);
min-height:100vh;
font-family:Arial, Helvetica, sans-serif;
}

.formbox{
width:420px;
margin:70px auto;
background:white;
padding:35px;
border-radius:12px;
box-shadow:0px 8px 20px rgba(0,0,0,0.25);
}

h2{
text-align:center;
margin-bottom:25px;
font-weight:bold;
}

.form-control{
border-radius:8px;
}

.password-toggle{
position:absolute;
right:15px;
top:38px;
cursor:pointer;
color:#555;
}

.input-group{
position:relative;
}

.btn-register{
background:#0072ff;
border:none;
border-radius:8px;
}

.btn-register:hover{
background:#0056d6;
}

.gender-box{
display:flex;
gap:20px;
margin-top:5px;
}

.login-link a{
text-decoration:none;
font-weight:bold;
}

</style>

</head>

<body>

<div class="formbox">

<h2>
<i class="fa-solid fa-user-plus"></i> Candidate Registration
</h2>

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

<form action="/register" method="post">

<div class="mb-3">

<label class="form-label">
<i class="fa-solid fa-envelope"></i> Email
</label>

<input type="email"
class="form-control"
name="email"
placeholder="Enter your email"
required>

</div>

<div class="mb-3">

<label class="form-label">
<i class="fa-solid fa-user"></i> First Name
</label>

<input type="text"
class="form-control"
name="fname"
placeholder="Enter first name"
required>

</div>

<div class="mb-3">

<label class="form-label">
<i class="fa-solid fa-user"></i> Last Name
</label>

<input type="text"
class="form-control"
name="lname"
placeholder="Enter last name"
required>

</div>

<div class="mb-3">

<label class="form-label">
<i class="fa-solid fa-user-tag"></i> Username
</label>

<input type="text"
class="form-control"
name="username"
placeholder="Choose a username"
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
placeholder="Create password"
required>

<i class="fa-solid fa-eye password-toggle"
onclick="togglePassword()"></i>

</div>

<div class="mb-3">

<label class="form-label">
<i class="fa-solid fa-venus-mars"></i> Gender
</label>

<div class="gender-box">

<div>
<input type="radio" name="gender" value="Male" required> Male
</div>

<div>
<input type="radio" name="gender" value="Female" required> Female
</div>

</div>

</div>

<button type="submit"
class="btn btn-register text-white w-100">

<i class="fa-solid fa-user-plus"></i> Register

</button>

</form>

<div class="text-center mt-3 login-link">

Already have an account?

<a href="/login">Login</a>

</div>

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