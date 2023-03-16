<%@page import="Project.ConnectionProviderClass"%>
<%@page import="java.sql.*"%>

<% 
String id=request.getParameter("id");
String name=request.getParameter("name");
String Category=request.getParameter("Category");
String Price=request.getParameter("Price");
String Active=request.getParameter("Active");

try{
	Connection con=ConnectionProviderClass.getCon();
	Statement st=con.createStatement();
	st.executeUpdate("update product set name='"+name+"',category ='"+Category+"',price='"+Price+"',active='"+Active+"' where id='"+id+"'");
	if(Active.equals("No")){
		st.executeUpdate("delete from cart where product_id='"+id+"' and address is NULL");
	}
	response.sendRedirect("allProductEditProduct.jsp?msg=Done");
	
	
}catch(Exception e)
{
	response.sendRedirect("allProductEditProduct.jsp?msg=Wrong");
	System.out.println(e);
}

%>