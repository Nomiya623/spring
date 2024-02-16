package com.example.test1.model;

public class Product {
    private String itemNo;
    private String itemName;
    private Double price;
    private String contents;
    private String transInfo;

    // Constructors
    public Product() {}

    public Product(String itemNo, String itemName, Double price, String contents, String transInfo) {
        this.itemNo = itemNo;
        this.itemName = itemName;
        this.price = price;
        this.contents = contents;
        this.transInfo = transInfo;
    }

    // Getters and Setters
    public String getItemNo() {
        return itemNo;
    }

    public void setItemNo(String itemNo) {
        this.itemNo = itemNo;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public String getContents() {
        return contents;
    }

    public void setContents(String contents) {
        this.contents = contents;
    }

    public String getTransInfo() {
        return transInfo;
    }

    public void setTransInfo(String transInfo) {
        this.transInfo = transInfo;
    }

    // toString() Method for debugging
    @Override
    public String toString() {
        return "Product{" +
                "itemNo='" + itemNo + '\'' +
                ", itemName='" + itemName + '\'' +
                ", price=" + price +
                ", contents='" + contents + '\'' +
                ", transInfo='" + transInfo + '\'' +
                '}';
    }
}
