package com.sist.mail;

import java.util.*;

import javax.mail.*;
import javax.mail.internet.InternetAddress;

import org.springframework.stereotype.Component;

import javax.mail.internet.*;

import com.sist.vo.*;
@Component
public class MailManager {
	private String style="<style>" +
    		"body {" +
    		"	  padding:1.5em;" +
    		"	  background: #f5f5f5" +
    		"	}" +
    		"	table {" +
    		"	  border: 1px #a39485 solid;" +
    		"	  font-size: .9em;" +
    		"	  box-shadow: 0 2px 5px rgba(0,0,0,.25);" +
    		"	  width: 100%;" +
    		"	  border-collapse: collapse;" +
    		"	  border-radius: 5px;" +
    		"	  overflow: hidden;" +
    		"	}" +
    		"	th {" +
    		"	  text-align: left;" +
    		"	}" +
    		"	thead {" +
    		"	  font-weight: bold;" +
    		"	  color: #fff;" +
    		"	  background: #73685d;" +
    		"	}" +
    		"	 td, th {" +
    		"	  padding: 1em .5em;" +
    		"	  vertical-align: middle;" +
    		"	}" +
    		"	 td {" +
    		"	  border-bottom: 1px solid rgba(0,0,0,.1);" +
    		"	  background: #fff;" +
    		"	}" +
    		"	a {" +
    		"	  color: #73685d;" +
    		"	}" +
    		"	 @media all and (max-width: 768px) {" +
    		"	  table, thead, tbody, th, td, tr {" +
    		"	    display: block;" +
    		"	  }" +
    		"	  th {" +
    		"	    text-align: right;" +
    		"	  }" +
    		"	  table {" +
    		"	    position: relative; " +
    		"	    padding-bottom: 0;" +
    		"	    border: none;" +
    		"	    box-shadow: 0 0 10px rgba(0,0,0,.2);" +
    		"	  }" +
    		"	  thead {" +
    		"	    float: left;" +
    		"	    white-space: nowrap;" +
    		"	  }" +
    		"	  tbody {" +
    		"	    overflow-x: auto;" +
    		"	    overflow-y: hidden;" +
    		"	    position: relative;" +
    		"	    white-space: nowrap;" +
    		"	  }" +
    		"	  tr {" +
    		"	    display: inline-block;" +
    		"	    vertical-align: top;" +
    		"	  }" +
    		"	  th {" +
    		"	    border-bottom: 1px solid #a39485;" +
    		"	  }" +
    		"	  td {" +
    		"	    border-bottom: 1px solid #e5e5e5;" +
    		"	  }" +
    		"	  }" +
    		"</style>";
	public static void main(String[] args) {
		MailManager m=new MailManager();
		MemberVO vo=new MemberVO();
		m.naverMailSend(vo, 1);
	}
	public  void naverMailSend(Object obj,int type) {
		MemberVO vo=null;
		if(type==1)
		   vo=(MemberVO)obj;
		 String host = "smtp.naver.com"; // 네이버일 경우 네이버 계정, gmail경우 gmail 계정
	     String user = "mins2713@naver.com"; // 이메일주소
	     String password = "whalstjr1!"; //비밀번호      
	     Properties props = new Properties();
	     props.put("mail.smtp.host", host);
	     props.put("mail.smtp.port", 587);
	     props.put("mail.smtp.auth", "true");
	     // 네이버 메일 smtp // SMTP 서버 정보를 설정한다.
	     Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator(){
	    	 protected PasswordAuthentication getPasswordAuthentication()
	    	 {
	    		 return new PasswordAuthentication(user, password);
	    	 }
	     }); // pwd 인증
	     try {
	        	MimeMessage message = new MimeMessage(session);
	              message.setFrom(new InternetAddress(user));
	              message.addRecipient(Message.RecipientType.TO, new InternetAddress("mins2713@naver.com")); // 메일 제목
	              message.setSubject("제목입니다"); // 메일 제목
	              
	              String html="<html>"
	              			  + "<head>"
	              			  + style
	              			  +"</head>"
	              			  +"<table>"
	              			  + "<thead>"
	              			  + "<tr>"
	              			  + "<th width=15%>회원번호</th>"
	              			  + "<td width=85%>1</td>"
	              			  + "</tr>"
	              			 + "<tr>"
	              			  + "<th>이름</th>"
	              			  + "<td>홍길동</td>"
	              			  + "</tr>"
	              			 + "<tr>"
	              			  + "<th>성별</th>"
	              			  + "<td>남자</td>"
	              			  + "</tr>"
	              			 + "<tr>"
	              			  + "<th>생년월일</th>"
	              			  + "<td>1998-10-12</td>"
	              			  + "</tr>"
	              			 + "<tr>"
	              			  + "<th>ID</th>"
	              			  + "<td>mins2713</td>"
	              			  + "</tr>"
	              			  + "<body>"
	              			  + "</body>"
	              			  + "</html>"; // 메일내용
	              		    
	              message.setContent(html,"text/html;charset=UTF-8"); // send the message
	              Transport.send(message);
	              System.out.println("Success Message Send");
	         } catch (MessagingException e)
	          {
	        	 e.printStackTrace();
	          }
}
}
