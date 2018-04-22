<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,dbconnect.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Data</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body style="background-color: #333;">
<%
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
%>
<div class="jumbotron text-center"  style="background-color: #000; color: #00f;">
  <h1>Government Documents Center</h1>
</div>
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
<div class="container">
	<div class="row">
		<div class="well col-sm-12 text-center" style="background-color: #f00; color: #fff;">
			<h2>Add Your Data</h2>
			<br>
			<div class="container">							
				<form class="form-horizontal" method="post" action="/caavo/Add">
					<div class="form-group">
				      <div class="col-sm-8">
				      </div>
				    </div>
					<div class="form-group">
				      <div class="col-sm-8">
				      </div>
				    </div>
					
					<h3>Aadhar Card Details</h3>
				    <div class="form-group">
				      <label class="control-label col-sm-2" for="ano">Aadhar Number</label>
				      <div class="col-sm-8">
				        <input type="text" class="form-control" id="ano" placeholder="Aadhar Number" name="ano">
				      </div>
				    </div>
				  			    
				    <div class="form-group">
				      <label class="control-label col-sm-2" for="nm">Name </label>
				      <div class="col-sm-8">          
				        <input type="text" class="form-control" id="nm" placeholder="Name" name="nm">
				      </div>
				    </div>
				    		    
				    <div class="form-group">
				      <label class="control-label col-sm-2" for="dob">Date of Birth </label>
				      <div class="col-sm-8">          
				        <input type="date" class="form-control" id="dob" placeholder="Date of Birth" name="dob">
				      </div>
				    </div>
				    
				    <div class="form-group">
				      <div class="col-sm-8">
				      </div>
				    </div>
					<div class="form-group">
				      <div class="col-sm-8">
				      </div>
				    </div>
					
				    <h3>Driving License Details</h3>				    	    
				    <div class="form-group">
				      <label class="control-label col-sm-2" for="lno">License Number</label>
				      <div class="col-sm-8">          
				        <input type="text" class="form-control" id="lno" placeholder="License Number" name="lno">
				      </div>
				    </div>
				    	    
				    <div class="form-group">
				      <label class="control-label col-sm-2" for="vc">Vehicle Category</label>
				      <div class="col-sm-8">          
				        <input type="text" class="form-control" id="vc" placeholder="Vehicle Category" name="vc">
				      </div>
				    </div>
				    				    
				    <div class="form-group">        
				      <div class="col-sm-offset-2 col-sm-8">
				        <button type="submit" class="btn btn-default" style="width:100%;"  onmouseover="this.style.background='#0ff'"  onmouseout="this.style.background='#fff'">Submit</button>
				      </div>
				    </div>
				    
				    <div class="form-group">
				      <div class="col-sm-8">
				      </div>
				    </div>
					<div class="form-group">
				      <div class="col-sm-8">
				      </div>
				    </div>
					
					<div class="form-group" >
					    <div class="col-sm-12" style="color:yellow;">
					    	${param.m}
					    </div>
				    </div>
					
					<div class="form-group">
				      <div class="col-sm-8">
				      </div>
				    </div>
					<div class="form-group">
				      <div class="col-sm-8">
				      </div>
				    </div>
				    				    					
				</form>
			  	
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-8">
			      		<a class="btn btn-default" href="/caavo/jsp/main.jsp" style="width:100%;"  onmouseover="this.style.background='#0ff'"  onmouseout="this.style.background='#fff'">Back</a>
			    	</div>
		    	</div>
    
			</div>			
		</div>
	</div>
</div>
<%} %>
</body>
</html>