<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List" %>
<%@ page import="com.pack.ecom.OnlineJobPortal.users.Job" %>
<%@ include file="navbar.jsp" %>

<html>
<head>

<title>Available Jobs</title>

<style>

body{
font-family: Arial, Helvetica, sans-serif;
background:#f5f5f5;
margin:0;
padding:0;
}

.container{
width:85%;
margin:auto;
margin-top:20px;
}

h2{
margin-bottom:20px;
color:#333;
}

.top-bar{
display:flex;
gap:15px;
flex-wrap:wrap;
margin-bottom:25px;
}

.top-bar form{
display:flex;
gap:8px;
}

.top-bar input,
.top-bar select{
padding:8px;
border-radius:5px;
border:1px solid #ccc;
}

.top-bar button{
padding:8px 12px;
background:#0073e6;
color:white;
border:none;
border-radius:5px;
cursor:pointer;
}

.top-bar button:hover{
background:#005bb5;
}

.job-card{
background:white;
padding:20px;
margin-bottom:15px;
border-radius:10px;
box-shadow:0px 3px 8px rgba(0,0,0,0.15);
display:flex;
align-items:center;
transition:0.2s;
}

.job-card:hover{
transform:scale(1.01);
}

.logo{
width:70px;
height:70px;
margin-right:20px;
object-fit:contain;
border-radius:5px;
}

.job-info{
flex:1;
}

.job-info h3{
margin:0;
color:#0073e6;
}

.job-info p{
margin:5px 0;
}

.buttons{
margin-top:10px;
}

.apply-btn{
background:#0073e6;
color:white;
padding:7px 14px;
border-radius:5px;
text-decoration:none;
margin-right:8px;
}

.apply-btn:hover{
background:#005bb5;
}

.save-btn{
background:#28a745;
color:white;
padding:7px 14px;
border-radius:5px;
text-decoration:none;
}

.save-btn:hover{
background:#1f7a32;
}

.no-jobs{
text-align:center;
font-size:18px;
color:#777;
margin-top:30px;
}

</style>

</head>

<body>

<div class="container">

<h2>Available Jobs</h2>

<div class="top-bar">

<form action="/searchjobs">
<input type="text" name="keyword" placeholder="Search jobs..." required>
<button type="submit">Search</button>
</form>

<form action="/filter">
<select name="skill">
<option value="Java">Java</option>
<option value="Python">Python</option>
<option value="Testing">Testing</option>
</select>
<button type="submit">Skill</button>
</form>

<form action="/filtercompany">
<select name="type">
<option value="MNC">MNC</option>
<option value="Product-Based">Product-Based</option>
<option value="Service-Based">Service-Based</option>
<option value="Startup">Startup</option>
</select>
<button type="submit">Company</button>
</form>

</div>

<%
List<Job> jobs = (List<Job>) request.getAttribute("jobs");

if(jobs != null && !jobs.isEmpty()){

for(Job job : jobs){
%>

<div class="job-card">
	<img class="logo"
	src="/images/<%= job.getLogo() %>">

<div class="job-info">

<h3><%= job.getCompany() %></h3>

<p><b>Location:</b> <%= job.getLocation() %></p>

<p><b>Skills:</b> <%= job.getSkills() %></p>

<p><b>Salary:</b> ₹ <%= job.getSalary() %></p>

<p><b>Company Type:</b> <%= job.getType() %></p>

<div class="buttons">

<a class="apply-btn"
href="/jobdetails?id=<%= job.getId() %>">
View Details
</a>

<a class="save-btn"
href="/savejob?id=<%= job.getId() %>">
Save Job
</a>

</div>

</div>

</div>

<%
}

}else{
%>

<p class="no-jobs">No jobs available</p>

<%
}
%>

</div>

</body>
</html>