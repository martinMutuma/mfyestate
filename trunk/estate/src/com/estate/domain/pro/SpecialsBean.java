package com.estate.domain.pro;

import com.estate.base.entity.BaseEntity;

public class SpecialsBean  extends BaseEntity {
    private String disname;
    private String name;
    private String minPrice;
    private String specials;
    private String compressUrl;
    public String getDisname() {
        return disname;
    }
    public void setDisname(String disname) {
        this.disname = disname;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getMinPrice() {
        return minPrice;
    }
    public void setMinPrice(String minPrice) {
        this.minPrice = minPrice;
    }
    public String getSpecials() {
        return specials;
    }
    public void setSpecials(String specials) {
        this.specials = specials;
    }
    public String getCompressUrl() {
        return compressUrl;
    }
    public void setCompressUrl(String compressUrl) {
        this.compressUrl = compressUrl;
    }
    
    
}
