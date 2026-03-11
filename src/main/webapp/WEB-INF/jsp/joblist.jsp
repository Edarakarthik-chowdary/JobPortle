<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List" %>
<%@ page import="com.pack.ecom.OnlineJobPortal.users.Job" %>
<%@ include file="navbar.jsp" %>

<html>
<head>

<title>Available Jobs</title>

<style>

body{
font-family:Arial;
background:#f3f4f6;
margin:0;
}

.container{
width:85%;
margin:auto;
margin-top:25px;
}

h2{
margin-bottom:20px;
color:#222;
}

/* SEARCH BAR */

.top-bar{
display:flex;
gap:15px;
flex-wrap:wrap;
margin-bottom:25px;
}

.top-bar input{
padding:9px;
border-radius:6px;
border:1px solid #ccc;
width:220px;
}

.top-bar select{
padding:9px;
border-radius:6px;
border:1px solid #ccc;
}

.top-bar button{
padding:9px 14px;
background:#0073e6;
color:white;
border:none;
border-radius:6px;
cursor:pointer;
}

/* JOB CARD */

.job-card{
background:white;
padding:22px;
margin-bottom:18px;
border-radius:14px;
box-shadow:0px 6px 18px rgba(0,0,0,0.12);
display:flex;
align-items:flex-start;
gap:18px;
transition:all 0.25s ease;
}

.job-card:hover{
transform:translateY(-5px);
box-shadow:0 12px 25px rgba(0,0,0,0.15);
}

/* COMPANY LOGO */

.logo{
width:60px;
height:60px;
min-width:60px;
object-fit:contain;
border-radius:10px;
border:1px solid #eee;
padding:6px;
background:white;
opacity:0;
transition:opacity 0.4s ease;
}

.logo.loaded{
opacity:1;
}

/* JOB INFO */

.job-info{
flex:1;
}

.job-title{
font-size:18px;
font-weight:bold;
color:#0073e6;
display:flex;
align-items:center;
gap:8px;
}

.badge{
background:#e3f2fd;
color:#0073e6;
padding:4px 8px;
border-radius:12px;
font-size:12px;
font-weight:bold;
}

.meta{
margin-top:6px;
font-size:14px;
color:#555;
}

.salary{
color:#28a745;
font-weight:bold;
font-size:16px;
margin-top:6px;
}

.posted{
font-size:12px;
color:#888;
}

/* BUTTONS */

.buttons{
margin-top:12px;
}

.apply-btn{
background:#0073e6;
color:white;
padding:9px 16px;
border-radius:8px;
text-decoration:none;
margin-right:8px;
}

.save-btn{
background:#28a745;
color:white;
padding:9px 16px;
border-radius:8px;
text-decoration:none;
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

<input type="text" id="searchInput" placeholder="Search jobs...">

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

<div id="jobList">

<%
List<Job> jobs = (List<Job>) request.getAttribute("jobs");

if(jobs != null && !jobs.isEmpty()){

for(Job job : jobs){
%>

<div class="job-card job-item">

<img class="logo company-logo"
data-company="<%= job.getCompany() %>"
src="/images/default.png">

<div class="job-info">

<div class="job-title">
<span><%= job.getCompany() %></span>
<span class="badge"><%= job.getType() %></span>
</div>

<p class="meta">
Location: <%= job.getLocation() %>
</p>

<p class="meta skills">
Skills: <%= job.getSkills() %>
</p>

<p class="salary">
₹ <%= String.format("%,d", job.getSalary()) %> / year
</p>

<p class="posted">
Posted recently
</p>

<div class="buttons">

<a class="apply-btn"
href="/jobdetails?id=<%= job.getId() %>">
Apply Now
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

</div>

<script>

/* LOGO LOADER */

document.querySelectorAll(".company-logo").forEach(function(img){

let company = img.getAttribute("data-company");

if(company){

company = company.toLowerCase().replace(/\s+/g,'');

let logoUrl = "https://logo.clearbit.com/" + company + ".com";

let testImage = new Image();

testImage.onload = function(){
img.src = logoUrl;
img.classList.add("loaded");
};

testImage.onerror = function(){
img.src = "/images/default.png";
img.classList.add("loaded");
};

testImage.src = logoUrl;

}

});


/* LIVE SEARCH */

document.getElementById("searchInput").addEventListener("keyup", function(){

let value = this.value.toLowerCase();

document.querySelectorAll(".job-item").forEach(function(card){

let text = card.innerText.toLowerCase();

card.style.display = text.includes(value) ? "flex" : "none";

});

});

</script>

</body>
</html>