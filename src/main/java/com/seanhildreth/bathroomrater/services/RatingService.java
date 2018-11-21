package com.seanhildreth.bathroomrater.services;

import com.seanhildreth.bathroomrater.models.Rating;
import com.seanhildreth.bathroomrater.models.User;
import com.seanhildreth.bathroomrater.repositories.RatingRepo;
import com.seanhildreth.bathroomrater.repositories.UserRepo;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RatingService {
    private final RatingRepo ratingRepo;
    private final UserRepo userRepo;

    public RatingService(RatingRepo ratingRepo, UserRepo userRepo) {
        this.ratingRepo = ratingRepo;
        this.userRepo = userRepo;
    }

    public List<Rating> findAllByPlace(String place) { return ratingRepo.findAllByPlace(place); }

    public Rating createRating(Rating rating, User user) {
        rating.setUser(user);
        return ratingRepo.save(rating);
    }

    public Integer ratingCount(String place) { return ratingRepo.ratingCount(place); }

    public Integer sumRatings(String place) { return ratingRepo.sumRatings(place); }
}
