package com.estate.base.support;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Types;
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
 * 
 */
public class DaoSupport {
	private final static Logger log = Logger.getLogger(DaoSupport.class);
	private final static String jndi_driver = XmlUtil.getValue("jndi",
			"sysConfig");
	public final static String DBType = XmlUtil.getValue("dataBaseType",
			"sysConfig");
	private final static String showSql = XmlUtil.getValue("show_sql",
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
		if ("true".equals(showSql))
			log.info("DAOSUPPORT:" + sql);
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
			pstmt = bulidPS(pstmt, objArray);
			count = pstmt.executeUpdate();
			log.info("操作成功,所影响记录条数为" + count + "条");
		} catch (Exception e) {
			log.error("execute error,query : " + sql, e);
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
	public List<Map<String, Object>> find(String sql) {
		return find(sql,null);
	}

	/**
	 * 防止注入形式根据sql语句查询数据
	 * 
	 * @param sql
	 * @param objArray
	 * @param conditionArray
	 * @return
	 */
	public List<Map<String, Object>> find(String sql, Object[] objArray) {
		if ("true".equals(showSql))
			log.info("DAOSUPPORT:" + sql);
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
			pstmt = bulidPS(pstmt, objArray);
			rs = pstmt.executeQuery();
			list = bulidResultMapList(rs);
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
	public List<Object[]> findObjList(String sql) {
		return findObjList(sql, null);
	}

	/**
	 * 防止注入根据sql查询数据，返回数据列表
	 * 
	 * @param sql
	 * @param length
	 * @return
	 */
	public List<Object[]> findObjList(String sql, Object[] objArray) {
		if ("true".equals(showSql))
			log.info("DAOSUPPORT:" + sql);
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
			pstmt = bulidPS(pstmt, objArray);
			rs = pstmt.executeQuery();
			ResultSetMetaData metaData = rs.getMetaData();
			int colum = metaData.getColumnCount();
			while (rs.next()) {
				Object[] obj = new Object[colum];
				for (int i = 0; i < colum; i++) {
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
		if ("true".equals(showSql))
			log.info("DAOSUPPORT:" + sql);
		Connection conn = null;
		PreparedStatement stat = null;
		Long returnId = 0l;
		try {
			if ("1".equals(jndi_driver))
				conn = DBUtil.getConnection();
			else
				conn = JDBConnection.getConnection();
			stat = conn.prepareStatement(sql);
			stat = bulidPS(stat, paramObj);
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

	public SqlQuery createSqlQuery(String sql, boolean flag) {
		return new SqlQuery(sql, this, flag);
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

	// *****特殊处理方法***********
	private List<Map<String, Object>> bulidResultMapList(ResultSet rs)
			throws SQLException {
		List<Map<String, Object>> resultList = new ArrayList<Map<String, Object>>();
		ResultSetMetaData metaData = rs.getMetaData();
		int colum = metaData.getColumnCount();
		Map<String, Integer> columnMap = new HashMap<String, Integer>();
		for (int i = 1; i <= colum; i++) {
			Integer typeStr = 0;
			String columnName = metaData.getColumnName(i);// 获取列名
			int type = metaData.getColumnType(i);
			if (Types.INTEGER == type) {
				typeStr = 1;// Long
			} else if (Types.VARCHAR == type) {
				typeStr = 2;// String
			} else if (Types.DOUBLE == type) {
				typeStr = 3;// Double
			} else if (Types.FLOAT == type) {
				typeStr = 4;// Float
			} else if (Types.CHAR == type) {
				typeStr = 5;// String
			} else if (Types.TIMESTAMP == type) {
				typeStr = 6;// Date
			} else if (Types.DATE == type) {
				typeStr = 7;// Date
			}
			columnMap.put(columnName, typeStr);
		}
		while (rs.next()) {
			Map<String, Object> rowMap = new HashMap<String, Object>();
			for (String columnName : columnMap.keySet()) {
				Integer typeStr = columnMap.get(columnName);
				Object value = null;
				switch (typeStr) {
				case 1:
					value = rs.getLong(columnName);
					break;
				case 2:
					value = rs.getString(columnName);
					break;
				case 3:
					value = rs.getDouble(columnName);
					break;
				case 4:
					value = rs.getFloat(columnName);
					break;
				case 5:
					value = rs.getString(columnName);
					break;
				case 6:
					value = rs.getObject(columnName);
					break;
				case 7:
					value = rs.getDate(columnName);
					break;
				default:
					value = rs.getObject(columnName);
					break;
				}
				rowMap.put(columnName, value);
			}
			resultList.add(rowMap);
		}
		if (null == resultList)
			resultList = new ArrayList<Map<String, Object>>();
		return resultList;
	}

	private PreparedStatement bulidPS(PreparedStatement ps, Object[] objAry)
			throws SQLException {
		if (null != objAry && objAry.length > 0) {
			for (int i = 0; i < objAry.length; i++) {
				ps.setObject((i + 1), objAry[i]);
			}
		}
		return ps;
	}
}

//常见数据库字段类型与java.sql.Types的对应  
//
//Oracle与java.sql.Types的对应   
//  
//Oracle                             java.sql.Types    
//   blob                            blob  
//   char                            char  
//   clob                            clob  
//   date                            date  
//   number                          decimal  
//   long                            varbinary  
//   nclob,nvarchar2                 other  
//   smallint                        smallint  
//   timestamp                       timstamp  
//   raw                             varbinary  
//   varchar2                        varchar  
//  
//Sql server与java.sql.Types的对应   
//  
//Sql server                         java.sql.Types  
//  bigint (2005,2008)               bigint  
//  timstamp,binary                  binary  
//  bit                              bit  
//  char,nchar,unqualified           char  
//  datetime                         date  
//  money,smallmoney,decimal         decimal  
//  float (2005,2008)                double  
//  float(2000)                      float  
//  int                              integer  
//  image                            longvarbinary  
//  text,ntext,xml                   longvarchar  
//  numeric                          numeric  
//  real                             real  
//  smallint                         smallint  
//  datetime,smalldatetime           timestamp  
//  tinyint                          tinyint  
//  varbinary                        varbinay  
//  nvarchar,varchar                 varchar  
//  
//DB2与java.sql.Types的对应   
//  bigint                           bigint  
//  blob                             blob  
//  character,graphic                char  
//  clob                             clob  
//  date                             date  
//  decimal                          decimal  
//  double                           double  
//  integer                          integer  
//  longvargraphic                   longvarchar  
//  longvarchar  
//  real                             real  
//  smallint                         smallint  
//  time                             time  
//  timestamp                        timestamp  
//  vargraphic                       varchar  
//  varchar  
//  
//MySQL与java.sql.Types的对应   
//  
//MySQL                          java.sql.Types  
//   bigint                          bigint  
//   tinyblob                        binary  
//   bit                             bit  
//   enum,set,char                   char  
//   date,year                       date  
//   decimal,numeric                 decimal  
//   double,real                     double  
//   mediumint,int                   integer  
//   blob,mediumblob                 blob  
//   longblob  
//   float                           real  
//   smallint                        smallint  
//   time                            time  
//   timestamp,datetime              timestamp  
//   tinyint                         tinyint  
//   varbinary,binary                varbinay  
//   varchar,tinytext,text           varchar  
//  
//  
//Sybase与java.sql.Types的对应   
//  
//Sybase                             java.sql.Types  
//   binary                          binary  
//   bit                             bit  
//   char,nchar,                     char  
//   money,smallmoney,decimal        decimal  
//   float                           double  
//   int                             integer  
//   image                           longvarbinary  
//   text                            longvarchar  
//   numeric                         numeric  
//   real                            real  
//   smallint                        smallint  
//   datetime,smalldatetime          timestamp  
//   tinyint                         tinyint  
//   varbinar,timestamp              varbinay  
//   nvarchar,varchar ,sysname       varchar  

