package connection;

import java.sql.Connection;
import java.sql.DriverManager;

 public class ConnectionProvider {
	 
	 	public static Connection getConnection()
	 	{
	 		Connection con = null;
	 		try{
	 		Class.forName("com.mysql.cj.jdbc.Driver");
	 		con= DriverManager.getConnection("jdbc:mysql://localhost:3306/emp_curd","root", "apa123");
	 		}catch(Exception e)
	 		{
	 			System.out.println(e);
	 		}
			return con;	
	 	}


}
