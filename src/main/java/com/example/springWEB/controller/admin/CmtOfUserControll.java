package com.example.springWEB.controller.admin;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.springWEB.domain.cart.FeedBack;
import com.example.springWEB.service.FeedbackService;
import com.example.springWEB.service.UserService;

@Controller
public class CmtOfUserControll {

    private UserService userService;
    private FeedbackService feedbackService;

    public CmtOfUserControll(UserService userService, FeedbackService feedbackService) {
        this.userService = userService;
        this.feedbackService = feedbackService;
    }

    @GetMapping("/cmtCus")
    public String Cmt(Model model, @RequestParam(value = "page", defaultValue = "1") int page) {
        // System.out.println(page);
        Pageable pageable = PageRequest.of(page - 1, 7);
        Page<FeedBack> pageFeed = this.feedbackService.paginationFeed(pageable);
        List<FeedBack> feedBacks = pageFeed.getContent();
        model.addAttribute("totalPage", pageFeed.getTotalPages());
        model.addAttribute("currentPage", page);
        model.addAttribute("feeds", feedBacks);
        return "/admin/cmtOfCus/cmt";
    }
}
