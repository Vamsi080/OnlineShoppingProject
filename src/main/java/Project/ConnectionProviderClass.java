package Project;
import java.sql.*;
public class ConnectionProviderClass {

	public static Connection getCon() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/vamsi","root","Vamsi08@");
			return con;
		
		}catch(Exception e) {
			System.out.println(e);
			return null;
		}
		
		
		
	}
}
