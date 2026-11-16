package utilities;

import java.io.InputStream;
import java.sql.*;
import java.util.Properties;

public class ConnectionFactory {
	 private static String url;
	    private static String user;
	    private static String password;

	    static {
	        try (InputStream input = ConnectionFactory.class.getClassLoader().getResourceAsStream("db.properties")) {
	            Properties prop = new Properties();
	            if (input != null) {
	                prop.load(input);
	                url = prop.getProperty("db.url");
	                user = prop.getProperty("db.user");
	                password = prop.getProperty("db.password");
	            } else {
	                System.err.println("db.properties file not found! Falling back to defaults.");
	                
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }

	    public static Connection getConn() {
	        Connection cn = null;
	        try {
	            Class.forName("com.mysql.cj.jdbc.Driver");
	            cn = DriverManager.getConnection(url, user, password);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return cn;
	    }
}