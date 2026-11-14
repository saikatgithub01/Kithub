package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import models.Listing;
import models.OfferDTO;
import utilities.ConnectionFactory;

public class ListingsDao {

    public boolean addListing(Listing l) {
        String sql = "INSERT INTO listings (seller_pid, item_type, title, author, genre, description, image_url, min_price, max_price, listing_type, lend_dur_days) "
                   + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection cn = ConnectionFactory.getConn();
             PreparedStatement ps = cn.prepareStatement(sql)) {

            ps.setInt(1, l.getSellerPid());
            ps.setString(2, l.getItemType());
            ps.setString(3, l.getTitle());
            ps.setString(4, l.getAuthor());
            ps.setString(5, l.getGenre());
            ps.setString(6, l.getDescription());
            ps.setString(7, l.getImageUrl());
            ps.setDouble(8, l.getMinPrice());
            ps.setDouble(9, l.getMaxPrice());
            ps.setString(10, l.getListingType());

            if (l.getLendDurDays() != null && l.getLendDurDays() > 0) {
                ps.setInt(11, l.getLendDurDays());
            } else {
                ps.setNull(11, java.sql.Types.INTEGER);
            }

            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Listing> getSellerListings(int sellerPid) {
        List<Listing> list = new ArrayList<>();
        String sql = "SELECT l.*, "
                   + "(SELECT COUNT(*) FROM bids b WHERE b.lid = l.lid AND b.status = 'Pending') as offer_count "
                   + "FROM listings l WHERE l.seller_pid = ? ORDER BY l.created_at DESC";
                   
        try (Connection cn = ConnectionFactory.getConn();
             PreparedStatement ps = cn.prepareStatement(sql)) {
             
            ps.setInt(1, sellerPid);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Listing l = new Listing();
                    l.setLid(rs.getInt("lid"));
                    l.setItemType(rs.getString("item_type"));
                    l.setTitle(rs.getString("title"));
                    l.setAuthor(rs.getString("author"));
                    l.setGenre(rs.getString("genre"));
                    l.setMinPrice(rs.getDouble("min_price"));
                    l.setMaxPrice(rs.getDouble("max_price"));
                    l.setListingType(rs.getString("listing_type"));
                    
                    int lendDays = rs.getInt("lend_dur_days");
                    if (!rs.wasNull()) l.setLendDurDays(lendDays);
                    
                    l.setOfferCount(rs.getInt("offer_count"));
                    list.add(l);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<OfferDTO> getSellerOffers(int sellerPid) {
        List<OfferDTO> offers = new ArrayList<>();
        // Maps correctly to your updated DB (buyer_uid = users.uid)
        String sql = "SELECT b.bid_id, l.title, u.name AS buyer_name, b.amount, b.status "
                   + "FROM bids b "
                   + "JOIN listings l ON b.lid = l.lid "
                   + "JOIN users u ON b.buyer_uid = u.uid "
                   + "WHERE l.seller_pid = ? ORDER BY b.created_at DESC";
                   
        try (Connection cn = ConnectionFactory.getConn();
             PreparedStatement ps = cn.prepareStatement(sql)) {
             
            ps.setInt(1, sellerPid);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    OfferDTO o = new OfferDTO();
                    o.setBidId(rs.getInt("bid_id"));
                    o.setBookTitle(rs.getString("title"));
                    o.setBuyerName(rs.getString("buyer_name"));
                    o.setAmount(rs.getDouble("amount"));
                    o.setStatus(rs.getString("status"));
                    offers.add(o);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return offers;
    }

    public boolean deleteListing(int lid, int sellerPid) {
        String sql = "DELETE FROM listings WHERE lid = ? AND seller_pid = ?";
        try (Connection cn = ConnectionFactory.getConn();
             PreparedStatement ps = cn.prepareStatement(sql)) {
            ps.setInt(1, lid);
            ps.setInt(2, sellerPid);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public List<Listing> getAllActiveListings() {
        List<Listing> list = new ArrayList<>();
        // Fetch all listings ordered by newest first
        String sql = "SELECT * FROM listings ORDER BY created_at DESC";
                   
        try (Connection cn = ConnectionFactory.getConn();
             PreparedStatement ps = cn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
             
            while (rs.next()) {
                Listing l = new Listing();
                l.setLid(rs.getInt("lid"));
                l.setSellerPid(rs.getInt("seller_pid"));
                l.setItemType(rs.getString("item_type"));
                l.setTitle(rs.getString("title"));
                l.setAuthor(rs.getString("author"));
                l.setGenre(rs.getString("genre"));
                l.setImageUrl(rs.getString("image_url"));
                l.setMinPrice(rs.getDouble("min_price"));
                l.setMaxPrice(rs.getDouble("max_price"));
                l.setListingType(rs.getString("listing_type"));
                
                int lendDays = rs.getInt("lend_dur_days");
                if (!rs.wasNull()) l.setLendDurDays(lendDays);
                
                list.add(l);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}