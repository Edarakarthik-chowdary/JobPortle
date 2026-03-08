<%@ include file="navbar.jsp" %>
<!DOCTYPE html>
<html>
<head>

<title>Employer Login</title>

<link rel="stylesheet"
href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">

</head>

<body class="bg-light">

<nav class="navbar navbar-dark bg-primary">
<div class="container">
<h3 class="text-white">Employer Login</h3>
</div>
</nav>

<div class="container mt-5">

<div class="row justify-content-center">

<div class="col-md-4">

<div class="card shadow p-4">

<h4 class="text-center mb-3">Employer Login</h4>

<form action="/employerlogin" method="post">

<div class="mb-3">

<label class="form-label">Username</label>
<input type="text" name="username" class="form-control" required>

</div>

<div class="mb-3">

<label class="form-label">Password</label>
<input type="password" name="password" class="form-control" required>

</div>

<div class="d-grid">

<input type="submit" value="Login" class="btn btn-primary">

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