package models;

public class SellerProfile {
    private int sellerPid;
    private int userId;
    private String sellerUname;
    private String sellerUniqueId;
    private int totalListings;
    private int totalSales;

    public int getSellerPid() { return sellerPid; }
    public void setSellerPid(int sellerPid) { this.sellerPid = sellerPid; }

    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }

    public String getSellerUname() { return sellerUname; }
    public void setSellerUname(String sellerUname) { this.sellerUname = sellerUname; }

    public String getSellerUniqueId() { return sellerUniqueId; }
    public void setSellerUniqueId(String sellerUniqueId) { this.sellerUniqueId = sellerUniqueId; }

    public int getTotalListings() { return totalListings; }
    public void setTotalListings(int totalListings) { this.totalListings = totalListings; }

    public int getTotalSales() { return totalSales; }
    public void setTotalSales(int totalSales) { this.totalSales = totalSales; }
}