<%@ include file="navbar.jsp" %>

<!DOCTYPE html>
<html>

<head>

<title>Candidate Registration</title>

<link rel="stylesheet"
href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">

<style>

body{
background:#f2f2f2;
}

.formbox{
width:420px;
margin:80px auto;
background:white;
padding:30px;
border-radius:10px;
box-shadow:0px 0px 12px rgba(0,0,0,0.2);
}

h2{
text-align:center;
margin-bottom:20px;
}

</style>

</head>

<body>

<div class="formbox">

<h2>Candidate Registration</h2>

<form action="/register" method="post">

<div class="mb-3">

<label class="form-label">Email</label>

<input type="email"
class="form-control"
name="email"
required>

</div>

<div class="mb-3">

<label class="form-label">First Name</label>

<input type="text"
class="form-control"
name="fname"
required>

</div>

<div class="mb-3">

<label class="form-label">Last Name</label>

<input type="text"
class="form-control"
name="lname"
required>

</div>

<div class="mb-3">

<label class="form-label">Username</label>

<input type="text"
class="form-control"
name="username"
required>

</div>

<div class="mb-3">

<label class="form-label">Password</label>

<input type="password"
class="form-control"
name="password"
required>

</div>

<div class="mb-3">

<label class="form-label">Gender</label>

<br>

<input type="radio" name="gender" value="Male" required> Male

<input type="radio" name="gender" value="Female" required> Female

</div>

<button type="submit"
class="btn btn-primary w-100">

Register

</button>

</form>

<div class="text-center mt-3">

<a href="/login">Already have an account? Login</a>

</div>

</div>

</body>

</html>