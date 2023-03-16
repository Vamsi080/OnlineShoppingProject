<%@page import="Project.ConnectionProviderClass"%>
<%@page import="java.sql.*"%>

<%
String email=session.getAttribute("email").toString();
String oldpassword=request.getParameter("oldpassword");
String newpassword=request.getParameter("newpassword");
String conformpassword=request.getParameter("conformpassword");

if(! conformpassword.equals(newpassword)){
	response.sendRedirect("changePassword.jsp?msg=noneMatch");}
else{
	int check=0;
	try{
		Connection con=ConnectionProviderClass.getCon();
		Statement st=con.createStatement();
		ResultSet rs3=st.executeQuery("select * from users where email='"+email+"' and password='"+oldpassword+"'");
		while(rs3.next()){
			check=1;
			st.executeUpdate("update users set password='"+newpassword+"' where email='"+email+"'");
			response.sendRedirect("changePassword.jsp?msg=done");
		}
		if(check==0){
			response.sendRedirect("changePassword.jsp?msg=Wrong");
		}
		
	}catch(Exception e){
		//response.sendRedirect("changePassword?msg=invalid");
		System.out.println(e);
	}
}
%>