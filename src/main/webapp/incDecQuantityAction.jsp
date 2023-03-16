<%@page import="Project.ConnectionProviderClass"%>
<%@page import="java.sql.*"%>
<%
String email=session.getAttribute("email").toString();
String id=request.getParameter("id");
String indec=request.getParameter("quantiy");
int price=0;
int total=0;
int quantiy=0;
int final_total=0;
try
{
	Connection con= ConnectionProviderClass.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from cart where email='"+email+"' and product_id='"+id+"'and address is NULL");
	while(rs.next()){
		
		price=rs.getInt(4);
		total=rs.getInt(5);
		quantiy=rs.getInt(3);
	}
	if(quantiy==1 && indec.equals("dec")){
		response.sendRedirect("myCart.jsp?msg=notpossible");
	}
	else if(quantiy !=1 && indec.equals("dec")){
			total=total-price;
			quantiy=quantiy-1;
			st.executeUpdate("update cart set total='"+total+"',quantiy='"+quantiy+"'where email='"+email+"'and product_id='"+id+"'and address is NULL");
			response.sendRedirect("myCart.jsp?msg=dec");
	}
	else{
		total=total+price;
		quantiy=quantiy+1;
		st.executeUpdate("update cart set total='"+total+"',quantiy='"+quantiy+"'where email='"+email+"'and product_id='"+id+"'and address is NULL");
		response.sendRedirect("myCart.jsp?msg=inc");
	}
	
}catch(Exception e){
	System.out.println(e);
}

%>