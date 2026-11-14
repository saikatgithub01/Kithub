package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import models.SellerProfile;
import utilities.ConnectionFactory;

public class SellerDao {

    public boolean isUsernameTaken(String sellerUname) {
        String sql = "SELECT 1 FROM seller_profiles WHERE seller_uname = ?";
        try (Connection cn = ConnectionFactory.getConn();
             PreparedStatement ps = cn.prepareStatement(sql)) {
            ps.setString(1, sellerUname);
            try (ResultSet rs = ps.executeQuery()) {
                return rs.next();
            }
        } catch (Exception e) {
            e.printStackTrace();
            return true; 
        }
    }

    public boolean isKspIdTaken(String kspId) {
        String sql = "SELECT 1 FROM seller_profiles WHERE seller_unique_id = ?";
        try (Connection cn = ConnectionFactory.getConn();
             PreparedStatement ps = cn.prepareStatement(sql)) {
            ps.setString(1, kspId);
            try (ResultSet rs = ps.executeQuery()) {
                return rs.next();
            }
        } catch (Exception e) {
            e.printStackTrace();
            return true;
        }
    }

    public int getUserIdByEmail(String email) {
        String sql = "SELECT uid FROM users WHERE email = ?";
        try (Connection cn = ConnectionFactory.getConn();
             PreparedStatement ps = cn.prepareStatement(sql)) {
            ps.setString(1, email);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) return rs.getInt("uid");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }

    public int createSellerProfile(SellerProfile sp) {
        String sql = "INSERT INTO seller_profiles (user_id, seller_uname, seller_unique_id) VALUES (?, ?, ?)";
        try (Connection cn = ConnectionFactory.getConn();
             PreparedStatement ps = cn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            ps.setInt(1, sp.getUserId());
            ps.setString(2, sp.getSellerUname());
            ps.setString(3, sp.getSellerUniqueId());

            int rows = ps.executeUpdate();
            if (rows > 0) {
                try (ResultSet keys = ps.getGeneratedKeys()) {
                    if (keys.next()) return keys.getInt(1);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }
    
    public SellerProfile loginSeller(String sellerUname, String kspId) {
        String sql = "SELECT seller_pid, user_id, seller_uname, seller_unique_id "
                   + "FROM seller_profiles WHERE seller_uname = ? AND seller_unique_id = ?";
                   
        try (Connection cn = ConnectionFactory.getConn();
             PreparedStatement ps = cn.prepareStatement(sql)) {

            ps.setString(1, sellerUname);
            ps.setString(2, kspId);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    SellerProfile sp = new SellerProfile();
                    sp.setSellerPid(rs.getInt("seller_pid"));
                    sp.setUserId(rs.getInt("user_id"));
                    sp.setSellerUname(rs.getString("seller_uname"));
                    sp.setSellerUniqueId(rs.getString("seller_unique_id"));
                    return sp;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
}
}