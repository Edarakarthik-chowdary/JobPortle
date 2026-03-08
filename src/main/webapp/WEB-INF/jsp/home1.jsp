<%@ include file="navbar.jsp" %>
<!DOCTYPE html>
<html>
<head>

<title>Candidate Home Page</title>

<style>
body{
background:#00c5c8;
font-family:Arial;
}

.box{
width:400px;
margin:80px auto;
background:white;
padding:20px;
border-radius:10px;
}

select,input{
width:100%;
padding:8px;
margin:5px 0;
}

button{
padding:8px;
background:#007bff;
color:white;
border:none;
cursor:pointer;
}

button:hover{
background:#0056b3;
}
</style>

</head>

<body>

<h2 style="text-align:center;">CANDIDATE HOME PAGE</h2>

<div class="box">

<form action="/joblist" method="get">

<label>Location</label>
<select name="location">
<option>Noida</option>
<option>Bangalore</option>
</select>

<br><br>

<label>Skills</label>
<select name="skills">
<option>Java</option>
<option>Python</option>
</select>

<br><br>

<label>Functional Area</label>
<select name="area">
<option>BPO</option>
<option>Software</option>
</select>

<br><br>

<label>Key Word</label>
<input type="text" name="keyword">

<br><br>

<button type="submit">SEARCH</button>

</form>

<br>

<a href="/applications">
<button>VIEW APPLICATIONS</button>
</a>

<br><br>

<a href="/logout">Logout</a>

</div>

</body>
</html>