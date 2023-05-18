package com.ssafy.fit.model.service;

import java.util.List;

import com.ssafy.fit.model.dto.Review;

public interface ReviewService {
	// 해당 videoid 값에 해당하는 리뷰 보여줘
	public List<Review> getReviewByVideoId(String videoid);
	
	// 리뷰 등록
	public int insertReview(Review review);
	
	// 리뷰 수정
	public void updateReview(Review review);

	// 리뷰 상세
	public Review getReviewById(int id);
		
	// 리뷰 삭제
	public void deleteReview(int id);
	

}
