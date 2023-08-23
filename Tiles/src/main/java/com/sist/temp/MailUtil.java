package com.sist.temp;

import java.util.*;

import javax.mail.*;
import javax.mail.internet.*;

public class MailUtil {
	
	/** 메일 HOST **/
	private static final String HOST = "smtp.naver.com";
	/** 메일 PORT **/
	private static final String PORT = "587";
	/** 메일 ID **/
	private static final String MAIL_ID = "ksy8_13@naver.com";
	/** 메일 PW **/
	private static final String MAIL_PW = "soyeon1999@";
	
	public static void sendNotiMail(String subejct, String body) {
		try {
			InternetAddress[] receiverList = new InternetAddress[2];
			receiverList[0] = new InternetAddress("ksy8_13@naver.com");
			//receiverList[1] = new InternetAddress("수신인2@tistory.com");
			
			// SMTP 발송 Properties 설정
			Properties props = new Properties();
			props.put("mail.transport.protocol", "smtp");
			props.put("mail.smtp.host", MailUtil.HOST);
			props.put("mail.smtp.port", MailUtil.PORT);
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.smtp.ssl.trust", MailUtil.HOST);
			props.put("mail.smtp.auth", "true");
			
			// SMTP Session 생성
			Session mailSession = Session.getDefaultInstance(props, new javax.mail.Authenticator(){
				protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
					return new javax.mail.PasswordAuthentication(MailUtil.MAIL_ID, MailUtil.MAIL_PW);
				}
			});
			
			// Mail 조립
			Message mimeMessage = new MimeMessage(mailSession);
			mimeMessage.setFrom(new InternetAddress(MailUtil.MAIL_ID));
			mimeMessage.setRecipients(Message.RecipientType.TO, receiverList);
            		// 메일 제목
			mimeMessage.setSubject(subejct);
            		// 메일 본문 (.setText를 사용하면 단순 텍스트 전달 가능)
			mimeMessage.setContent(body, "text/html; charset=UTF-8");
			
			// Mail 발송
			Transport.send(mimeMessage);
			
		} catch(Exception e) {
			//Logger.getLogger(MailUtil.class).error("메일 발송 오류!!");
		}
	}
}