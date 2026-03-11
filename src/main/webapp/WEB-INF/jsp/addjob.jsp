<%@ include file="navbar.jsp" %>

<!DOCTYPE html>
<html>

<head>

<title>Post New Job</title>

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
width:520px;
margin:60px auto;
background:white;
padding:40px;
border-radius:14px;
box-shadow:0px 10px 25px rgba(0,0,0,0.25);
}

h2{
text-align:center;
margin-bottom:30px;
font-weight:bold;
}

.form-control{
border-radius:8px;
padding:10px;
}

.btn-job{
background:#0072ff;
border:none;
border-radius:8px;
font-size:16px;
padding:10px;
}

.btn-job:hover{
background:#0056d6;
}

.logo-preview{
width:70px;
height:70px;
margin-top:10px;
border-radius:8px;
border:1px solid #ddd;
padding:6px;
object-fit:contain;
}

</style>

</head>

<body>

<div class="formbox">

<h2>
<i class="fa-solid fa-briefcase"></i> Post New Job
</h2>

<form action="/postjob" method="post">

<div class="mb-3">

<label class="form-label">
<i class="fa-solid fa-building"></i> Company
</label>

<input type="text"
id="company"
name="company"
class="form-control"
placeholder="Company name"
required
onkeyup="generateLogo()">

</div>

<div class="mb-3">

<label class="form-label">
<i class="fa-solid fa-location-dot"></i> Location
</label>

<input type="text"
name="location"
class="form-control"
placeholder="Job location"
required>

</div>

<div class="mb-3">

<label class="form-label">
<i class="fa-solid fa-code"></i> Skills
</label>

<input type="text"
name="skills"
class="form-control"
placeholder="Java, Spring Boot, SQL"
required>

</div>

<div class="mb-3">

<label class="form-label">
<i class="fa-solid fa-indian-rupee-sign"></i> Salary
</label>

<input type="number"
name="salary"
class="form-control"
placeholder="Salary per year"
required>

</div>

<div class="mb-3">

<label class="form-label">
<i class="fa-solid fa-align-left"></i> Description
</label>

<textarea
name="description"
class="form-control"
rows="3"
placeholder="Job description">
</textarea>

</div>

<div class="mb-3">

<label class="form-label">
<i class="fa-solid fa-industry"></i> Company Type
</label>

<select name="type" class="form-control">

<option value="MNC">MNC</option>
<option value="Startup">Startup</option>
<option value="Product-Based">Product-Based</option>
<option value="Service-Based">Service-Based</option>

</select>

</div>

<div class="mb-3">

<label class="form-label">
<i class="fa-solid fa-image"></i> Logo URL
</label>

<input type="text"
id="logo"
name="logo"
class="form-control"
placeholder="Auto generated if empty">

<img id="logoPreview"
class="logo-preview"
src="/images/default.png">

</div>

<button class="btn btn-job text-white w-100">

<i class="fa-solid fa-plus"></i> Post Job

</button>

</form>

</div>

<script>

function generateLogo(){

let company=document.getElementById("company").value.trim();

if(company.length>2){

let logo="https://logo.clearbit.com/"+company.toLowerCase()+".com";

document.getElementById("logo").value=logo;

document.getElementById("logoPreview").src=logo;

}

}

</script>

</body>

</html>