<%@ include file="navbar.jsp" %>

<div class="hero">

<h1>Find Your Dream Job</h1>

<p>Search thousands of jobs from top companies</p>

<form action="/searchjobs" class="search-box">

<input type="text" name="keyword" placeholder="Search jobs by skill or company">

<button>Search Jobs</button>

</form>

</div>

<style>

.hero{
height:400px;
display:flex;
flex-direction:column;
justify-content:center;
align-items:center;
background:linear-gradient(120deg,#4facfe,#00f2fe);
color:white;
text-align:center;
}

.hero h1{
font-size:50px;
margin-bottom:10px;
}

.search-box input{
padding:10px;
width:300px;
border-radius:5px;
border:none;
}

.search-box button{
padding:10px 20px;
background:#222;
color:white;
border:none;
border-radius:5px;
}

</style>