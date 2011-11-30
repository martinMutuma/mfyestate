package com.estate.domain.system;

import java.util.List;
import java.util.Map;

import com.estate.domain.building.TpBuilding;
import com.estate.domain.building.TpSecondBuliding;
import com.estate.domain.member.TmBaseinfo;
import com.estate.domain.news.TsNews;
import com.estate.domain.pro.Office;
import com.estate.domain.pro.OfficeNeed;
import com.estate.domain.pro.Shop;
import com.estate.domain.pro.SpecialsBean;
import com.estate.domain.pro.TpSpecials;

public class HomeData {
    
    private List<Office> officeList;// 写字楼列表
    
    private List<Shop> shopList;// 商铺列表
    
    private List<TmBaseinfo> baseinfoList;// 经纪人列表
    
    private List<OfficeNeed> officeNeedList;// 写字楼需求列表
    
    private List<OfficeNeed> shopNeedList;// 商铺需求列表
    
    private List<TpBuilding> bulidList;// 最新住宅楼盘列表
    
    private List<TpBuilding> attentionBulidList;// 最受关注的楼盘
    
    private List<TsNews> xylNewsList; // 梦房园动态
    
    private List<TsNews> estateNews; // 地产快讯
    
    private List<TpSecondBuliding> sbList;// 二手房
    
    private List<TpSecondBuliding> recommendSbList;// 推荐二手房
    
    private List<TpSecondBuliding> rentList;// 租房
    
    private List<TpSecondBuliding> recommendRentList;// 推荐租房
    
    private List<SpecialsBean> specialsList;// 特价房
    
    private TpSpecials tpSpecialsTuan;// 团购一套
    
    private TpSpecials tpSpecialstOne;// 特价一套
    
    private Map<String, List<String>> dhMap;
    
    public List<TpBuilding> getBulidList() {
        return bulidList;
    }
    
    public void setBulidList(List<TpBuilding> bulidList) {
        this.bulidList = bulidList;
    }
    
    public List<Office> getOfficeList() {
        return officeList;
    }
    
    public void setOfficeList(List<Office> officeList) {
        this.officeList = officeList;
    }
    
    public List<Shop> getShopList() {
        return shopList;
    }
    
    public void setShopList(List<Shop> shopList) {
        this.shopList = shopList;
    }
    
    public List<TmBaseinfo> getBaseinfoList() {
        return baseinfoList;
    }
    
    public void setBaseinfoList(List<TmBaseinfo> baseinfoList) {
        this.baseinfoList = baseinfoList;
    }
    
    public List<OfficeNeed> getOfficeNeedList() {
        return officeNeedList;
    }
    
    public void setOfficeNeedList(List<OfficeNeed> officeNeedList) {
        this.officeNeedList = officeNeedList;
    }
    
    public List<OfficeNeed> getShopNeedList() {
        return shopNeedList;
    }
    
    public void setShopNeedList(List<OfficeNeed> shopNeedList) {
        this.shopNeedList = shopNeedList;
    }
    
    public Map<String, List<String>> getDhMap() {
        return dhMap;
    }
    
    public void setDhMap(Map<String, List<String>> dhMap) {
        this.dhMap = dhMap;
    }
    
    public List<TpBuilding> getAttentionBulidList() {
        return attentionBulidList;
    }
    
    public void setAttentionBulidList(List<TpBuilding> attentionBulidList) {
        this.attentionBulidList = attentionBulidList;
    }
    
    public List<TsNews> getXylNewsList() {
        return xylNewsList;
    }
    
    public void setXylNewsList(List<TsNews> xylNewsList) {
        this.xylNewsList = xylNewsList;
    }
    
    public List<TsNews> getEstateNews() {
        return estateNews;
    }
    
    public void setEstateNews(List<TsNews> estateNews) {
        this.estateNews = estateNews;
    }
    
    public List<TpSecondBuliding> getSbList() {
        return sbList;
    }
    
    public void setSbList(List<TpSecondBuliding> sbList) {
        this.sbList = sbList;
    }
    
    public List<TpSecondBuliding> getRentList() {
        return rentList;
    }
    
    public void setRentList(List<TpSecondBuliding> rentList) {
        this.rentList = rentList;
    }
    
    public List<TpSecondBuliding> getRecommendSbList() {
        return recommendSbList;
    }
    
    public void setRecommendSbList(List<TpSecondBuliding> recommendSbList) {
        this.recommendSbList = recommendSbList;
    }
    
    public List<TpSecondBuliding> getRecommendRentList() {
        return recommendRentList;
    }
    
    public void setRecommendRentList(List<TpSecondBuliding> recommendRentList) {
        this.recommendRentList = recommendRentList;
    }
    
    
    public TpSpecials getTpSpecialsTuan() {
        return tpSpecialsTuan;
    }
    
    public void setTpSpecialsTuan(TpSpecials tpSpecialsTuan) {
        this.tpSpecialsTuan = tpSpecialsTuan;
    }
    
    public TpSpecials getTpSpecialstOne() {
        return tpSpecialstOne;
    }
    
    public void setTpSpecialstOne(TpSpecials tpSpecialstOne) {
        this.tpSpecialstOne = tpSpecialstOne;
    }

    public List<SpecialsBean> getSpecialsList() {
        return specialsList;
    }

    public void setSpecialsList(List<SpecialsBean> specialsList) {
        this.specialsList = specialsList;
    }
    
    
    
}
