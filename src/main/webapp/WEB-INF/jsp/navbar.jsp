<link rel="stylesheet"
href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">

<style>

.navbar{
background: linear-gradient(90deg,#0f2027,#203a43,#2c5364);
}

.navbar-brand{
font-weight:bold;
font-size:22px;
}

.nav-link{
color:white !important;
margin-right:10px;
}

.nav-link:hover{
color:#00e5ff !important;
}

.search-box{
width:220px;
}

</style>

<nav class="navbar navbar-expand-lg navbar-dark">

<div class="container">

<a class="navbar-brand" href="/">GETJOBS</a>

<button class="navbar-toggler"
type="button"
data-bs-toggle="collapse"
data-bs-target="#navbarNav">

<span class="navbar-toggler-icon"></span>

</button>

<div class="collapse navbar-collapse" id="navbarNav">

<ul class="navbar-nav me-auto">

<li class="nav-item">
<a class="nav-link" href="/">Home</a>
</li>

<li class="nav-item">
<a class="nav-link" href="/jobsearch">Job Search</a>
</li>

<li class="nav-item">
<a class="nav-link" href="/joblist">Jobs</a>
</li>

<li class="nav-item">
<a class="nav-link" href="/dashboard">Dashboard</a>
</li>

<li class="nav-item">
<a class="nav-link" href="/postjob">Post Job</a>
</li>

</ul>

<!-- Search bar -->

<form class="d-flex me-3" action="/searchjobs">

<input class="form-control search-box me-2"
type="search"
placeholder="Search jobs"
name="keyword">

<button class="btn btn-info">Search</button>

</form>

<ul class="navbar-nav">

<li class="nav-item">
<a class="nav-link" href="/login">Login</a>
</li>

<li class="nav-item">
<a class="nav-link" href="/logout">Logout</a>
</li>

</ul>

</div>

</div>

<li class="nav-item">
<a class="nav-link" href="/savedjobs">Saved Jobs</a>
</li>
<li class="nav-item">
<a class="nav-link" href="/myapplications">My Applications</a>
</li>

</nav>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>