package com.seanhildreth.bathroomrater.controllers;

import com.seanhildreth.bathroomrater.models.Rating;
import com.seanhildreth.bathroomrater.models.User;
import com.seanhildreth.bathroomrater.services.RatingService;
import com.seanhildreth.bathroomrater.services.UserService;
import com.seanhildreth.bathroomrater.validator.UserValidator;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;

@Controller
public class MapController {
    private final UserService userService;
    private final UserValidator userValidator;
    private final RatingService ratingService;

    public MapController(UserService userService, UserValidator userValidator, RatingService ratingService) {
        this.userService = userService;
        this.userValidator = userValidator;
        this.ratingService = ratingService;
    }

    @RequestMapping("/dashboard")
    public String dashboard(HttpSession session) {
        if(session.getAttribute("user") == null) { return "redirect:/"; }
        return "index.jsp";
    }

    @RequestMapping("/newRating")
    public String newRatingGet(HttpSession session) {
        if(session.getAttribute("user") == null) { return "redirect:/"; }
        return "redirect:/dashboard";
    }

    @RequestMapping(value = "/newRating", method = RequestMethod.POST)
    public String newRating(@ModelAttribute("newRating")Rating newRating, @RequestParam("hiddenId")String hiddenId, @RequestParam("hiddenName")String hiddenName, @RequestParam("hiddenAddress")String hiddenAddress, HttpSession session) {
        if(session.getAttribute("user") == null) { return "redirect:/"; }
        session.setAttribute("hiddenId", hiddenId);
        session.setAttribute("hiddenName", hiddenName);
        session.setAttribute("hiddenAddress", hiddenAddress);
        return "newRating.jsp";
    }

    @RequestMapping("/createRating")
    public String createRatingGet(HttpSession session) {
        if(session.getAttribute("user") == null) { return "redirect:/"; }
        return "redirect:/dashboard";
    }

    @RequestMapping(value = "/createRating", method = RequestMethod.POST)
    public String createRating(@Valid @ModelAttribute("newRating") Rating newRating, BindingResult result, HttpSession session) {
        if(session.getAttribute("user") == null) { return "redirect:/"; }
        if(result.hasErrors()) { return "newRating.jsp"; }
        else {
            User user = (User) session.getAttribute("user");
            ratingService.createRating(newRating, user);
            return "redirect:/dashboard";
        }
    }

    @RequestMapping("/allReviews")
    public String allReviewsGet(HttpSession session) {
        if(session.getAttribute("user") == null) { return "redirect:/"; }
        return "redirect:/dashboard";
    }

    @RequestMapping(value = "/allReviews", method = RequestMethod.POST)
    public String allReviews(@RequestParam("hiddenId")String hiddenId, @RequestParam("hiddenName")String hiddenName, @RequestParam("hiddenAddress")String hiddenAddress, HttpSession session) {
        if(session.getAttribute("user") == null) { return "redirect:/"; }
        List<Rating> allReviews = ratingService.findAllByPlaceRev(hiddenId);
        session.setAttribute("allReviews", allReviews);
        Integer count = ratingService.ratingCount(hiddenId);
        session.setAttribute("ratingCount", count);
        Integer sum = ratingService.sumRatings(hiddenId);
        if (sum != null) {
            Integer avg = Math.round(sum / count);
            session.setAttribute("avgRating", avg);
        } else {
            Integer avg = 0;
            session.setAttribute("avgRating1", avg);
        }
        session.setAttribute("hiddenId", hiddenId);
        session.setAttribute("hiddenName", hiddenName);
        session.setAttribute("hiddenAddress", hiddenAddress);
        return "allReviews.jsp";
    }

    @RequestMapping(value = "/getReviews", method = RequestMethod.POST)
    public void getReviews(@RequestParam("hiddenId")String hiddenId, @RequestParam("hiddenName")String hiddenName, @RequestParam("hiddenAddress")String hiddenAddress, HttpSession session) {
        List<Rating> allReviews = ratingService.findAllByPlaceRev(hiddenId);
        session.setAttribute("allReviews1", allReviews);
        Integer count = ratingService.ratingCount(hiddenId);
        session.setAttribute("ratingCount1", count);
        Integer sum = ratingService.sumRatings(hiddenId);
        if (sum != null) {
            Integer avg = Math.round(sum / count);
            session.setAttribute("avgRating1", avg);
        } else {
            Integer avg = 0;
            session.setAttribute("avgRating1", avg);
        }
        session.setAttribute("hiddenId", hiddenId);
        session.setAttribute("hiddenName", hiddenName);
        session.setAttribute("hiddenAddress", hiddenAddress);
    }


}
