package com.ssafy.fit.model.service;

import java.util.List;

import com.ssafy.fit.model.dto.CalendarLog;

public interface CalendarLogService {
  
  public List<CalendarLog> selectAll(String id);

  public int insertLog(CalendarLog log);
	
  public int deleteLog(CalendarLog log);
}
