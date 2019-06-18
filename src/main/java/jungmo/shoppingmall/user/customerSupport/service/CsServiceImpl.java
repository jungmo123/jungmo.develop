package jungmo.shoppingmall.user.customerSupport.service;

import java.util.*;

import javax.mail.internet.*;
import javax.mail.internet.MimeMessage.*;

import jungmo.shoppingmall.user.customerSupport.dao.*;
import jungmo.shoppingmall.user.customerSupport.domain.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.mail.javamail.*;
import org.springframework.stereotype.*;

@Service
public class CsServiceImpl implements CsService{
	@Autowired private CsDao csDao;
	@Autowired private JavaMailSender mailSender;
	
	public Customer getPwd(Customer cs){
		return csDao.getPwd(cs);
	}
	
	public List<Customer> getId(Customer cs){
		return csDao.getId(cs);
	}
	
	public int updatePwd(Customer cs){
		return csDao.updatePwd(cs);
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
