package com.sp.practice.user;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class UserController {

	@Autowired
	private UserService us;
	
//	@RequestMapping("/user/list")
//	public String getUserList(Model m) {
//		m.addAttribute("strList",us.getUserList());
//		System.out.println(m);
//		return "user/list"; //물리적주소(실존하는파일)
//		
//	}
	
	@RequestMapping(value = "/user/list/ajax", method=RequestMethod.GET) //ajax로 갔다오는거 , method 안쓰면 다 임 
	public @ResponseBody List<Map<String, String>> getUserList(@ModelAttribute UserVO param) {		
		log.debug("param1: {}", param);
		return us.getUserList();
	}
	@RequestMapping(value = "/user/list/ajax/view", method=RequestMethod.GET)
	public @ResponseBody UserVO getUser(@ModelAttribute UserVO user) {		
		log.debug("param2: {}", user);
		return us.getUser(user);
	}
	
	@RequestMapping(value = "/user/list/ajax", method=RequestMethod.POST) 
	public @ResponseBody Map<String,String> insertUser(@RequestBody UserVO user) {		
		log.debug("param: {}", user);
		return us.insertUserInfo(user);
	}
	@RequestMapping(value = "/user/list/ajax", method=RequestMethod.PUT) 
	public @ResponseBody  Map<String,String> updateUser(@RequestBody UserVO user) {		
		log.debug("param: {}", user);
		return us.updateUserInfo(user);
	}
	@RequestMapping(value = "/user/list/ajax", method=RequestMethod.DELETE) 
	public @ResponseBody  Map<String,String> deleteUser(@ModelAttribute UserVO user) {		
		log.debug("param: {}", user);
		return us.deleteUserInfos(user);
	}
	
	
}

