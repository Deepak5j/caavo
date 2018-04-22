<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Caavo GDC</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
</style>
</head>
<body style="background-color: #333;">
<%
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
%>

<%	
HttpSession hs=request.getSession(false);
String id=(String)hs.getAttribute("sessid");

if(id==null||hs.isNew())
{
	String mess = "unauthorise access!";
	response.sendRedirect("/caavo/jsp/signin.jsp?m=" + mess);
}
else{
%>
<div class="jumbotron text-center"  style="background-color: #000; color: #00f; margin-bottom:0;">
  <h1>Government Documents Center</h1>
</div>
<nav class="navbar navbar-inverse">
  <div class="container-fluid" >
    <div class="navbar-header" >
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar"  >
      <ul class="nav navbar-nav">
        <li><a href="/caavo/jsp/index.jsp" onmouseover="this.style.background='#00f'"  onmouseout="this.style.background='#222'">Home</a></li>
        <li><a href="/caavo/jsp/main.jsp"  onmouseover="this.style.background='#00f'"  onmouseout="this.style.background='#222'">Main</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="/caavo/jsp/signup.jsp"  onmouseover="this.style.background='#00f'"  onmouseout="this.style.background='#222'"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
        <li><a href="/caavo/jsp/signin.jsp"  onmouseover="this.style.background='#00f'"  onmouseout="this.style.background='#222'"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      </ul>
    </div>
  </div>
</nav>
<div class="container">
	<div class="row">
		<div class="well col-sm-12" style="background-color: #f00; color: #fff;">
			<p>Welcome to Government documents Center. Here You can save your Driving License and Aadhar Card details.
				Your data is secure. The details stored here are available online at any time and at everywhere.
				First you need to SignUp if you are new user otherwise proceeds to SignIn.
			</p>
		</div>
	</div>
</div>

<div class="container">
  <div class="row">
  	
  	<a href="/caavo/Logout" style="text-decoration: none;">
    <div class="well col-sm-12 " style="background-color: #00f; color: #fff; text-align: center;" onmouseover="this.style.background='grey'"  onmouseout="this.style.background='blue' ">
      <h3>Log Out</h3>
    </div></a>
    
  	<a href="/caavo/jsp/view.jsp" style="text-decoration: none;">
    <div class="well col-sm-6 " style="background-color: #00f; color: #fff; text-align: center;" onmouseover="this.style.background='grey'"  onmouseout="this.style.background='blue' ">
      <h3>View Data</h3>
    </div></a>
    
    <a href="/caavo/jsp/add.jsp" style="text-decoration: none;">
    <div class="well col-sm-6 " style="background-color: #00f; color: #fff; text-align: center;"  onmouseover="this.style.background='grey'"  onmouseout="this.style.background='blue' ">
      <h3>Add Data</h3>
    </div></a>
    
    <!-- a href="/caavo/jsp/view.jsp" class="well col-sm-6 text-center" style="background-color: #0f0; color: #fff; text-decoration: none;"> 
    	<h3>View Data</h3>
    	onclick="window.location.href='view.jsp'"
    </a-->

  </div>
</div>
<%} %>
</body>
</html>