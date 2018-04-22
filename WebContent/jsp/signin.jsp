<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sign In</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
	function checkID(enteredID) {
		if(XMLHttpRequest) {
			var x = new XMLHttpRequest();
		} else {
			var x = new ActiveXObject("MicrosoftXMLHTTP");
		} 
		x.onreadystatechange = function () {
			if(x.readyState === 4 ) {
				if(x.status == 200) {				
					var data = x.responseText;
					document.getElementById("mess").innerHTML = data; 
				} 
			} 			
		}
		x.open("get", "/caavo/Signin?uid="+enteredID, "true"); //uid is fieldname in form
		x.send();
	}
</script>
</head>
<body style="background-color: #333;">
<%
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
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
		<div class="well col-sm-12 text-center" style="background-color: #f00; color: #fff;">
			<h2><span class="glyphicon glyphicon-log-in"></span> Login</h2>
			<br>
			<div class="container">
			  <form class="form-horizontal" method="post" action="/caavo/Signin">
			    <div class="form-group">
			      <label class="control-label col-sm-2" for="email">User Id</label>
			      <div class="col-sm-8">
			        <input type="text" class="form-control" id="uid" placeholder="User Id" name="uid" onblur="checkID(this.value)">
			      </div>
			    </div>
			    <div class="form-group" >
				    <div class="col-sm-11" id="mess" style="color:yellow;">
				    </div>
			    </div>			    
			    <div class="form-group">
			      <label class="control-label col-sm-2" for="pwd">User Pass:</label>
			      <div class="col-sm-8">          
			        <input type="password" class="form-control" id="upass" placeholder="User Pass" name="upass">
			      </div>
			    </div>
			    <div class="form-group" >
				    <div class="col-sm-11" style="color:yellow;">
				    	${param.m}
				    </div>
			    </div>
			    <div class="form-group">        
			      <div class="col-sm-offset-2 col-sm-8">
			        <button type="submit" class="btn btn-default" style="width:100%;"  onmouseover="this.style.background='#0ff'"  onmouseout="this.style.background='#fff'">Submit</button>
			      </div>
			    </div>
			  </form>
			</div>			
		</div>
	</div>
</div>

</body>
</html>