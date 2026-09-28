package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
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
}