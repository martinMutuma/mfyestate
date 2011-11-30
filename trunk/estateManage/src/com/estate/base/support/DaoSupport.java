package com.estate.base.support;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.estate.base.DBUtil.DBUtil;
import com.estate.base.DBUtil.JDBConnection;
import com.estate.util.file.XmlUtil;

/**
 * excute sql to update or query data from db(BASE CRUD Operation)
 * 
 * @author FC
 * @Date 2010-12-10
 * @version 1.0 Optimization records(date author updates): eg: 2010-12-29 FC
 *          添加根据系统配置获取与数据库连接方式
 */
public class DaoSupport {
	private final static Logger log = Logger.getLogger(DaoSupport.class);
	private final static String jndi_driver = XmlUtil.getValue("jndi",
			"sysConfig");
	public final static String DBType = XmlUtil.getValue("dataBaseType",
			"sysConfig");

	/**
	 * 普通插入、更新
	 * 
	 * @param sql
	 * @return
	 */
	public boolean execute(String sql) {
		return execute(sql, null);
	}

	/**
	 * 防止注入形式更新、插入
	 * 
	 * @param sql
	 * @param objArray
	 * @return
	 */
	public boolean execute(String sql, Object[] objArray) {
		boolean flag = true;
		Connection conn = null;
		PreparedStatement pstmt = null;
		int count = 0;
		try {
			if ("1".equals(jndi_driver))
				conn = DBUtil.getConnection();
			else
				conn = JDBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			if (null != objArray && objArray.length > 0) {
				for (int i = 0; i < objArray.length; i++) {
					pstmt.setObject((i + 1), objArray[i]);
				}
			}
			count = pstmt.executeUpdate();
			log.info("操作成功,所影响记录条数为" + count + "条");
		} catch (Exception e) {
			log.error("execute error", e);
			flag = false;
		} finally {
			try {
				pstmt.close();
			} catch (SQLException e) {
				log.error("PreparedStatement 关闭失败", e);
			}
			if ("1".equals(jndi_driver))
				DBUtil.closeConn(conn);
			else
				JDBConnection.closeConn(conn);
		}
		return flag;
	}

	/**
	 * 根据sql语句查询数据,返回Map列表
	 * 
	 * @param sql
	 * @return
	 */
	public List<Map<String, Object>> find(String sql, String[] conditionArray) {
		return find(sql, null, conditionArray);
	}

	/**
	 * 防止注入形式根据sql语句查询数据
	 * 
	 * @param sql
	 * @param objArray
	 * @param conditionArray
	 * @return
	 */
	public List<Map<String, Object>> find(String sql, Object[] objArray,
			String[] conditionArray) {
		Connection conn = null;
		ResultSet rs = null;
		List<Map<String, Object>> list = null;
		PreparedStatement pstmt = null;
		try {
			if ("1".equals(jndi_driver))
				conn = DBUtil.getConnection();
			else
				conn = JDBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			if (null != objArray && objArray.length > 0) {
				for (int i = 0; i < objArray.length; i++) {
					pstmt.setObject((i + 1), objArray[i]);
				}
			}
			rs = pstmt.executeQuery();
			int length = conditionArray.length;
			while (rs.next()) {
				Map<String, Object> map = new HashMap<String, Object>();
				for (int i = 0; i < length; i++) {
					map.put(conditionArray[i], rs.getObject(conditionArray[i]));
				}
				if (null == list)
					list = new ArrayList<Map<String, Object>>();
				list.add(map);
			}
		} catch (Exception e) {
			log.error("find error", e);
		} finally {
			try {
				pstmt.close();
			} catch (SQLException e) {
				log.error("PreparedStatement 关闭失败", e);
			}
			if ("1".equals(jndi_driver))
				DBUtil.closeConn(conn);
			else
				JDBConnection.closeConn(conn);
		}
		return list;
	}

	/**
	 * 根据sql查询数据，返回数据列表
	 * 
	 * @param sql
	 * @param length
	 * @return
	 */
	public List<Object[]> findObjList(String sql, int length) {
		return findObjList(sql, null, length);
	}

	/**
	 * 防止注入根据sql查询数据，返回数据列表
	 * 
	 * @param sql
	 * @param length
	 * @return
	 */
	public List<Object[]> findObjList(String sql, Object[] objArray, int length) {
		Connection conn = null;
		ResultSet rs = null;
		List<Object[]> list = null;
		PreparedStatement pstmt = null;
		try {
			if ("1".equals(jndi_driver))
				conn = DBUtil.getConnection();
			else
				conn = JDBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			if (null != objArray)
				if (null != objArray && objArray.length > 0) {
					for (int i = 0; i < objArray.length; i++) {
						pstmt.setObject((i + 1), objArray[i]);
					}
				}
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Object[] obj = new Object[length];
				for (int i = 0; i < length; i++) {
					obj[i] = rs.getObject((i + 1));
				}
				if (null == list)
					list = new ArrayList<Object[]>();
				list.add(obj);
			}
		} catch (Exception e) {
			log.error("find error", e);
		} finally {
			try {
				pstmt.close();
			} catch (SQLException e) {
				log.error("PreparedStatement 关闭失败", e);
			}
			if ("1".equals(jndi_driver))
				DBUtil.closeConn(conn);
			else
				JDBConnection.closeConn(conn);
		}
		return list;
	}

	/**
	 * 插入对象,并返回该对象主键
	 * 
	 * @param sql
	 * @param paramObj
	 * @return
	 */
	public Long insert(String sql, Object[] paramObj) {
		Connection conn = null;
		PreparedStatement stat = null;
		Long returnId = 0l;
		try {
			if ("1".equals(jndi_driver))
				conn = DBUtil.getConnection();
			else
				conn = JDBConnection.getConnection();
			stat = conn.prepareStatement(sql);
			for (int i = 0; i < paramObj.length; i++) {
				stat.setObject((i + 1), paramObj[i]);
			}
			int count = stat.executeUpdate();
			log.info("操作成功,所影响记录条数为" + count + "条");
			String getIdSql = "";
			if ("1".equals(DBType))
				getIdSql = "select last_insert_id() as id";
			else if ("2".equals(DBType))
				getIdSql = "select @@IDENTITY as id";
			else if ("3".equals(DBType))
				getIdSql = "select stockidsequence.nextval as id from dual ";
			ResultSet rs = stat.executeQuery(getIdSql);
			Object id = null;
			while (rs.next()) {
				id = rs.getObject(1);
				break;
			}
			returnId = new Long(id.toString());
		} catch (Exception e) {
			log.error("insert error", e);
		} finally {
			try {
				stat.close();
			} catch (SQLException e) {
				log.error("Statement 关闭失败", e);
			}
			if ("1".equals(jndi_driver))
				DBUtil.closeConn(conn);
			else
				JDBConnection.closeConn(conn);
		}
		return returnId;
	}

	public SqlQuery createSqlQuery(String sql) {
		return new SqlQuery(sql, this);
	}

	/**
	 * 获取连接
	 * 
	 * @return
	 */
	public static Connection getConnection() {
		if ("1".equals(jndi_driver))
			return DBUtil.getConnection();
		else
			return JDBConnection.getConnection();
	}

	/**
	 * 关闭连接
	 * 
	 * @return
	 */
	public static void closeConnect(Connection conn) {
		if ("1".equals(jndi_driver))
			DBUtil.closeConn(conn);
		else
			JDBConnection.closeConn(conn);
	}
}
