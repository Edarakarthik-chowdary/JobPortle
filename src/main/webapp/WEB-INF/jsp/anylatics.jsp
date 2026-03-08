<%@ include file="navbar.jsp" %>

<h2>Admin Analytics</h2>

<%@ page import="java.util.*" %>

<%

List<String> companies=(List<String>)request.getAttribute("companies");
List<Integer> counts=(List<Integer>)request.getAttribute("counts");

for(int i=0;i<companies.size();i++){

%>

<p>

<b><%= companies.get(i) %></b>

posted

<b><%= counts.get(i) %></b>

jobs

</p>

<%

}

%>