<%@ page import="java.sql.*" %>

<h2>Applied Jobs</h2>

<%
ResultSet rs = (ResultSet)request.getAttribute("jobs");

while(rs.next()){
%>

<p>

<b><%= rs.getString("company") %></b>

<a href="/resumes/<%= rs.getString("resume") %>" target="_blank">
Download Resume
</a>

</p>

<%
}
%>