package com.estate.util.comm;


import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.estate.base.web.BaseAction;

@SuppressWarnings("serial")
public class ImageUploadUtil extends BaseAction {
	 private File imgFile;   
	 private String imgWidth;   
	 private String imgHeight;   
	 private String align;   
	 private String imgTitle;   
	 public  String  upload(){
		 if(null==imgWidth || "".equals(imgWidth)) imgWidth="4px";
		 if(null==imgHeight || "".equals(imgHeight)) imgHeight="4px";
		 String imageName ="content"+new Date().getTime()+Math.random()*10000+".jpg";   
		 File dirPath =new File(request.getSession().getServletContext().getRealPath("/")+"\\resource\\js\\kindeditor\\attached");   
	        //如果文件夹不存在，创建它   
	        if(!dirPath.exists()){   
	            dirPath.mkdirs();   
	        }   
	        //文件存放路径   
	        String newPath = dirPath+"\\"+imageName;      
	        //上传文件   
	        try {   
	            copy(imgFile, newPath);   
	        } catch (Exception e1) {   
	            e1.printStackTrace();   
	        }      
	           
	        String id = "content";      
	                String url = "http://" + request.getServerName() + ":"+ request.getServerPort() + request.getContextPath()    
	                +"/resource/js/kindeditor/attached/" + imageName;      
	  
	        String border = "0";      
	        String result =    
	            "<script type=\"text/javaScript\">parent.KE.plugin[\"image\"].insert(\""     
	                + id      
	                + "\",\""     
	                + url      
	                + "\",\""     
	                + imgTitle      
	                + "\",\""     
	                + imgWidth      
	                + "px\",\""    
	                + imgHeight    
	                + "px\",\""    
	                + border + "\""    
	                +");</script>";      
	        PrintWriter out = null;   
	        try {   
	            out =encodehead(request, response);   
	        } catch (IOException e) {   
	            e.printStackTrace();   
	        }   
	        out.write(result);   
	        out.close();    
	        return null;   

     }
	 private void copy(File upload, String newPath) throws Exception {      
	        FileOutputStream fos = new FileOutputStream(newPath);      
	        FileInputStream fis = new FileInputStream(upload);      
	        byte[] buffer = new byte[1024];      
	        int len = 0;      
	        while ((len = fis.read(buffer)) > 0) {      
	            fos.write(buffer, 0, len);      
	        }      
	        fos.close();      
	        fis.close();      
     }     
	 private PrintWriter encodehead(HttpServletRequest request,HttpServletResponse response) throws IOException{   
	        request.setCharacterEncoding("utf-8");   
	        response.setContentType("text/html; charset=utf-8");   
	        return response.getWriter();   
	    }   
	  
       

	public File getImgFile() {
		return imgFile;
	}
	public void setImgFile(File imgFile) {
		this.imgFile = imgFile;
	}
	public String getImgWidth() {
		return imgWidth;
	}
	public void setImgWidth(String imgWidth) {
		this.imgWidth = imgWidth;
	}
	public String getImgHeight() {
		return imgHeight;
	}
	public void setImgHeight(String imgHeight) {
		this.imgHeight = imgHeight;
	}
	public String getAlign() {
		return align;
	}
	public void setAlign(String align) {
		this.align = align;
	}
	public String getImgTitle() {
		return imgTitle;
	}
	public void setImgTitle(String imgTitle) {
		this.imgTitle = imgTitle;
	}
 
}
