package com.ssafy.fit.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.fit.model.dao.ReviewDao;
import com.ssafy.fit.model.dto.Review;

@Service
public class ReviewServiceImpl implements ReviewService {
	
	@Autowired
	private ReviewDao reviewDao;
	
	//리뷰 videoId에 맞는 거 리뷰 다 보여주기
	@Override
	public List<Review> getReviewByVideoId(String videoid) {
		return reviewDao.selectReview(videoid);
	}

	//리뷰 등록
	@Override
	public int insertReview(Review review) {
		int result = reviewDao.insertReview(review);
		return result;
	}

	//리뷰 수정
	@Override
	public void updateReview(Review review) {
		reviewDao.updateReview(review);
	}

	//리뷰 상세
	@Override
	public Review getReviewById(int id) {
		//조회수 증가
		reviewDao.updateViewCnt(id);
		return reviewDao.selectOne(id);
	}

	//리뷰 삭제
	@Override
	public void deleteReview(int id) {
		reviewDao.deleteReview(id);
	}

}
