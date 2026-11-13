package utilities;
import java.sql.*;

public class ConnectionFactory {
	public static Connection getConn()
	{
		Connection cn = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/kithubdb","root","SinhaSQL@01");
		}
		catch (ClassNotFoundException ce){
			ce.printStackTrace();
		}
		catch(SQLException se) {
			se.printStackTrace();
		}
		
		return cn;
	}
}