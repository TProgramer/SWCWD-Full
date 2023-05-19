package com.ssafy.fit.model.dao;

import java.util.List;

import com.ssafy.fit.model.dto.Review;

public interface ReviewDao {
	// 해당 videoid 값에 해당하는 리뷰 보여줘
	public List<Review> selectReview(String videoid);
	
	// 리뷰 등록
	public int insertReview(Review review);
	
	// 리뷰 수정
	public void updateReview(Review review);

	// 리뷰 상세
	public Review selectOne(int id);
		
	// 리뷰 삭제
	public void deleteReview(int id);
	
	// 조회수 증가
	public void updateViewCnt(int id);
}
