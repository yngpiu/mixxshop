package com.example.springWEB.repository;

import java.util.List;

import com.example.springWEB.domain.cart.FeedBack;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface FeedbackRepository extends JpaRepository<FeedBack, Long> {
    public FeedBack save(FeedBack feed);

    public List<FeedBack> findAll();

    public Page<FeedBack> findAll(Pageable pageable);

}
