<%@ include file="navbar.jsp" %>

<html>
<head>

<title>Interview Details</title>

<style>

.container{
width:50%;
margin:auto;
margin-top:40px;
}

.table{
width:100%;
border-collapse:collapse;
background:white;
box-shadow:0 3px 8px rgba(0,0,0,0.2);
}

.table td{
padding:12px;
border-bottom:1px solid #ddd;
}

.title{
text-align:center;
margin-bottom:20px;
}

</style>

</head>

<body>

<div class="container">

<h2 class="title">Interview Details</h2>

<table class="table">

<tr>
<td><b>Username</b></td>
<td>${username}</td>
</tr>

<tr>
<td><b>Company</b></td>
<td>${company}</td>
</tr>

<tr>
<td><b>Vacancies</b></td>
<td>${vacancies}</td>
</tr>

<tr>
<td><b>Salary</b></td>
<td>${salary}</td>
</tr>

<tr>
<td><b>Job Post</b></td>
<td>${jobpost}</td>
</tr>

<tr>
<td><b>Location</b></td>
<td>${location}</td>
</tr>

<tr>
<td><b>Interview Date</b></td>
<td>${date}</td>
</tr>

<tr>
<td><b>Interview Time</b></td>
<td>${time}</td>
</tr>

</table>

</div>

</body>
</html>