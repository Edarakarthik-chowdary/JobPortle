<%@ page import="java.sql.*" %>
<%@ include file="navbar.jsp" %>
<h2>Admin Dashboard</h2>

<h3>Users</h3>

<table border="1">

<tr>
<th>ID</th>
<th>Email</th>
<th>Username</th>
</tr>

<%
ResultSet users = (ResultSet)request.getAttribute("users");

while(users.next()){
%>

<tr>

<td><%= users.getInt("id") %></td>
<td><%= users.getString("email") %></td>
<td><%= users.getString("username") %></td>

</tr>

<%
}
%>

</table>

<br><br>

<h3>Jobs</h3>

<table border="1">

<tr>
<th>ID</th>
<th>Company</th>
<th>Location</th>
<th>Skills</th>
<th>Salary</th>
</tr>

<%
ResultSet jobs = (ResultSet)request.getAttribute("jobs");

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
}
%>

</table>

<br><br>

<h3>Applications</h3>

<table border="1">

<tr>
<th>ID</th>
<th>Username</th>
<th>Job ID</th>
<th>Status</th>
</tr>

<%
ResultSet apps = (ResultSet)request.getAttribute("applications");

while(apps.next()){
%>

<tr>

<td><%= apps.getInt("id") %></td>
<td><%= apps.getString("username") %></td>
<td><%= apps.getInt("job_id") %></td>
<td><%= apps.getString("status") %></td>

</tr>

<%
}
%>

</table>