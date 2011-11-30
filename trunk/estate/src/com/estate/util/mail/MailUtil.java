package com.estate.util.mail;

import java.util.Date;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailUtil {

	public static boolean sendMail(MailInfo mailinfo) {
		// 发送email
		try {
			String smtpServer = mailinfo.getSmtpServer(); // smtp服务器地址
			String From = mailinfo.getMailFrom(); // 来源的mail
			String Subject = mailinfo.getTitle();
			String Text = mailinfo.getText();

			Properties props = System.getProperties();
			props.put("mail.smtp.host", smtpServer);

			Session sendMailSession = Session.getDefaultInstance(props);
			System.out.println("创建mailsession......");

			Message newMessage = new MimeMessage(sendMailSession);
			System.out.println("创建MimeMessage......");
			newMessage.setFrom(new InternetAddress(From));
			newMessage.setRecipient(Message.RecipientType.TO,
					new InternetAddress(mailinfo.getMailTo()));
			newMessage.setSubject(Subject);
			newMessage.setSentDate(new Date());
			newMessage.setText(Text);
			newMessage.saveChanges();

			System.out.println("正在联接smtp......");
			System.out.println("............");
			System.out.println("............");
			Transport transport = sendMailSession.getTransport("smtp");
			System.out.println("smtp已经联接......");
			transport.connect(mailinfo.getSmtpServer(), mailinfo.getUserName(), mailinfo.getPassword());

			System.out.println("正在发送......");
			transport.sendMessage(newMessage, newMessage.getAllRecipients());
			System.out.println("发送成功......");
			transport.close();
		} catch (Exception mailEx) {
			System.err.println("Send Mail Error:" + mailEx.getMessage());
			return false;
		}
		return true;
	}

	public static void main(String[] args) {
		MailInfo obj = new MailInfo();
		obj.setSmtpServer("smtp.126.com");
		obj.setMailFrom("rosham@126.com");
		obj.setMailTo("zhh0908@126.com");
		obj.setUserName("rosham");
		obj.setPassword("zhenghao1011");
		obj.setTitle("亲爱的 rosham，请重新设置你的【梦房园】帐户密码！");
		obj.setText("                        亲爱的梦房园用户，您好！感谢您一直以来对[梦房园]的支持。\r\n \r\n\r\n");
		obj.setText(obj.getText()+"                        您的用户名是：rosham  \r\n \r\n\r\n");
		obj.setText(obj.getText()+"                        当前的密码是：604407\r\n \r\n\r\n");
		obj.setText(obj.getText()+"                        为了您个人资料的安全，请您尽快修改当前密码。谢谢！\r\n\r\n");
		obj.setText(obj.getText()+"                        登录我房网：http://61.160.220.160:8080/estate/member/login.jsp\r\n\r\n");
		obj.setText(obj.getText()+"                        (如果不能点击该链接地址，请复制并粘贴到浏览器的地址输入框)\r\n\r\n\r\n");
		obj.setText(obj.getText()+"                                         感谢您使用梦房园\r\n");
		obj.setText(obj.getText()+"                        -----------------------------------------------------------------------------------------------------------------------\r\n\r\n");
		obj.setText(obj.getText()+"                        此信由梦房园系统发出，不接收回信，请勿直接回复。\r\n\r\n");
		obj.setText(obj.getText()+"                        如有任何疑问，请拨打110进行咨询，或者访问梦房园http://61.160.220.160:8080/estate与我们取得联系。\r\n\r\n");
		obj.setText(obj.getText()+"                                         梦房园 版权所有");
		sendMail(obj);
	}

}
