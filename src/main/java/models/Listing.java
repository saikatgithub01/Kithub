package models;

public class Listing {
    private int lid;
    private int sellerPid;
    private String itemType;
    private String title;
    private String author;
    private String genre;
    private String description;
    private String imageUrl;
    private double minPrice;
    private double maxPrice;
    private String listingType;
    private Integer lendDurDays;
    
    private int offerCount;


    public int getLid() { return lid; }
    public void setLid(int lid) { this.lid = lid; }

    public int getSellerPid() { return sellerPid; }
    public void setSellerPid(int sellerPid) { this.sellerPid = sellerPid; }

    public String getItemType() { return itemType; }
    public void setItemType(String itemType) { this.itemType = itemType; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getAuthor() { return author; }
    public void setAuthor(String author) { this.author = author; }

    public String getGenre() { return genre; }
    public void setGenre(String genre) { this.genre = genre; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public String getImageUrl() { return imageUrl; }
    public void setImageUrl(String imageUrl) { this.imageUrl = imageUrl; }

    public double getMinPrice() { return minPrice; }
    public void setMinPrice(double minPrice) { this.minPrice = minPrice; }

    public double getMaxPrice() { return maxPrice; }
    public void setMaxPrice(double maxPrice) { this.maxPrice = maxPrice; }

    public String getListingType() { return listingType; }
    public void setListingType(String listingType) { this.listingType = listingType; }

    public Integer getLendDurDays() { return lendDurDays; }
    public void setLendDurDays(Integer lendDurDays) { this.lendDurDays = lendDurDays; }

    public int getOfferCount() { return offerCount; }
    public void setOfferCount(int offerCount) { this.offerCount = offerCount; }
}