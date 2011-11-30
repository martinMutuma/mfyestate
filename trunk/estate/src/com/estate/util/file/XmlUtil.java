package com.estate.util.file;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;
import java.util.regex.Pattern;

import org.jdom.Attribute;
import org.jdom.Document;
import org.jdom.Element;
import org.jdom.JDOMException;
import org.jdom.input.SAXBuilder;

import com.estate.domain.member.Hononr;

public class XmlUtil {

	// 路径
	private static String rootPath = XmlUtil.class.getClassLoader()
			.getResource("com/estate/resource/").getPath();
	// 递归方法的临时变量
	private static Element recursionTemp = null;

	/**
	 * 根据key取value值
	 * 
	 * @param key
	 * @param name
	 *            不包含后缀名的名字
	 * @return String
	 */
	@SuppressWarnings("unchecked")
	public static String getValue(String key, String name) {
		String value = null;
		try {
			if (key != null && !key.equals("")) {
				Map<String, String> map = (Map<String, String>) getMap(name, 1);
				value = map.get(key);

				// 如果map的键值类型为数字型，按数字型取值
				if ((value == null || value.equals(""))
						&& Pattern.matches("\\d+", key)) {
					value = map.get(Integer.parseInt(key));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return value.trim();
	}

	/**
	 * 根据路径取配置文件map
	 * 
	 * @param name
	 *            不包含后缀名的名字
	 * @param type
	 *            1：HashMap不排序，其它值TreeMap排序
	 * @return Map<?,String> 数字键值返回Integer键类型，否则String类型 参数type
	 *         1：HashMap不排序，其它值TreeMap排序
	 */
	@SuppressWarnings("unchecked")
	public static Map<?, String> getMap(String name, int type) {

		try {
			Map<Object, String> map;

			if (type == 1) {
				map = new HashMap<Object, String>();
			} else {
				map = new TreeMap<Object, String>();
			}

			SAXBuilder sb = new SAXBuilder();
			// 构造文档对象
			Document doc = sb.build(rootPath + name + ".xml");
			// 获取根元素
			Element root = doc.getRootElement();

			List<Element> temp = root.getChildren();
			for (int i = 0; i < temp.size(); i++) {
				Element element = (Element) temp.get(i);
				if (Pattern.matches("\\d+", element.getAttributeValue("name"))) {
					map
							.put(Integer.parseInt(element
									.getAttributeValue("name")), element
									.getValue());
				} else {
					map.put(element.getAttributeValue("name"), element
							.getValue());
				}
			}

			return map;
		} catch (JDOMException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return null;
	}

	/**
	 * 根据路径取配置文件mapList 取出全部属性为key，属性值为value，子集key为children
	 * 
	 * @author: zhengsunlei Mar 12, 2010 4:15:04 PM
	 * @param name
	 *            不包含后缀名的名字
	 * @param type
	 *            1：HashMap不排序，其它值TreeMap排序
	 * @return List<Map<String,Object>> 取出全部属性为key，属性值为value，子集key为children
	 */
	@SuppressWarnings("unchecked")
	public static List<Map<String, Object>> getMapList(String name, int type) {
		// 最终返回的list map
		List<Map<String, Object>> resMapList = null;
		try {
			// 获取根元素--先取出递归变量中的值
			Element root = recursionTemp;

			// 如果递归变量为空
			if (root == null) {
				// 读取文件
				SAXBuilder sb = new SAXBuilder();
				// 构造文档对象
				Document doc = sb.build(rootPath + name + ".xml");
				// 获取根元素
				root = doc.getRootElement();
			}
			// 取出子元素列表
			List<Element> tempRoot = root.getChildren();

			if (tempRoot != null && tempRoot.size() > 0) {

				// 遍历元素集合，取出所有属性，如果有子集，通过递归方法继续获取
				for (Element temp : tempRoot) {

					// 取出本节点属性集
					List<Attribute> attrLst = temp.getAttributes();
					// 创建以属性名为key，以对应值为value的map
					Map<String, Object> mapTemp = null;
					if (attrLst != null && attrLst.size() > 0) {
						// 根据参数不同创建有序或无序的集合
						if (type == 1) {
							mapTemp = new HashMap<String, Object>();
						} else {
							mapTemp = new TreeMap<String, Object>();
						}
						for (Attribute attr : attrLst) {
							mapTemp.put(attr.getName(), attr.getValue());
						}
					}

					// 如果有子集，将此节点存入递归临时变量，调用递归方法
					if (temp.getChildren() != null
							&& temp.getChildren().size() > 0) {
						// 将带有子集的元素存入临时变量
						recursionTemp = temp;
						// 执行递归
						List<Map<String, Object>> childrenList = getMapList(
								name, type);
						// 存入子集
						mapTemp.put("children", childrenList);
					}

					// 如果list为空，创建list
					if (resMapList == null) {
						resMapList = new ArrayList<Map<String, Object>>();
					}
					resMapList.add(mapTemp);
				}
			}

		} catch (JDOMException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			// 无论如何，清空递归临时变量
			recursionTemp = null;
		}
		return resMapList;
	}

	/**
	 * 头衔
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static Map<String, Hononr> getHononrList() {
		Map<String, Hononr> map1 = new HashMap<String, Hononr>();
		try {
			SAXBuilder sax = new SAXBuilder();
			Document doc = sax.build(rootPath + "member_honor.xml");
			Element el = doc.getRootElement();
			List<Element> list = el.getChildren("honor"); 
			for (Element menuObject : list) {
				Hononr hononr = new Hononr();
				String htype = menuObject.getAttributeValue("htype");
				String hname = menuObject.getAttributeValue("hname");
				hononr.setType(htype);
				hononr.setName(hname);
				List<Element> listlevel = menuObject.getChildren("level");
				Map<String, Hononr> map2 = new HashMap<String, Hononr>();
				for (int i = 0; i < listlevel.size(); i++) {
					Element element = listlevel.get(i);
					Hononr lhononr = new Hononr();
					String ltype = element.getAttributeValue("ltype");
					String lscore = element.getChildTextTrim("lscore");
					String lname = element.getChildTextTrim("lname");
					lhononr.setType(ltype);
					lhononr.setScore(lscore);
					lhononr.setName(lname);
					map2.put(ltype,lhononr);
				}
				hononr.setChildren(map2);
				map1.put(htype, hononr);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map1;
	}
	
	
	public static void main(String[] args) {
		long start = new Date().getTime();
		for (int i = 0; i < 1000 * 10; i++) {
			XmlUtil.getValue("2", "seniorSearch");
		}
		System.out.println(new Date().getTime() - start);
	}

}
