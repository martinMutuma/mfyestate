package com.estate.util.file;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.jdom.Document;
import org.jdom.Element;
import org.jdom.JDOMException;
import org.jdom.input.SAXBuilder;

import com.estate.domain.system.TsMenu;
/**
 * 获取会员中心菜单
 * @author F.C
 * 第一次修订时间：2011-10-31
 *
 */
@SuppressWarnings("unchecked")
public class MenuUtil {
	private static String rootPath = XmlUtil.class.getClassLoader()
			.getResource("com/estate/resource/").getPath()
			+ "menu.xml";
	private static SAXBuilder sax;
	private static Document doc;
	private static Element root;
	private static List<Element> list;
	static {
		sax = new SAXBuilder();
		try {
			doc = sax.build(rootPath);
			root = doc.getRootElement();
		} catch (JDOMException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	@SuppressWarnings("unchecked")
	public static List getMenuList() {
		List<TsMenu> menuList = new ArrayList<TsMenu>();
		try {
			list = root.getChildren("menu"); // 得到menu节点集
			for (Element menuObject : list) {
				TsMenu menu = new TsMenu();
				String name = menuObject.getChildTextTrim("name");
				String tip = menuObject.getChildTextTrim("tip");
				String url = menuObject.getChildTextTrim("url");
				String descr = menuObject.getChildTextTrim("descr");
				String needRight = menuObject.getChild("allow-groups")
						.getAttributeValue("enable");
				String allowGroups = menuObject
						.getChildTextTrim("allow-groups");
				menu.setName(name);
				menu.setTip(tip);
				menu.setUrl(url);
				menu.setDescr(descr);
				if ("true".equals(needRight))
					menu.setAllowGroups(allowGroups);
				else
					menu.setAllowGroups("all");
				menu
						.setChildren(bulidChildren(menuObject
								.getChild("children")));
				Element categoryList = menuObject.getChild("category-list");
				if (null != categoryList) {
					List<Element> cateList = categoryList
							.getChildren("category");
					Map<String, String> map = new HashMap<String, String>();
					for (Element cateObject : cateList) {
						String cateName = cateObject.getChildTextTrim("name");
						String cateUrl = cateObject.getChildTextTrim("url");
						map.put(cateName, cateUrl);
					}
					menu.setCategoryMap(map);
					menu.setUrl("hasChildren");
				}
				menuList.add(menu);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return menuList;
	}

	@SuppressWarnings("unchecked")
	private static List<TsMenu> bulidChildren(Element element) {
		List<Element> list = element.getChildren("menu"); // 得到menu节点集
		List<TsMenu> menuList = new ArrayList<TsMenu>();
		for (Element menuObject : list) {
			TsMenu menu = new TsMenu();
			String name = menuObject.getChildTextTrim("name");
			String tip = menuObject.getChildTextTrim("tip");
			String url = menuObject.getChildTextTrim("url");
			String descr = menuObject.getChildTextTrim("descr");
			String needRight = menuObject.getChild("allow-groups")
					.getAttributeValue("enable");
			String allowGroups = menuObject.getChildTextTrim("allow-groups");
			menu.setName(name);
			menu.setTip(tip);
			menu.setUrl(url);
			menu.setDescr(descr);
			if ("true".equals(needRight))
				menu.setAllowGroups(allowGroups);
			else
				menu.setAllowGroups("all");
			menu.setChildren(bulidChildren(menuObject));
			Element categoryList = menuObject.getChild("category-list");
			if (null != categoryList) {
				List<Element> cateList = categoryList.getChildren("category");
				Map<String, String> map = new TreeMap<String, String>();
				for (Element cateObject : cateList) {
					String cateName = cateObject.getChildTextTrim("name");
					String cateUrl = cateObject.getChildTextTrim("url");
					map.put(cateName, cateUrl);
				}
				menu.setCategoryMap(map);
				menu.setUrl("hasChildren");
			}
			menuList.add(menu);
		}
		return menuList;
	}

	public static void main(String[] args) {
		long start = new Date().getTime();
		for (int i = 0; i < 1000 * 100; i++) {
			getMenuList();
		}
		System.out.println(new Date().getTime() - start);
	}
}
