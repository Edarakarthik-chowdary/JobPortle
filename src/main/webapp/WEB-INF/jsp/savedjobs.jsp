<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List" %>
<%@ page import="com.pack.ecom.OnlineJobPortal.users.Job" %>
<jsp:include page="navbar.jsp"/>

<h2>Saved Jobs</h2>

<%
List<Job> jobs = (List<Job>)request.getAttribute("jobs");

if(jobs != null){
for(Job job : jobs){
%>

<div>

<h3><%= job.getCompany() %></h3>

<p>Location: <%= job.getLocation() %></p>

<p>Skills: <%= job.getSkills() %></p>

<p>Salary: ₹ <%= job.getSalary() %></p>

<a href="/jobdetails?id=<%= job.getId() %>">
View Job
</a>
<a href="/removesavedjob?id=<%= job.getId() %>">
Remove
</a>

</div>

<hr>

<%
}
}
%>