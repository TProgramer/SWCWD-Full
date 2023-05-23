package com.ssafy.fit.model.service;

import java.util.List;

import com.ssafy.fit.model.dto.Video;


public interface VideoService {
	//모든 영상 가져오기
	public List<Video> getVideoList();

	// ID에 해당하는 영상 하나 가져오기
	public Video getVideoById(String id);
	
	//카테고리에 맞는 영상들 가져오기
	public List<Video> getVideoByCategory(String category);

	//조회수 높은 순으로 영상 가져오기
	public List<Video> getVideoByViewCnt();

	//무한 스크롤을 위한 영상 가져오기
	public List<Video> getVideoByPage(String videoId);
	
}
