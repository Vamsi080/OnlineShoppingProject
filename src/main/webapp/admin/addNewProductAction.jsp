<%@page import="Project.ConnectionProviderClass"%>
<%@page import="java.sql.*"%>

<%

	String id=request.getParameter("id");
	String name=request.getParameter("name");
	String Category=request.getParameter("Category");
	String price=request.getParameter("price");
	String Active=request.getParameter("Active");
	
	try{
		
		Connection con=ConnectionProviderClass.getCon();
		PreparedStatement ps=con.prepareStatement("insert into product values(?,?,?,?,?)");
		ps.setString(1,id);
		ps.setString(2,name);
		ps.setString(3,Category);
		ps.setString(4,price);
		ps.setString(5,Active);
		ps.executeUpdate();
		response.sendRedirect("addNewProduct.jsp?msg=Done");
		
	}catch(Exception e){
		response.sendRedirect("addNewProduct.jsp?msg=Wrong");
		System.out.println(e);
	}

%>