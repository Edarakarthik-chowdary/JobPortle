package com.pack.ecom.OnlineJobPortal.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class EmailServices {
	@Autowired
	private JavaMailSender mailSender;

	public void sendEmail(String to,String subject,String message){

	SimpleMailMessage mail=new SimpleMailMessage();

	mail.setTo(to);
	mail.setSubject(subject);
	mail.setText(message);

	mailSender.send(mail);

	}
}