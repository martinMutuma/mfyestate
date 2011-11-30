package com.estate.business.service.pro;

import java.util.List;
import java.util.Map;

import com.estate.domain.pro.OfficeNeed;



public interface OfficeNeedService {
     /*
      * 增加需求信息
      */
     public boolean  addNeed(OfficeNeed need);
     /**
      * 查询所有信息
      */
      public   List<OfficeNeed>  getAllList(Map<String, String> map,String start,String limt);
     /**
      *  根据id删除需求信息
      */
     public  boolean  deleteById(String id, String  type);

     /**
      * 根据求租类型 审核状态查询 符合条件的结果集
      */
     public  int getcount(Map<String,String> map);
     /**
      *  删除多个需求信息
      */
     public boolean deleteByIdString(String idString,String type);
     /**
      * 根据 id查询 需求信息
      */
     public   OfficeNeed  getOfficeNeedById(String  id,String  type);
     
}
