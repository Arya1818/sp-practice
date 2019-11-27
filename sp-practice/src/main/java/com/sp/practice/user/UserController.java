package com.sp.practice.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class UserController {

	@Autowired
	private UserService us;
	
	@RequestMapping("/user/list")
	public String getUserList(Model m) {
		m.addAttribute("strList",us.getUserList());
		System.out.println(m);
		return "user/list"; //물리적주소(실존하는파일)
		
	}
	
	@RequestMapping("/user/list/ajax") //ajax로 갔다오는거
	public @ResponseBody List<UserVO> getUserList() {		
		
		return us.getUserVOList();
	}
	
}

