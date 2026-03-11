<%@ include file="navbar.jsp" %>
<!DOCTYPE html>
<html>
<head>

<title>Candidate Home Page</title>

<link rel="stylesheet"
href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">

<style>

body{
background:#f4f6f9;
}

.search-box{
max-width:500px;
margin:80px auto;
background:white;
padding:30px;
border-radius:10px;
box-shadow:0 4px 10px rgba(0,0,0,0.1);
}

</style>

</head>

<body>

<div class="container">

<h2 class="text-center mt-4">Candidate Job Search</h2>

<div class="search-box">

<form action="/joblist" method="get">

<div class="mb-3">

<label class="form-label">Location</label>

<select name="location" class="form-control">
<option value="">Select Location</option>
<option>Noida</option>
<option>Bangalore</option>
<option>Hyderabad</option>
<option>Chennai</option>
</select>

</div>

<div class="mb-3">

<label class="form-label">Skills</label>

<select name="skills" class="form-control">
<option value="">Select Skill</option>
<option>Java</option>
<option>Python</option>
<option>Testing</option>
<option>AWS</option>
</select>

</div>

<div class="mb-3">

<label class="form-label">Functional Area</label>

<select name="area" class="form-control">
<option value="">Select Area</option>
<option>BPO</option>
<option>Software</option>
<option>DevOps</option>
<option>Data Science</option>
</select>

</div>

<div class="mb-3">

<label class="form-label">Keyword</label>

<input type="text"
name="keyword"
class="form-control"
placeholder="Enter skill or company">

</div>

<div class="d-grid mb-3">

<button class="btn btn-primary">
Search Jobs
</button>

</div>

</form>

<div class="d-grid gap-2">

<a href="/applications" class="btn btn-success">
View Applications
</a>

<a href="/logout" class="btn btn-danger">
Logout
</a>

</div>

</div>

</div>

</body>
</html>