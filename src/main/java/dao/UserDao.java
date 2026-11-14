package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import utilities.ConnectionFactory;

public class UserDao {

    public boolean registerUser(String name, String email, String city, String password) {
        boolean isSuccess = false;
        Connection cn = null;
        PreparedStatement ps = null;

        String sql = "INSERT INTO users (name, email, city, password) VALUES (?, ?, ?, ?)";

        try {
            ConnectionFactory con = new ConnectionFactory();
            cn = con.getConn();

            if (cn != null) {
                ps = cn.prepareStatement(sql);
                ps.setString(1, name);
                ps.setString(2, email);
                ps.setString(3, city);
                ps.setString(4, password);

                int rowsAffected = ps.executeUpdate();
                if (rowsAffected > 0) {
                    isSuccess = true;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try { if (ps != null) ps.close(); } catch (SQLException e) { e.printStackTrace(); }
            try { if (cn != null) cn.close(); } catch (SQLException e) { e.printStackTrace(); }
        }

        return isSuccess;
    }
    
    public String[] loginUser(String email, String password) {
        String sql = "SELECT uid, name, email FROM users WHERE email = ? AND password = ?";
        
        try (Connection cn = ConnectionFactory.getConn();
             PreparedStatement ps = cn.prepareStatement(sql)) {
            
            ps.setString(1, email);
            ps.setString(2, password);
            
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new String[] {
                        String.valueOf(rs.getInt("uid")),
                        rs.getString("name"),
                        rs.getString("email")
                    };
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null; 
    }
}