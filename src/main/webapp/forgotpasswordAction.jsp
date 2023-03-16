<%@page import="Project.ConnectionProviderClass"%>
<%@page import="java.sql.*"%>
<%
	
String email=request.getParameter("email");
String mobileNumber=request.getParameter("mobileNumber");
String securityQuestion=request.getParameter("securityQuestion");
String answer=request.getParameter("answer");
String newpassword=request.getParameter("newpassword");

int check=0;
try{
	
	Connection con=ConnectionProviderClass.getCon();
	PreparedStatement ps = con.prepareStatement("SELECT * FROM users WHERE email = ? AND mobilenumber = ? AND securityQuestions = ? AND answer = ?");
	ps.setString(1, email);
	ps.setString(2, mobileNumber);
	ps.setString(3, securityQuestion);
	ps.setString(4, answer);
	ResultSet rs=ps.executeQuery();

	while(rs.next()){	
		check=1;
		PreparedStatement psUpdate = con.prepareStatement("UPDATE users SET password = ? WHERE email = ?");
		psUpdate.setString(1, newpassword);
		psUpdate.setString(2, email);
		psUpdate.executeUpdate();
		response.sendRedirect("forgotPassword.jsp?msg=Done");
	}

	if(check==0){
		response.sendRedirect("forgotPassword.jsp?msg=invalid");
	}
}catch(Exception e)
{
	e.printStackTrace();
}
%>
