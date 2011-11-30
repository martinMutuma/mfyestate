package com.estate.domain.building;

import java.util.Date;

import com.estate.base.annotation.Column;
import com.estate.base.annotation.Table;
import com.estate.base.entity.BaseEntity;

/**
 * TpBuilding entity.
 * 
 * @author MyEclipse Persistence Tools
 */
@Table("t_p_building")
public class TpBuilding extends BaseEntity {

	// Fields

	private String num;
	@Column(name = "NAME")
	private String name;
	@Column(name = "SALES_STATUS")
	private String salesStatus;
	@Column(name = "building_type")
	private String buildingType;
	private String features;
	private String district;
	private String disname;
	private String address;
	@Column(name = "MAIN_UNIT")
	private String mainUnit;
	@Column(name = "FIT_CONDITION")
	private String fitCondition;
	@Column(name = "BUILD_STATUS")
	private String buildStatus;
	@Column(name = "OPEN_DATE")
	private Date openDate;
	@Column(name = "CHECK_DATE")
	private Date checkDate;
	@Column(name = "MIN_PRICE")
	private Integer minPrice;
	@Column(name = "AVERAGE_PRICE")
	private Integer averagePrice;
	@Column(name = "MAX_PRICE")
	private Integer maxPrice;
	@Column(name = "IS_FORWARD")
	private String isForward;
	@Column(name = "BUILDING_COUNT")
	private Integer buildingCount;
	@Column(name = "UNIT_COUNT")
	private Integer unitCount;
	private Double area;
	@Column(name = "CONSTRUCTION_AREA")
	private Double constructionArea;
	@Column(name = "GREEN_RATE")
	private Double greenRate;
	@Column(name = "CAPACITY_RATE")
	private Integer capacityRate;
	@Column(name = "OUTTER_WALL")
	private String outterWall;
	private String structure;
	private String contractors;
	@Column(name = "ARCH_FORMS")
	private String archForms;
	@Column(name = "car_pat")
	private Integer carPat;
	private Double propertyManagement;
	private String propertyCompany;
	@Column(name = "water_supply")
	private String waterSupply;
	@Column(name = "heating_supply")
	private String heatingSupply;
	@Column(name = "BUSINESS_DEVELOPMENT")
	private String businessDevelopment;
	private String investors;
	@Column(name = "PRE_LICENSE")
	private String preLicense;
	@Column(name = "PROJECT_INS")
	private String projectIns;
	private String trends;
	@Column(name = "LIFE_SUPPORT")
	private String lifeSupport;
	private String neighborhoods;
	private String traffic;
	private String other;
	private String positionX;
	private String positionY;
	private String addressName;
	private Integer authorId;
	private String compressUrl;
	private Integer attentionNum;
	private Integer views;
	@Column(name = "reject")
	private String isView;
	@Column(name = "reject")
	private String isAttention;
	@Column(name = "reject")
	private String isChoose;
	private Date createTime;
	@Column(name = "reject")
	private String dateString;// added by lgc
	@Column(name = "reject")
	private  String  checkdataString;
	private Integer showingsnum;
	private String auditingState;

	@Column(name="reject")
	private String authorName;

	public String getAuthorName() {
		return authorName;
	}

	public void setAuthorName(String authorName) {
		this.authorName = authorName;
	}

	public String getDateString() {
		return dateString;
	}

	public void setDateString(String dateString) {
		this.dateString = dateString;
	}

	public String getIsChoose() {
		return isChoose;
	}

	public void setIsChoose(String isChoose) {
		this.isChoose = isChoose;
	}

	public String getNum() {
		return this.num;
	}

	public void setNum(String num) {
		this.num = num;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSalesStatus() {
		return this.salesStatus;
	}

	public void setSalesStatus(String salesStatus) {
		this.salesStatus = salesStatus;
	}

	public String getBuildingType() {
		return this.buildingType;
	}
	
	public String getBuildingTypeValue() {
		String btype = "";
		if(null != buildingType){
			String[] str = buildingType.split(",");
			for (int i = 0; i < str.length; i++) {
				switch (new Integer(str[i].trim())) {
				case 0 : btype += "住宅  ";break;
				case 1 : btype += "公寓  ";break;
				case 2 : btype += "海景房  ";break;
				case 3 : btype += "别墅  ";break;
				case 4 : btype += "酒店式公寓  ";break;
				case 5 : btype += "产权式酒店  ";break;
				default :
					btype += "  ";break;
				}
			}
		}
		return btype;
	}
	
	public String getFitConditionValue() {
		if(null != fitCondition){
			switch (new Integer(fitCondition)) {
			case 1 : return "毛坯";
			case 2 : return "简单装修";
			case 3 : return "中档装修";
			case 4 : return "精装修";
			default :
				return "";
			}
		}
		return "";
	}

	public void setBuildingType(String buildingType) {
		this.buildingType = buildingType;
	}

	public String getFeatures() {
		return this.features;
	}

	public void setFeatures(String features) {
		this.features = features;
	}

	public String getDistrict() {
		return this.district;
	}

	public void setDistrict(String district) {
		this.district = district;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getMainUnit() {
		return this.mainUnit;
	}

	public void setMainUnit(String mainUnit) {
		this.mainUnit = mainUnit;
	}

	public String getFitCondition() {
		return this.fitCondition;
	}

	public void setFitCondition(String fitCondition) {
		this.fitCondition = fitCondition;
	}

	public String getBuildStatus() {
		return this.buildStatus;
	}

	public void setBuildStatus(String buildStatus) {
		this.buildStatus = buildStatus;
	}

	public Date getOpenDate() {
		return this.openDate;
	}

	public void setOpenDate(Date openDate) {
		this.openDate = openDate;
	}

	public Date getCheckDate() {
		return this.checkDate;
	}

	public void setCheckDate(Date checkDate) {
		this.checkDate = checkDate;
	}

	public String getIsForward() {
		return this.isForward;
	}

	public void setIsForward(String isForward) {
		this.isForward = isForward;
	}

	public Integer getBuildingCount() {
		return this.buildingCount;
	}

	public void setBuildingCount(Integer buildingCount) {
		this.buildingCount = buildingCount;
	}

	public Integer getUnitCount() {
		return this.unitCount;
	}

	public void setUnitCount(Integer unitCount) {
		this.unitCount = unitCount;
	}

	public Double getArea() {
		return this.area;
	}

	public void setArea(Double area) {
		this.area = area;
	}

	public Double getConstructionArea() {
		return this.constructionArea;
	}

	public void setConstructionArea(Double constructionArea) {
		this.constructionArea = constructionArea;
	}

	public Double getGreenRate() {
		return this.greenRate;
	}

	public void setGreenRate(Double greenRate) {
		this.greenRate = greenRate;
	}

	public Integer getCapacityRate() {
		return this.capacityRate;
	}

	public void setCapacityRate(Integer capacityRate) {
		this.capacityRate = capacityRate;
	}

	public String getOutterWall() {
		return this.outterWall;
	}

	public void setOutterWall(String outterWall) {
		this.outterWall = outterWall;
	}

	public String getStructure() {
		return this.structure;
	}

	public void setStructure(String structure) {
		this.structure = structure;
	}

	public String getContractors() {
		return this.contractors;
	}

	public void setContractors(String contractors) {
		this.contractors = contractors;
	}

	public String getArchForms() {
		return this.archForms;
	}

	public void setArchForms(String archForms) {
		this.archForms = archForms;
	}

	public Integer getCarPat() {
		return this.carPat;
	}

	public void setCarPat(Integer carPat) {
		this.carPat = carPat;
	}

	public Double getPropertyManagement() {
		return this.propertyManagement;
	}

	public void setPropertyManagement(Double propertyManagement) {
		this.propertyManagement = propertyManagement;
	}

	public String getPropertyCompany() {
		return this.propertyCompany;
	}

	public void setPropertyCompany(String propertyCompany) {
		this.propertyCompany = propertyCompany;
	}

	public String getWaterSupply() {
		return this.waterSupply;
	}

	public void setWaterSupply(String waterSupply) {
		this.waterSupply = waterSupply;
	}

	public String getHeatingSupply() {
		return this.heatingSupply;
	}

	public void setHeatingSupply(String heatingSupply) {
		this.heatingSupply = heatingSupply;
	}

	public String getBusinessDevelopment() {
		return this.businessDevelopment;
	}

	public void setBusinessDevelopment(String businessDevelopment) {
		this.businessDevelopment = businessDevelopment;
	}

	public String getInvestors() {
		return this.investors;
	}

	public void setInvestors(String investors) {
		this.investors = investors;
	}

	public String getPreLicense() {
		return this.preLicense;
	}

	public void setPreLicense(String preLicense) {
		this.preLicense = preLicense;
	}

	public String getProjectIns() {
		return this.projectIns;
	}

	public void setProjectIns(String projectIns) {
		this.projectIns = projectIns;
	}

	public String getTrends() {
		return this.trends;
	}

	public void setTrends(String trends) {
		this.trends = trends;
	}

	public String getLifeSupport() {
		return this.lifeSupport;
	}

	public void setLifeSupport(String lifeSupport) {
		this.lifeSupport = lifeSupport;
	}

	public String getNeighborhoods() {
		return this.neighborhoods;
	}

	public void setNeighborhoods(String neighborhoods) {
		this.neighborhoods = neighborhoods;
	}

	public String getTraffic() {
		return this.traffic;
	}

	public void setTraffic(String traffic) {
		this.traffic = traffic;
	}

	public String getOther() {
		return this.other;
	}

	public void setOther(String other) {
		this.other = other;
	}

	public String getPositionX() {
		return this.positionX;
	}

	public void setPositionX(String positionX) {
		this.positionX = positionX;
	}

	public String getPositionY() {
		return this.positionY;
	}

	public void setPositionY(String positionY) {
		this.positionY = positionY;
	}

	public String getAddressName() {
		return this.addressName;
	}

	public void setAddressName(String addressName) {
		this.addressName = addressName;
	}

	public Integer getAuthorId() {
		return this.authorId;
	}

	public void setAuthorId(Integer authorId) {
		this.authorId = authorId;
	}

	public String getCompressUrl() {
		return this.compressUrl;
	}

	public void setCompressUrl(String compressUrl) {
		this.compressUrl = compressUrl;
	}

	public Integer getAttentionNum() {
		return this.attentionNum;
	}

	public void setAttentionNum(Integer attentionNum) {
		this.attentionNum = attentionNum;
	}

	public Integer getViews() {
		return this.views;
	}

	public void setViews(Integer views) {
		this.views = views;
	}

	public String getIsView() {
		return isView;
	}

	public void setIsView(String isView) {
		this.isView = isView;
	}

	public String getIsAttention() {
		return isAttention;
	}

	public void setIsAttention(String isAttention) {
		this.isAttention = isAttention;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getDisname() {
		return disname;
	}

	public void setDisname(String disname) {
		this.disname = disname;
	}

	public Integer getShowingsnum() {
		return showingsnum;
	}

	public void setShowingsnum(Integer showingsnum) {
		this.showingsnum = showingsnum;
	}

	public String getCheckdataString() {
		return checkdataString;
	}

	public void setCheckdataString(String checkdataString) {
		this.checkdataString = checkdataString;
	}

	public String getAuditingState() {
		return auditingState;
	}

	public void setAuditingState(String auditingState) {
		this.auditingState = auditingState;
	}

    public Integer getMinPrice() {
        return minPrice;
    }

    public void setMinPrice(Integer minPrice) {
        this.minPrice = minPrice;
    }

    public Integer getAveragePrice() {
        return averagePrice;
    }

    public void setAveragePrice(Integer averagePrice) {
        this.averagePrice = averagePrice;
    }

    public Integer getMaxPrice() {
        return maxPrice;
    }

    public void setMaxPrice(Integer maxPrice) {
        this.maxPrice = maxPrice;
    }



}