package com.ssafy.fit.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.fit.model.dao.CalendarLogDao;
import com.ssafy.fit.model.dto.CalendarLog;

@Service
public class CalendarLogServiceImpl implements CalendarLogService {
	
	@Autowired
	private CalendarLogDao calendarLogDao;
	
	//달력 로그 모두 가져오기
	@Override
	public List<CalendarLog> selectAll(String id) {
		return calendarLogDao.selectAll(id);
	}

	//달력 로그 등록
	@Override
	public int insertLog(CalendarLog log) {
		int result = calendarLogDao.insertLog(log);
		return result;
	}
}
