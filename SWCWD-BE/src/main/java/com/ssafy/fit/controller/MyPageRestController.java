package com.ssafy.fit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.fit.model.dto.CalendarLog;
import com.ssafy.fit.model.service.CalendarLogService;

import io.swagger.annotations.Api;

@RestController
@Api(tags = "마이페이지 컨트롤러")
@RequestMapping("/api-mypage")
public class MyPageRestController {

  @Autowired
  private CalendarLogService calendarLogService;
  
  @GetMapping("/")
  public List<CalendarLog> logList(String loginId) {
    return calendarLogService.selectAll(loginId);
  }
  //달력 로그 생성
  @PostMapping("/")
  public ResponseEntity<CalendarLog> write(@RequestBody CalendarLog log){
    calendarLogService.insertLog(log);
    return new ResponseEntity<CalendarLog>(HttpStatus.CREATED); 
  }
  
  @DeleteMapping("/")
  public ResponseEntity<CalendarLog> erase(@RequestBody CalendarLog log){
    calendarLogService.deleteLog(log);
    return new ResponseEntity<CalendarLog>(HttpStatus.OK); 
  }
}
