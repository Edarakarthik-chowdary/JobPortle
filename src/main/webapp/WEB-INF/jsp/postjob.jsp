<%@ include file="navbar.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>Post Job</title>

<link rel="stylesheet"
href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">

</head>

<body class="bg-light">

<div class="container mt-5">

<h2 class="text-center">Post New Job</h2>

<form action="/postjob" method="post">

<div class="mb-3">
<label>Company</label>
<input type="text" name="company" class="form-control">
</div>

<div class="mb-3">
<label>Location</label>
<input type="text" name="location" class="form-control">
</div>

<div class="mb-3">
<label>Skills</label>
<input type="text" name="skills" class="form-control">
</div>

<div class="mb-3">
<label>Company Type</label>
<select name="companyType" class="form-control">
<option value="MNC">MNC</option>
<option value="Startup">Startup</option>
<option value="Product">Product Based</option>
<option value="Service">Service Based</option>
</select>
</div>

<div class="mb-3">
<label>Salary</label>
<input type="number" name="salary" class="form-control">
</div>

<button type="submit" class="btn btn-primary">Post Job</button>

</form>

</div>

</body>
</html>