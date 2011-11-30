package com.estate.base.DBUtil;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import org.apache.log4j.Logger;

import com.estate.util.file.XmlUtil;

/**
 * some jsp space don't support jndi
 * use this class to connect db
 * need Optimization
 * @author FC
 * @Date 2011 - 03 - 08
 * 
 */
public class JDBConnection {
	private static Logger log = Logger.getLogger(JDBConnection.class);
	private final static String dbDriver = XmlUtil.getValue("dataBaseDbDriver", "sysConfig");
	private final static String url = XmlUtil.getValue("dataBaseUrl", "sysConfig");
	// private final static String url = "jdbc:mysql://localhost:3306/365jh";
	private final static String userName = XmlUtil.getValue("dataBaseUserName", "sysConfig");
	// private final static String userName = "root";
	private final static String password = XmlUtil.getValue("dataBasePassword", "sysConfig");
	// private final static String password = "fc1986";
	private static Connection con = null;

	static {
		try {
			Class.forName(dbDriver).newInstance(); // init driver
		} catch (Exception ex) {
			log.error("init jdbc driver failed", ex);
		}
	}

	public static Connection getConnection() {
		try {
			con = DriverManager.getConnection(url, userName, password);
			con.setAutoCommit(true);
		} catch (SQLException e) {
			log.error("connect db failed", e);
		}
		return con;
	}

	public static void closeConn(Connection conn) {
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				log.error("close connection failed", e);
			} finally {
				conn = null;
			}
		}
	}
}
