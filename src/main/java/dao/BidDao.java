package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import models.BuyerBidDTO;
import utilities.ConnectionFactory;

public class BidDao {

    public boolean placeBid(int lid, int buyerUid, double amount) {
        String sql = "INSERT INTO bids (lid, buyer_uid, amount, status) VALUES (?, ?, ?, 'Pending')";
        try (Connection cn = ConnectionFactory.getConn();
             PreparedStatement ps = cn.prepareStatement(sql)) {
            ps.setInt(1, lid);
            ps.setInt(2, buyerUid);
            ps.setDouble(3, amount);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<BuyerBidDTO> getBidsByBuyer(int buyerUid) {
        List<BuyerBidDTO> bids = new ArrayList<>();
        String sql = "SELECT b.bid_id, l.lid, l.title, l.image_url, s.seller_uname, b.amount, b.status "
                   + "FROM bids b "
                   + "JOIN listings l ON b.lid = l.lid "
                   + "JOIN seller_profiles s ON l.seller_pid = s.seller_pid "
                   + "WHERE b.buyer_uid = ? "
                   + "ORDER BY b.created_at DESC";

        try (Connection cn = ConnectionFactory.getConn();
             PreparedStatement ps = cn.prepareStatement(sql)) {
             
            ps.setInt(1, buyerUid);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    BuyerBidDTO dto = new BuyerBidDTO();
                    dto.setBidId(rs.getInt("bid_id"));
                    dto.setLid(rs.getInt("lid"));
                    dto.setBookTitle(rs.getString("title"));
                    dto.setImageUrl(rs.getString("image_url"));
                    dto.setSellerName(rs.getString("seller_uname"));
                    dto.setAmount(rs.getDouble("amount"));
                    dto.setStatus(rs.getString("status"));
                    bids.add(dto);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return bids;
    }
    
    public boolean updateBidStatus(int bidId, String status, int sellerPid) {
        String sql = "UPDATE bids b "
                   + "JOIN listings l ON b.lid = l.lid "
                   + "SET b.status = ? "
                   + "WHERE b.bid_id = ? AND l.seller_pid = ?";
                   
        try (Connection cn = ConnectionFactory.getConn();
             PreparedStatement ps = cn.prepareStatement(sql)) {

            ps.setString(1, status);
            ps.setInt(2, bidId);
            ps.setInt(3, sellerPid);

            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}