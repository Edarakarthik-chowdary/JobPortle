<%@ page import="java.util.*" %>
<%@ page import="com.pack.ecom.OnlineJobPortal.users.Job" %>
<%@ include file="navbar.jsp" %>

<!DOCTYPE html>
<html>

<head>

<title>Available Jobs</title>

<link rel="stylesheet"
href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">

</head>

<body class="bg-light">

<div class="container mt-5">

<h2 class="text-center mb-4">Available Jobs</h2>

<div class="row">

<%
List<Job> jobs = (List<Job>)request.getAttribute("jobs");

if(jobs != null && !jobs.isEmpty()){

for(Job job : jobs){
%>

<div class="col-md-4 mb-4">

<div class="card shadow h-100">

<img src="/images/<%= job.getLogo() %>"
class="card-img-top"
style="height:150px;object-fit:contain;"
onerror="this.src='/images/default.png'">

<div class="card-body">

<h5 class="card-title">
<%= job.getCompany() %>
</h5>

<p class="card-text">

<strong>Location:</strong>
<%= job.getLocation() %>

<br>

<strong>Skills:</strong>
<%= job.getSkills() %>

<br>

<strong>Salary:</strong>
₹ <%= job.getSalary() %>

</p>

<a href="/jobdetails?id=<%= job.getId() %>"
class="btn btn-primary">

View Details

</a>

</div>

</div>

</div>

<%
}

}else{
%>

<div class="text-center">
<h4>No jobs available</h4>
</div>

<%
}
%>

</div>

</div>

</body>

</html>