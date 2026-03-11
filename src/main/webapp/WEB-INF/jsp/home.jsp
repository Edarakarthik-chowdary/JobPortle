<%@ include file="navbar.jsp" %>

<link rel="stylesheet"
href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">

<!-- HERO SECTION -->

<div class="hero text-center">

<h1>Find Your Dream Job</h1>

<p class="lead">Search thousands of jobs from top companies</p>

<form action="/searchjobs" class="search-box">

<div class="input-group">

<input type="text"
name="keyword"
class="form-control"
placeholder="Search jobs by skill, company or location">

<button class="btn btn-dark">Search Jobs</button>

</div>

</form>

</div>

<!-- POPULAR COMPANIES -->

<div class="container mt-5">

<h3 class="text-center mb-4">Popular Companies Hiring</h3>

<div class="row text-center">

<div class="col-md-2">Google</div>
<div class="col-md-2">Amazon</div>
<div class="col-md-2">Microsoft</div>
<div class="col-md-2">TCS</div>
<div class="col-md-2">Infosys</div>
<div class="col-md-2">Flipkart</div>

</div>

</div>

<!-- JOB CATEGORIES -->

<div class="container mt-5">

<h3 class="text-center mb-4">Job Categories</h3>

<div class="row text-center">

<div class="col-md-3 mb-3">
<div class="card p-3 shadow">
<h5>Software Development</h5>
<p>Java, Spring Boot, Python</p>
</div>
</div>

<div class="col-md-3 mb-3">
<div class="card p-3 shadow">
<h5>Testing</h5>
<p>Automation, Selenium</p>
</div>
</div>

<div class="col-md-3 mb-3">
<div class="card p-3 shadow">
<h5>Cloud / DevOps</h5>
<p>AWS, Azure, Docker</p>
</div>
</div>

<div class="col-md-3 mb-3">
<div class="card p-3 shadow">
<h5>Data Science</h5>
<p>Python, AI, ML</p>
</div>
</div>

</div>

</div>

<!-- LATEST JOBS -->

<div class="container mt-5">

<h3 class="text-center mb-4">Latest Jobs</h3>

<div class="row">

<div class="col-md-4 mb-3">
<div class="card p-3 shadow">
<h5>Java Developer</h5>
<p>Company: Google</p>
<p>Location: Bangalore</p>
<a href="/joblist" class="btn btn-primary btn-sm">View Job</a>
</div>
</div>

<div class="col-md-4 mb-3">
<div class="card p-3 shadow">
<h5>AWS Engineer</h5>
<p>Company: Amazon</p>
<p>Location: Hyderabad</p>
<a href="/joblist" class="btn btn-primary btn-sm">View Job</a>
</div>
</div>

<div class="col-md-4 mb-3">
<div class="card p-3 shadow">
<h5>Automation Tester</h5>
<p>Company: TCS</p>
<p>Location: Chennai</p>
<a href="/joblist" class="btn btn-primary btn-sm">View Job</a>
</div>
</div>

</div>

</div>

<!-- CALL TO ACTION -->

<div class="cta text-center mt-5 p-5">

<h3>Are You an Employer?</h3>

<p>Post jobs and hire the best talent</p>

<a href="/postjob" class="btn btn-dark">Post a Job</a>

</div>

<style>

.hero{
height:420px;
display:flex;
flex-direction:column;
justify-content:center;
align-items:center;
background:linear-gradient(120deg,#4facfe,#00f2fe);
color:white;
}

.search-box{
width:400px;
margin-top:20px;
}

.cta{
background:#222;
color:white;
}

</style>