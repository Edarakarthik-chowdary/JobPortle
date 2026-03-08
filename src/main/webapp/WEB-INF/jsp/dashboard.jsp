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
}

.dashboard-title{
text-align:center;
margin-top:30px;
margin-bottom:30px;
font-weight:bold;
}

.stats-card{
border:none;
border-radius:12px;
box-shadow:0 4px 10px rgba(0,0,0,0.15);
transition:0.3s;
}

.stats-card:hover{
transform:translateY(-5px);
}

.stats-number{
font-size:40px;
font-weight:bold;
}

.jobs{
color:#007bff;
}

.apps{
color:#28a745;
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

<div class="card stats-card p-4">

<h5>Total Jobs</h5>

<div class="stats-number jobs">
${jobs}
</div>

</div>

</div>

<div class="col-md-4 mb-4">

<div class="card stats-card p-4">

<h5>Total Applications</h5>

<div class="stats-number apps">
${applications}
</div>

</div>

</div>

<div class="col-md-4 mb-4">

<div class="card stats-card p-4">

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