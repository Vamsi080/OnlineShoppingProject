
<%@page import="Project.ConnectionProviderClass"%>
<%@page import="java.sql.*"%>
<%@include file = "changeDetailsHeader.jsp" %>
<%@include file ="footer.jsp" %>
<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Change Moile</title>
</head>
<body>
<%
String msg=request.getParameter("msg");
if("done".equals(msg)){
%>
<h3 class="alert">Your Mobile Number successfully changed!</h3>
<%} %>

<%
if("wrong".equals(msg)){
%>
<h3 class="alert">Your Password is wrong!</h3>
<%} %>
<form action ="changeMobileNumberAction.jsp" method="post">
 <h3>Enter Your New Mobile Number</h3>
 <input class="input-style" type="number" name="mobileNumber" placeholder="Enter your mobileNumber" required>
 <hr>
<h3>Enter Password (For Security)</h3>
<input class="input-style" type="password" name="password" placeholder="Enter your password(for security)" required>
<br><br>
<hr>
 <button class="input-style" type="submit"><i class='far fa-arrow-alt-circle-right'> Save </i></button>
</form>
</body>
<br><br><br>
</html>