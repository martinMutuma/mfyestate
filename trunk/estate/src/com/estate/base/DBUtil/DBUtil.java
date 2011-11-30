package com.estate.base.DBUtil;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import org.apache.log4j.Logger;

import com.estate.util.file.XmlUtil;

/**
 * JNDI连接数据�? * @author fc
 * 2010-12-05
 *
 */
public class DBUtil {
	private static Connection conn;
	private static DataSource ds;
	private static Logger log = Logger.getLogger(DBUtil.class);
	static{
		try{
			//初始化查找命名空�?			
			Context ctx = new InitialContext();
			//InitialContext ctx = new InitialContext();亦可 
			//找到DataSource,对名称进行定位java:comp/env是必须加�?后面跟你的DataSource�?
			ds = (DataSource) ctx.lookup("java:comp/env/jndi/"+XmlUtil.getValue("dataBaseName", "sysConfig"));	
		}catch (NamingException e) {
			log.error("jndi获取错误", e);
		} 
	}
	
	public static Connection getConnection(){
		try{
			//取出连接
			conn = ds.getConnection();
		}catch (SQLException e) {
			log.error("获取连接错误", e);
		}
		return conn;
	}
	
	public static boolean closeConn(Connection conn){
		boolean flag = true;
		//注意不是关闭,是放回连接池.
		try {
			conn.close();
		} catch (SQLException e) {
			log.error("连接释放错误",e);
			flag = false;
		}
		return flag;
	}
}
