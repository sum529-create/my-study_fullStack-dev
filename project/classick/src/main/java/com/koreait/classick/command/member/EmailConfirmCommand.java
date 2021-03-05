package com.koreait.classick.command.member;

import java.util.HashMap;
import java.util.Map;

import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.ui.Model;

import com.koreait.classick.dao.MemberDao;

public class EmailConfirmCommand implements EmailCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map1 = new HashMap<String, Object>();
		
		try {
			Map<String, Object> map = model.asMap();
			HttpServletRequest request = (HttpServletRequest) map.get("request");
			JavaMailSender mailSender = (JavaMailSender)map.get("mailSender");
			
			String mPhone = request.getParameter("mPhone");
			MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
			
			MimeMessage message = mailSender.createMimeMessage();
			message.setHeader("Content-Type", "text/plain; charset=utf-8");
			message.setFrom(new InternetAddress("forspringlec@gmail.com", "Classick"));  
			InternetAddress to = new InternetAddress(memberDao.selectEmail(mPhone));  
			InternetAddress[] toList = {to};  
			message.setRecipients(Message.RecipientType.TO, toList);  
			message.setSubject("안녕하세요  Classick입니다 인증 요청 메일입니다."); 
			long authKey = (long)(Math.random() * 10000000000L) + 1234567890;  
			message.setText("안녕하세요 회원님 \n" + "항상 저희 Classick을 이용해 주셔서 감사합니다.\n" + " 요청하신 인증코드 아래와 같이 알려드립니다. \n" + "\n" + "인증코드 : " + authKey);  
			mailSender.send(message);  
			
			map1.put("authkey", authKey);
			map1.put("usermail", memberDao.selectEmail(mPhone));
		} catch(Exception e) {
			e.printStackTrace();
		}
		return map1;
	}

}
