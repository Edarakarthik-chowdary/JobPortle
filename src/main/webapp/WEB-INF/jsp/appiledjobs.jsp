<%@ page import="java.sql.*" %>
<%@ include file="navbar.jsp" %>

<link rel="stylesheet"
href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">

<div class="container mt-4">

<h2 class="mb-4">Applied Jobs</h2>

<table class="table table-bordered table-striped">

<tr>
<th>Company</th>
<th>Resume</th>
</tr>

<%
ResultSet rs = (ResultSet)request.getAttribute("jobs");

if(rs != null){
while(rs.next()){
%>

<tr>

<td><%= rs.getString("company") %></td>

<td>
<a class="btn btn-sm btn-primary"
href="/resumes/<%= rs.getString("resume") %>"
target="_blank">
Download Resume
</a>
</td>

</tr>

<%
}}
%>

</table>

</div>