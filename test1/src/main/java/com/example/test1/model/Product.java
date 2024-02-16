package com.example.test1.model;

import lombok.Data;

@Data
public class Product {
	private String itemNo;
    private String itemName;
    private Double price;
    private Double sRate;
    private Double pRate;
    private String contents;
    private String sellYn;
    private String transInfo;
}
