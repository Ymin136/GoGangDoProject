package com.gogangdo.service;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.put;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Controller
public class TestService {
	@RequestMapping(value = "/refund/sendSms.do")
	public String certifiedPhoneNumber(String userPhoneNumber, int randomNumber, HttpServletRequest request) {
		String api_key = "NCSFGLFFSYXC1AFC";
		String api_secret = "GKMMHULMCG8LVNTQNEMSTYGYWHCLJIXU";
		Message coolsms = new Message(api_key, api_secret);
		 HashMap<String, String> set = new HashMap<String, String>();
		  set.put("to", "보내는분 번호 입력"); // 수신번호
		  set.put("from", (String)request.getParameter("from")); // 발신번호
		  set.put("text", (String)request.getParameter("text")); // 문자내용
		  set.put("type", "sms"); // 문자 타입
		  set.put("app_version", "test app 1.2"); 

		  System.out.println(set);
		  try {
		  org.json.simple.JSONObject result = coolsms.send(set); // 보내기&전송결과받기

		  System.out.println(result.toString());
	    } catch (CoolsmsException e) {
	      System.out.println(e.getMessage());
	      System.out.println(e.getCode());
	    }

		  return "admin/aminpage";
		
	    
	}

}
