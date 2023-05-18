package com.ssafy.fit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.fit.model.dto.Review;
import com.ssafy.fit.model.service.ReviewService;

import io.swagger.annotations.Api;

@RestController
@Api(tags ="리뷰 컨트롤러")
@RequestMapping("/api-review")
public class ReviewRestController {
	
	@Autowired
	private ReviewService reviewService;
	
	//리뷰 READ -> 비디오 아이디에 맞는 거
	@GetMapping("/")
	public ResponseEntity<?> getAllReviews(String videoId) {
		List<Review> list = reviewService.getReviewByVideoId(videoId);
		if(list == null || list.size() == 0)
			return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
		return new ResponseEntity<List<Review>>(list, HttpStatus.OK);

	}
		
	//리뷰 CREATE
	@PostMapping("/")
	public ResponseEntity<Review> write(@RequestBody Review review){
		reviewService.insertReview(review);
		return new ResponseEntity<Review>(HttpStatus.CREATED);
		
	}
		
	//리뷰 UPDATE
	@PutMapping("/")
	public ResponseEntity<Void> update(@RequestBody Review review){
		reviewService.updateReview(review);
		return new ResponseEntity<Void>(HttpStatus.OK);
		
	}
	//리뷰 상세
	@GetMapping("/{id}")
	public ResponseEntity<Review> detail(@PathVariable int id){
		Review review = reviewService.getReviewById(id);
		return new ResponseEntity<Review>(review,HttpStatus.OK);
	}
	//리뷰 DELETE
	@DeleteMapping("/{id}")
	public ResponseEntity<Void> delete(@PathVariable int id){
		reviewService.deleteReview(id);
		return new ResponseEntity<Void>(HttpStatus.OK);
		
	}
	

}
