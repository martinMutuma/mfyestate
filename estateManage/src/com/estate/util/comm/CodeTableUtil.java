package com.estate.util.comm;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.jdom.Document;
import org.jdom.Element;
import org.jdom.input.SAXBuilder;

import com.estate.util.file.XmlUtil;

/**
 * 码表工具类
 * 
 * @author F.C 第一次修订时间：2011-10-30
 */
@SuppressWarnings("unchecked")
public class CodeTableUtil {

	private static final String rootPath = XmlUtil.class.getClassLoader()
			.getResource("com/estate/resource/").getPath()
			+ "codeTable.xml";

	private static SAXBuilder builder = new SAXBuilder(false);
	private static Document doc;
	private static Element root;
	private static List<Element> collectionList;
	static {
		try {
			doc = builder.build(rootPath);
			root = doc.getRootElement();
			collectionList = root.getChildren("collection");
		} catch (Exception e) {
		}
	}

	/**
	 * 根据编码名称获取值列表
	 * 
	 * @param codeName
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static Map<String, String> bulidDataMap(String codeName) {
		try {
			for (Iterator iterator = collectionList.iterator(); iterator
					.hasNext();) {
				Element collection = (Element) iterator.next();
				String name = collection.getAttributeValue("name");
				if (codeName.equals(name)) {
					return bulidChildren(collection);
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@SuppressWarnings("unchecked")
	public static String bulidDataValue(String codeName, String code) {
		try {
			for (Iterator iterator = collectionList.iterator(); iterator
					.hasNext();) {
				Element collection = (Element) iterator.next();
				String name = collection.getAttributeValue("name");
				if (codeName.equals(name)) {
					return bulidValue(collection, code);
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}

	@SuppressWarnings("unchecked")
	private static Map<String, String> bulidChildren(Element collection) {
		Map<String, String> map = new HashMap<String, String>();
		List<Element> dataList = collection.getChildren("code");
		for (Iterator iterator = dataList.iterator(); iterator.hasNext();) {
			Element code = (Element) iterator.next();
			map.put(code.getAttributeValue("value"), code.getTextTrim());
		}
		return map;
	}

	@SuppressWarnings("unchecked")
	private static String bulidValue(Element collection, String codeValue) {
		List<Element> dataList = collection.getChildren("code");
		String value = "";
		codeValue = "," + codeValue.replaceAll(" ", "") + ",";
		for (Iterator iterator = dataList.iterator(); iterator.hasNext();) {
			Element code = (Element) iterator.next();
			if (codeValue.indexOf("," + code.getAttributeValue("value") + ",") != -1)
				value += code.getTextTrim() + " ";
		}
		return value;
	}

	public static void main(String[] args) {
		// long start = new Date().getTime();
		// for (int i = 0; i < 1000 * 100; i++) {
		//				
		// }
		// System.out.println(new Date().getTime() - start);
		System.out.println(bulidDataValue("租赁支付方式", "1"));
	}
}
