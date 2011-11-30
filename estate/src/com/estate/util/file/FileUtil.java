package com.estate.util.file;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;

/**
 * 文件操作类
 */
public class FileUtil {

	public FileUtil() {
	}

	/**
	 * 检查文件
	 * 
	 * @param file
	 *            需要检查的文件
	 * @param maxsize
	 *            检查文件大小条件 0为不限制 byte (1*1024byte=1kb)
	 * @param filePostfix
	 *            文件的后缀名 可以传文件名 点号前将被忽略
	 * @param comparePostfix
	 *            字符串数组 数组为空为不限制格式 后缀名条件，不区分大小写，点号.将被忽略.
	 * @return 1 通过验证, 2没有数据, 3文件超过大小限制, 4格式不正确
	 */
	public static int checkFile(File file, int maxsize, String filePostfix,
			String[] comparePostfix) {

		if (file == null || file.length() == 0) {
			return 2;// 没有数据
		} else if (maxsize != 0 && file.length() > maxsize) {
			return 3;// 超过限制大小
		}

		if (comparePostfix != null && comparePostfix.length != 0) {
			try {
				// 清楚后缀名的“.”前字符
				if (filePostfix.indexOf(".") >= 0) {
					filePostfix = filePostfix.substring(filePostfix
							.lastIndexOf(".") + 1);
				}
				for (String str : comparePostfix) {

					if (str == null || str.length() == 0)
						continue;// 空串不验证，执行下次循环

					// 清楚后缀名的“.”
					str = str.replace(".", "");

					if (str.length() > 0) {
						if (filePostfix.toLowerCase().equals(str.toLowerCase())) {
							return 1;// 通过验证
						}
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
				return 4;// 格式不正确
			}
			return 4;// 格式不正确
		} else {
			return 1;// 通过验证
		}

	}

	/**
	 * 文件上传
	 * 
	 * @param path
	 *            存储路径
	 * @param file
	 *            文件
	 * @return true成功，false失败
	 */
	public static boolean doUpFile(String path, File file) {
		boolean res = false;
		FileOutputStream fos = null;
		FileInputStream fis = null;
		try {
			// 创建新文件
			fos = new FileOutputStream(new File(path));
			// 解析写入文件
			fis = new FileInputStream(file);
			// 向新文件中写入文件流
			byte[] buffer = new byte[(int) file.length()];
			while (fis.read(buffer) > 0) {
				fos.write(buffer);
			}
			fos.flush();
			res = true;
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (fis != null) {
					fis.close();
				}
				if (fos != null) {
					// 关闭保存文件
					fos.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return res;
	}

	/**
	 * 删除单个文件
	 * 
	 * @param fileName
	 *            被删除文件的文件名
	 * @return 单个文件删除成功返回true,否则返回false
	 */
	public static boolean deleteFile(String fileName) {
		boolean res = false;
		File file = new File(fileName);
		if (file != null) {
			if (file.isFile() && file.exists()) {
				file.delete();
				res = true;
			}
		}
		return res;
	}
	
	/**
	 * 文件里写数据
	 * @param loggerPath 文件路径
	 * @param string  写入的内容
	 */
	public static void logFile(String loggerPath, String string) {
		FileWriter fw = null;
		BufferedWriter bw =null;
		try {
			fw = new FileWriter(loggerPath,true);
			bw = new BufferedWriter(fw);
			bw.write(string);
			bw.newLine();
			bw.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
		try {
			fw.close();
			fw = null;
		} catch (IOException e) {
		}
		try {
			bw.close();
			bw = null;
		} catch (IOException e) {
		}
	}
	 /**
     * 创建目录
     * @param mkdirName
     */
	public static void mkdir(String mkdirName) {
		try {
			File dirFile = new File(mkdirName);
			boolean bFile = dirFile.exists();
			if (bFile == true) {
			} else {
				bFile = dirFile.mkdirs();
			}
		} catch (Exception err) {
			err.printStackTrace();
		}
	}
}
