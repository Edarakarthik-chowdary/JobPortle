<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="com.pack.ecom.OnlineJobPortal.users.Job" %>
<%@ include file="navbar.jsp" %>

<html>
<head>

<title>Job Details</title>

<style>

body{
font-family: Arial;
background:#f5f5f5;
}

.container{
width:60%;
margin:auto;
margin-top:30px;
}

.job-card{
background:white;
padding:25px;
border-radius:10px;
box-shadow:0px 3px 8px rgba(0,0,0,0.2);
}

.logo{
width:120px;
height:120px;
object-fit:contain;
margin-bottom:15px;
}

.apply-btn{
background:#0073e6;
color:white;
padding:10px 20px;
border:none;
border-radius:6px;
cursor:pointer;
}

.apply-btn:hover{
background:#005bb5;
}

.file-input{
margin-top:10px;
margin-bottom:15px;
}

</style>

</head>

<body>

<div class="container">

<h2>Job Details</h2>

<%
Job job = (Job) request.getAttribute("job");

if(job != null){
%>

<div class="job-card">

<img class="logo"
src="/images/<%= job.getLogo() %>"
onerror="this.src='/images/default.png'">

<h3><%= job.getCompany() %></h3>

<p><b>Location:</b> <%= job.getLocation() %></p>

<p><b>Skills:</b> <%= job.getSkills() %></p>

<p><b>Salary:</b> ₹ <%= job.getSalary() %></p>

<p><b>Description:</b> <%= job.getDescription() %></p>

<hr>

<form action="/applyjob" method="post" enctype="multipart/form-data">

<input type="hidden" name="id" value="<%= job.getId() %>">

<label><b>Upload Resume</b></label><br>

<input class="file-input" type="file" name="resume" required>

<br>

<button class="apply-btn" type="submit">
Apply Job
</button>

</form>

</div>

<%
}else{
%>

<p>Job not found</p>

<%
}
%>

</div>

</body>
</html>