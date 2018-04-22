<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,dbconnect.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Data</title>
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
			<h2>Your Data</h2>
			<br>
			<div class="container">
			  <div class="form-horizontal">
			    <%
			    	Connection con = Connector.createConnection();
			    
			    	PreparedStatement psac = null;
			    	PreparedStatement psdl = null;
			    
			    	ResultSet rsac = null;
			    	ResultSet rsdl = null;
			    	
			    	String sac = "select * from acdata where id=?";
			    	String sdl = "select * from dldata where id=?";
			    	
			    	try {
			    		psac = con.prepareStatement(sac);
			    		psdl = con.prepareStatement(sdl);
			    		
			    		psac.setString(1, id);
			    		psdl.setString(1, id);
			    		
			    		rsac = psac.executeQuery();
			    		rsdl = psdl.executeQuery();
						
			    		%><h3>Aadhar Card Details</h3><% 
			    		
			    		if(rsac.next()) {
		    			%>
	    				<div class="form-group">
					      <div class="col-sm-offset-2 col-sm-8" >
					        <div class="form-control">
					      		User Id : <%=rsac.getString("id") %> 
					      	</div>
					      </div>
					    </div>
					    <div class="form-group">
					      <div class="col-sm-offset-2 col-sm-8" >
					        <div class="form-control">
					      		Aadhar Number : <%=rsac.getString("aadharno") %> 
					      	</div>
					      </div>
					    </div>
					    <div class="form-group">
					      <div class="col-sm-offset-2 col-sm-8" >
					        <div class="form-control">
					      		Name : <%=rsac.getString("name") %> 
					      	</div>
					      </div>
					    </div>
					    <div class="form-group">
					      <div class="col-sm-offset-2 col-sm-8" >
					        <div class="form-control">
					      		Date of Birth : <%=rsac.getString("dob") %> 
					      	</div>
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
		    			<% 
			    		}
			    		if(rsdl.next()) {
		    			%>
					    <div class="form-group">
					      <div class="col-sm-offset-2 col-sm-8" >
					        <div class="form-control">
					      		License Number : <%=rsdl.getString("licenseno") %> 
					      	</div>
					      </div>
					    </div>
					    <div class="form-group">
					      <div class="col-sm-offset-2 col-sm-8" >
					        <div class="form-control">
					      		Vehicle Category : <%=rsdl.getString("vcategory") %> 
					      	</div>
					      </div>
					    </div>				    
		    			<% 
			    		}			    		
			    	}catch(Exception e) {
			    		e.printStackTrace();
			    	}			    	
			    %>
			    <div class="form-group">
			      <div class="col-sm-8">
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
			    
			    <div class="form-group">        
			      <div class="col-sm-offset-2 col-sm-8">
			      	<a class="btn btn-default" href="/caavo/jsp/main.jsp" style="width:100%;"  onmouseover="this.style.background='#0ff'"  onmouseout="this.style.background='#fff'">Back</a>
			      </div>
			    </div>
			    
			  </div>
			</div>			
		</div>
	</div>
</div>
<%} %>
</body>
</html>