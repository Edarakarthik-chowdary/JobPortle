<%@ include file="navbar.jsp" %>
<!DOCTYPE html>
<html>
<head>

<title>Employer Login</title>

<link rel="stylesheet"
href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">

<style>

body{
background:#f4f6f9;
}

.login-card{
border:none;
border-radius:10px;
box-shadow:0 4px 12px rgba(0,0,0,0.15);
}

</style>

</head>

<body>

<div class="container mt-5">

<div class="row justify-content-center">

<div class="col-md-4">

<div class="card login-card p-4">

<h4 class="text-center mb-3">Employer Login</h4>

<!-- Error message -->

<c:if test="${error != null}">
<div class="alert alert-danger">
${error}
</div>
</c:if>

<form action="/employerlogin" method="post">

<div class="mb-3">

<label class="form-label">Username</label>
<input type="text" name="username" class="form-control" required>

</div>

<div class="mb-3">

<label class="form-label">Password</label>
<input type="password" name="password" class="form-control" required>

</div>

<div class="form-check mb-3">

<input type="checkbox" class="form-check-input" name="remember">
<label class="form-check-label">Remember Me</label>

</div>

<div class="d-grid">

<button class="btn btn-primary">Login</button>

</div>

</form>

<br>

<div class="text-center">

<a href="/">Back to Home</a>

</div>

</div>

</div>

</div>

</div>

</body>
</html>