package com.estate.util.file;

import java.util.Iterator;
import java.util.List;

import org.jdom.Document;
import org.jdom.Element;
import org.jdom.input.SAXBuilder;

/**
 * 高级搜索工具类
 * 
 * @author F.C 第一次修订时间：2011-11-10
 * 
 */
@SuppressWarnings("unchecked")
public class SeniorSearchUtil {
	private static final String rootPath = XmlUtil.class.getClassLoader()
			.getResource("com/estate/resource/").getPath()
			+ "seniorSearch.xml";

	private static SAXBuilder builder = new SAXBuilder(false);
	private static Document doc;
	private static Element root;
	private static List<Element> collectionList;
	static {
		try {
			doc = builder.build(rootPath);
			root = doc.getRootElement();
			collectionList = root.getChildren("table");
		} catch (Exception e) {
		}
	}

	/**
	 * 获取项目配置中的信息
	 * 
	 * @param codeName
	 * @param flag
	 *            1：表名 2：标题/姓名等 3：显示详细信息的查询语句 4:构建关键字查询sql语句 5：构建关键字查询总数sql语句
	 *            6:构建复杂查询sql中的select...from语句
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static String bulidProInfo(String codeName, int flag) {
		try {
			for (Iterator iterator = collectionList.iterator(); iterator
					.hasNext();) {
				Element collection = (Element) iterator.next();
				String name = collection.getAttributeValue("name");
				if (codeName.equals(name)) {
					switch (flag) {
					case 1:
						return bulidTableName(collection);
					case 2:
						return bulidTitle(collection);
					case 3:
						return bulidShowInfo(collection);
					case 4:
						return bulidKeyWordSearchSql(collection);
					case 5:
						return bulidKeyWordSearchCountSql(collection);
					case 6:
						return bulidSeniorSearchSql(collection);
					}
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}

	@SuppressWarnings("unchecked")
	private static String bulidTableName(Element collection) {
		Element data = collection.getChild("tablename");
		return data.getTextTrim();
	}

	@SuppressWarnings("unchecked")
	private static String bulidTitle(Element collection) {
		Element data = collection.getChild("title");
		return data.getTextTrim();
	}

	@SuppressWarnings("unchecked")
	private static String bulidShowInfo(Element collection) {
		Element data = collection.getChild("showInfo");
		return data.getTextTrim();
	}

	@SuppressWarnings("unchecked")
	private static String bulidKeyWordSearchSql(Element collection) {
		Element data = collection.getChild("keywordSearch");
		return data.getTextTrim();
	}

	@SuppressWarnings("unchecked")
	private static String bulidKeyWordSearchCountSql(Element collection) {
		Element data = collection.getChild("keywordSearch-countSql");
		return data.getTextTrim();
	}

	private static String bulidSeniorSearchSql(Element collection) {
		Element data = collection.getChild("seniorSearch");
		return data.getTextTrim();
	}

}
