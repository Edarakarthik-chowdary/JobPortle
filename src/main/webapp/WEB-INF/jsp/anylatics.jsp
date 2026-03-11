<%@ page import="java.sql.*" %>
<%@ include file="navbar.jsp" %>

<link rel="stylesheet"
href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">

<div class="container mt-4">

<h2 class="mb-4">Admin Dashboard</h2>

<!-- DASHBOARD CARDS -->

<div class="row mb-4">

<div class="col-md-4">
<div class="card bg-primary text-white">
<div class="card-body">
<h5>Total Users</h5>
<p><%= request.getAttribute("userCount") %></p>
</div>
</div>
</div>

<div class="col-md-4">
<div class="card bg-success text-white">
<div class="card-body">
<h5>Total Jobs</h5>
<p><%= request.getAttribute("jobCount") %></p>
</div>
</div>
</div>

<div class="col-md-4">
<div class="card bg-warning text-dark">
<div class="card-body">
<h5>Total Applications</h5>
<p><%= request.getAttribute("appCount") %></p>
</div>
</div>
</div>

</div>

<!-- USERS -->

<h3>Users</h3>

<table class="table table-bordered table-striped">

<tr>
<th>ID</th>
<th>Email</th>
<th>Username</th>
</tr>

<%
ResultSet users = (ResultSet)request.getAttribute("users");

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

</table>

<br>

<!-- JOBS -->

<h3>Jobs</h3>

<table class="table table-bordered table-striped">

<tr>
<th>ID</th>
<th>Company</th>
<th>Location</th>
<th>Skills</th>
<th>Salary</th>
</tr>

<%
ResultSet jobs = (ResultSet)request.getAttribute("jobs");

if(jobs != null){
while(jobs.next()){
%>

<tr>
<td><%= jobs.getInt("id") %></td>
<td><%= jobs.getString("company") %></td>
<td><%= jobs.getString("location") %></td>
<td><%= jobs.getString("skills") %></td>
<td><%= jobs.getInt("salary") %></td>
</tr>

<%
}}
%>

</table>

<br>

<!-- APPLICATIONS -->

<h3>Applications</h3>

<table class="table table-bordered table-striped">

<tr>
<th>ID</th>
<th>Username</th>
<th>Job ID</th>
<th>Status</th>
</tr>

<%
ResultSet apps = (ResultSet)request.getAttribute("applications");

if(apps != null){
while(apps.next()){
%>

<tr>
<td><%= apps.getInt("id") %></td>
<td><%= apps.getString("username") %></td>
<td><%= apps.getInt("job_id") %></td>
<td><%= apps.getString("status") %></td>
</tr>

<%
}}
%>

</table>

</div>