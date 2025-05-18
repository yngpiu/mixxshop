package com.example.springWEB.service;

import java.util.List;

import com.example.springWEB.domain.cart.FeedBack;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.example.springWEB.repository.FeedbackRepository;

@Service
public class FeedbackService {
    private FeedbackRepository feedbackRepository;

    public FeedbackService(FeedbackRepository feedbackRepository) {
        this.feedbackRepository = feedbackRepository;
    }

    public FeedBack savFeedBack(FeedBack feedBack) {
        return this.feedbackRepository.save(feedBack);
    }

    public List<FeedBack> findAllFeedback() {
        return this.feedbackRepository.findAll();
    }

    public Page<FeedBack> paginationFeed(Pageable pageable) {
        return this.feedbackRepository.findAll(pageable);
    }
}
