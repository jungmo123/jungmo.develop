package jungmo.shoppingmall.user.join.service;

import java.util.*;

import javax.mail.internet.*;
import javax.mail.internet.MimeMessage.RecipientType;

import jungmo.shoppingmall.user.join.dao.*;
import jungmo.shoppingmall.user.join.domain.*;
import jungmo.shoppingmall.user.login.domain.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.mail.javamail.*;
import org.springframework.stereotype.*;

@Service
public class JoinServiceImpl implements JoinService{
	@Autowired private JoinDao joinDao;
	@Autowired private JavaMailSender mailSender;
	
	public void addUser(User user){
		joinDao.addUser(user);
	}
	
	public void addClsc(ClauseCategory clsc){
		joinDao.addClsc(clsc);
	}
	
	public List<Clause> getClauses(){
		return joinDao.getClauses();
	}
	
	public boolean overlapInjection(String userId){
		Overlap ov = joinDao.overlapInjection(userId);
		if(ov != null){
			return true;
		}else{
			return false;
		}
	}
	
	public void addJoinPoint(String userId){
		joinDao.addJoinPoint(userId);
	}
	
	@Override
	public void mailSend(String userEmail,String mailTitle,String mailContent){
		MimeMessage message = mailSender.createMimeMessage();
		String txt = mailContent;
		try{
			message.addRecipient(RecipientType.TO, new InternetAddress(userEmail));
			message.setSubject(mailTitle);
			message.setText(txt,"utf-8","html");
		}catch(Exception e){}
		mailSender.send(message);
	}
}
