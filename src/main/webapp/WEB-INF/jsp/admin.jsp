<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ include file="navbar.jsp" %>

<link rel="stylesheet"
href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>

body{
background:#f4f6f9;
font-family:Arial, Helvetica, sans-serif;
}

.dashboard-title{
font-weight:bold;
margin-bottom:30px;
}

.stats-card{
border-radius:12px;
padding:20px;
color:white;
box-shadow:0 4px 12px rgba(0,0,0,0.2);
}

.stats-number{
font-size:32px;
font-weight:bold;
}

.users-card{
background:#007bff;
}

.jobs-card{
background:#28a745;
}

.apps-card{
background:#ff9800;
}

.section-title{
margin-top:35px;
margin-bottom:15px;
font-weight:bold;
}

.card-box{
padding:20px;
border-radius:10px;
background:white;
box-shadow:0 3px 10px rgba(0,0,0,0.15);
margin-bottom:25px;
}

table{
font-size:14px;
}

</style>

<div class="container mt-4">

<h2 class="dashboard-title">
<i class="fa-solid fa-chart-line"></i> Admin Dashboard
</h2>

<!-- DASHBOARD STATS -->

<div class="row">

<div class="col-md-4">

<div class="stats-card users-card">

<i class="fa-solid fa-users fa-2x"></i>

<p>Total Users</p>

<%
ResultSet users = (ResultSet)request.getAttribute("users");

int userCount=0;
if(users!=null){
while(users.next()){
userCount++;
}
users.beforeFirst();
}
%>

<div class="stats-number"><%= userCount %></div>

</div>

</div>

<div class="col-md-4">

<div class="stats-card jobs-card">

<i class="fa-solid fa-briefcase fa-2x"></i>

<p>Total Jobs</p>

<%
ResultSet jobs = (ResultSet)request.getAttribute("jobs");

int jobCount=0;
if(jobs!=null){
while(jobs.next()){
jobCount++;
}
jobs.beforeFirst();
}
%>

<div class="stats-number"><%= jobCount %></div>

</div>

</div>

<div class="col-md-4">

<div class="stats-card apps-card">

<i class="fa-solid fa-file-lines fa-2x"></i>

<p>Total Applications</p>

<%
ResultSet apps = (ResultSet)request.getAttribute("applications");

int appCount=0;
if(apps!=null){
while(apps.next()){
appCount++;
}
apps.beforeFirst();
}
%>

<div class="stats-number"><%= appCount %></div>

</div>

</div>

</div>

<!-- USERS TABLE -->

<div class="card-box">

<h4 class="section-title">
<i class="fa-solid fa-users"></i> Users
</h4>

<table class="table table-bordered table-striped table-hover">

<thead class="table-dark">

<tr>
<th>ID</th>
<th>Email</th>
<th>Username</th>
</tr>

</thead>

<tbody>

<%
if(users != null){
while(users.next()){
%>

<tr>

<td><%= users.getInt("id") %></td>
<td><%= users.getString("email") %></td>
<td><%= users.getString("username") %></td>

</tr>

<%
}}
%>

</tbody>

</table>

</div>

<!-- JOBS TABLE -->

<div class="card-box">

<h4 class="section-title">
<i class="fa-solid fa-briefcase"></i> Jobs
</h4>

<table class="table table-bordered table-striped table-hover">

<thead class="table-dark">

<tr>
<th>ID</th>
<th>Company</th>
<th>Location</th>
<th>Skills</th>
<th>Salary</th>
</tr>

</thead>

<tbody>

<%
if(jobs != null){
while(jobs.next()){
%>

<tr>

<td><%= jobs.getInt("id") %></td>
<td><%= jobs.getString("company") %></td>
<td><%= jobs.getString("location") %></td>
<td><%= jobs.getString("skills") %></td>
<td>₹ <%= jobs.getInt("salary") %></td>

</tr>

<%
}}
%>

</tbody>

</table>

</div>

<!-- APPLICATIONS TABLE -->

<div class="card-box">

<h4 class="section-title">
<i class="fa-solid fa-file-lines"></i> Applications
</h4>

<table class="table table-bordered table-striped table-hover">

<thead class="table-dark">

<tr>
<th>ID</th>
<th>Username</th>
<th>Job ID</th>
<th>Status</th>
</tr>

</thead>

<tbody>

<%
if(apps != null){
while(apps.next()){
%>

<tr>

<td><%= apps.getInt("id") %></td>
<td><%= apps.getString("username") %></td>
<td><%= apps.getInt("job_id") %></td>
<td>
<span class="badge bg-success">
<%= apps.getString("status") %>
</span>
</td>

</tr>

<%
}}
%>

</tbody>

</table>

</div>

</div>