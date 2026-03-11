<%@ page contentType="text/html;charset=UTF-8" %>
<jsp:include page="navbar.jsp" />

<!DOCTYPE html>
<html>
<head>

<title>Admin Dashboard</title>

<link rel="stylesheet"
href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">

<style>

body{
background:#f4f6f9;
font-family:Arial, Helvetica, sans-serif;
}

.dashboard-title{
text-align:center;
margin-top:40px;
margin-bottom:40px;
font-weight:bold;
}

.stats-card{
border:none;
border-radius:12px;
box-shadow:0 4px 12px rgba(0,0,0,0.15);
transition:0.3s;
height:150px;
display:flex;
flex-direction:column;
justify-content:center;
align-items:center;
}

.stats-card:hover{
transform:translateY(-6px);
box-shadow:0 6px 18px rgba(0,0,0,0.2);
}

.stats-number{
font-size:42px;
font-weight:bold;
}

.jobs{
color:#0d6efd;
}

.apps{
color:#198754;
}

.users{
color:#ff9800;
}

</style>

</head>

<body>

<div class="container">

<h2 class="dashboard-title">Job Portal Dashboard</h2>

<div class="row text-center">

<div class="col-md-4 mb-4">

<div class="card stats-card">

<h5>Total Jobs</h5>

<div class="stats-number jobs">
${jobs}
</div>

</div>

</div>

<div class="col-md-4 mb-4">

<div class="card stats-card">

<h5>Total Applications</h5>

<div class="stats-number apps">
${applications}
</div>

</div>

</div>

<div class="col-md-4 mb-4">

<div class="card stats-card">

<h5>Total Users</h5>

<div class="stats-number users">
${users}
</div>

</div>

</div>

</div>

</div>

</body>
</html>