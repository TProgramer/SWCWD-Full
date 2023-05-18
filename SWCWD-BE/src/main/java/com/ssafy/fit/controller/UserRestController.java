package com.ssafy.fit.controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.fit.model.dto.User;
import com.ssafy.fit.model.service.UserService;
import com.ssafy.fit.util.JwtUtil;

import io.swagger.annotations.Api;

@RestController
@Api(tags ="유저 컨트롤러")
@RequestMapping("/api-user")
public class UserRestController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private JwtUtil jwtUtil;
	
	@GetMapping("users")
	public List<User> userList() {
		return userService.getUserList();
	}
	
	//로그인 (실제 수행)
	@PostMapping("login")
	public ResponseEntity<?> login(@RequestBody User user, HttpSession session) {
		User tmp = userService.login(user.getId(), user.getPassword());
		Map<String,Object> result = new HashMap<String, Object>();
		HttpStatus status = null;
		try {
			if(tmp != null) {
				result.put("accessToken",jwtUtil.createToken("id",user.getId()));
				result.put("message","success");
				result.put("loginUser",tmp.getNickname());
				status = HttpStatus.ACCEPTED;
			}
			else {
				result.put("message","fail");
				status = HttpStatus.NO_CONTENT;
			}
		} catch (UnsupportedEncodingException e) {
			result.put("message","fail");
			status = HttpStatus.INTERNAL_SERVER_ERROR;
		}
		return new ResponseEntity<Map<String,Object>>(result,status);
	}
	
	
	//유저등록 (진짜 등록해)
	@PostMapping("signup")
	public ResponseEntity<?> signup(@RequestBody User user) {
		int result = userService.signup(user);
		return new ResponseEntity<Integer>(result, HttpStatus.CREATED);
		
	}
	
	@GetMapping("logout")
	public ResponseEntity<Void> logout(HttpSession session){
		session.invalidate();
		return new ResponseEntity<Void>(HttpStatus.OK);
	}
}
