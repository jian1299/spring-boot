package com.niit.web.spring.Controller;

import javax.servlet.http.HttpSession;

import com.niit.web.spring.WebSecurityConfig;
import com.niit.web.spring.dao.UserDao;
import com.niit.web.spring.domain.User;
import groovy.lang.GrabExclude;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class MainController {
	@Autowired
	private UserDao userDao;

//如果没有登陆，不能进入用户界面
	@GetMapping("/")
	public String index(@SessionAttribute(WebSecurityConfig.SESSION_KEY) String account, Model model,HttpSession session) {
		String status = (String) session.getAttribute(WebSecurityConfig.SESSION_KEY);
//		System.out.println(status);
		if(status != account){
			return "login";
		}
		List<User> list = userDao.findAll();
		model.addAttribute("name", account);
		if(list != null && list.size() != 0){
			model.addAttribute("person",list);
		}
		return "index";
	}
//如果没有注销进入登陆页面，将直接跳转用户页面
	@GetMapping("/login")
	public String login(HttpSession session) {
			return "login";
	}
//	增加人员
	@GetMapping("/add")
	public String add() {
		return "add";
	}
//	登陆验证
	@PostMapping("/loginPost")
	public @ResponseBody Map<String, Object> loginPost(String account, String password, HttpSession session) {
		User user = userDao.findByName(account);
		Map<String, Object> map = new HashMap<>();
		if(user==null){
			map.put("success", false);
			map.put("message", "账号不存在");
			return map;
		}
		if (!(user.getPassword().toString().equals(password))) {
			map.put("success", false);
			map.put("message", "密码错误");
			return map;
		}
		// 设置session
		session.setAttribute(WebSecurityConfig.SESSION_KEY, account);
		map.put("success", true);
		map.put("message", "登录成功");
		return map;
	}

	//退出登陆
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		// 移除session
		session.removeAttribute(WebSecurityConfig.SESSION_KEY);
		return "redirect:/login";
	}
//	增加人员信息
	@PostMapping("/addPerson")
	public @ResponseBody Map<String ,Object> addPerson(User user){
		Map<String ,Object> map = new HashMap<>();
		User user1 = userDao.findByName(user.getUsername());
		user.setStatus(1);
		System.out.println(user);
		if(user1 != null){
			map.put("success",false);
			map.put("message","此用户已经存在,请重新填写");
			return map;
		}else if(user.getUsername() == ""){
			map.put("success",false);
			map.put("message","请填写用户名");
			return map;
		}else if(user.getPassword() == ""){
			map.put("success",false);
			map.put("message","请填写密码");
			return map;
		}else if(user.getEmail() == "") {
			map.put("success", false);
			map.put("message", "请填写邮箱");
			return map;
		}else if(user.getSex() == ""){
				map.put("success",false);
				map.put("message","请填写邮箱");
				return map;
		}else if(user.getMobile() == ""){
			map.put("success",false);
			map.put("message","请填写电话");
			return map;
		}else if(userDao.insert(user) == 0){
			map.put("success",false);
			map.put("message","数据库错误");
			return map;
		}
		map.put("success",true);
		return map;
	}

	@PostMapping("/updatePerson/{id}")
	@ResponseBody
	public User updatePerson(@PathVariable("id")Long id, Model model){
		return userDao.findById(id);
	}

	@PostMapping("/update")
	@ResponseBody
	public void update(User user){
		userDao.update(user);
	}

	@PostMapping("/delete/{id}")
	@ResponseBody
	public void delete(@PathVariable("id")Long id){
		userDao.delete(id);
	}

	@GetMapping("/show")
	public String show(Model model){
		List<User> list = userDao.findAll();
		if(list != null && list.size() != 0){
			model.addAttribute("person",list);
		}
		return "show";
	}
}
