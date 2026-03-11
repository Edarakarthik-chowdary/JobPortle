<%@ include file="navbar.jsp" %>

<html>
<head>

<title>Interview Details</title>

<style>

body{
font-family:Arial;
background:#f4f6f9;
margin:0;
}

.container{
width:45%;
margin:auto;
margin-top:50px;
}

.card{
background:white;
border-radius:12px;
box-shadow:0 4px 12px rgba(0,0,0,0.15);
overflow:hidden;
}

.header{
background:#0073e6;
color:white;
padding:15px;
text-align:center;
font-size:22px;
font-weight:bold;
}

.table{
width:100%;
border-collapse:collapse;
}

.table tr:nth-child(even){
background:#f9f9f9;
}

.table td{
padding:14px;
font-size:15px;
border-bottom:1px solid #eee;
}

.label{
font-weight:bold;
color:#444;
width:40%;
}

.value{
color:#222;
}

.highlight{
color:#28a745;
font-weight:bold;
}

</style>

</head>

<body>

<div class="container">

<div class="card">

<div class="header">
Interview Details
</div>

<table class="table">

<tr>
<td class="label">Username</td>
<td class="value">${username}</td>
</tr>

<tr>
<td class="label">Company</td>
<td class="value">${company}</td>
</tr>

<tr>
<td class="label">Vacancies</td>
<td class="value">${vacancies}</td>
</tr>

<tr>
<td class="label">Salary</td>
<td class="value highlight">₹ ${salary}</td>
</tr>

<tr>
<td class="label">Job Post</td>
<td class="value">${jobpost}</td>
</tr>

<tr>
<td class="label">Location</td>
<td class="value">${location}</td>
</tr>

<tr>
<td class="label">Interview Date</td>
<td class="value">${date}</td>
</tr>

<tr>
<td class="label">Interview Time</td>
<td class="value">${time}</td>
</tr>

</table>

</div>

</div>

</body>
</html>