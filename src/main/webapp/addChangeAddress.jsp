<%@page import="Project.ConnectionProviderClass"%>
<%@page import="java.sql.*"%>
<%@include file = "header.jsp" %>
<%@include file ="footer.jsp" %>
<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Add or Change Address</title>
</head>
<body>
<%
String msg=request.getParameter("msg");
if("valid".equals(msg)){
%>
<h3 class="alert">Address Successfully Updated !</h3>
<%} %>

<%
if("invalid".equals(msg)){
%>
<h3 class="alert">Some thing Went Wrong! Try Again!</h3>
<%} %>

<%
try{
	Connection con=ConnectionProviderClass.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from users where email='"+email+"'");
	while(rs.next())
	{
%>
<form action="addChangeAddressAction.jsp" method="post">
<h3>Enter Address</h3>
 <input type="text" class="input-style" value="<%=rs.getString(7) %>" name="address" placeholder="Enter YourAddress" required>
 <hr>
 <h3>Enter city</h3>
 <input type="text" class="input-style" value="<%=rs.getString(8) %>" name="city" placeholder="Enter City" required>
<hr>
<h3>Enter State</h3>
<input type="text" class="input-style" value="<%=rs.getString(9) %>" name="state" placeholder="Enter State" required>
<hr>
<h3>Enter country</h3>
<input type="text" class="input-style" value="<%=rs.getString(10) %>" name="country" placeholder="Enter Country" required>
<hr>
<button class="input-style" type="submit"> <i class='far fa-arrow-alt-circle-right'> Save </i></button>
</form>
<%}
}catch(Exception e)
{
System.out.println(e);
}
%>

</body>
<br><br><br>
</html>