package com.seanhildreth.bathroomrater.repositories;

import com.seanhildreth.bathroomrater.models.Rating;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RatingRepo extends CrudRepository<Rating, Long> {
    @Query(value = "SELECT * FROM ratings WHERE place_id = ?1", nativeQuery = true)
    List<Rating> findAllByPlace(String place);

    @Query(value = "SELECT COUNT(rating) FROM ratings WHERE place_id = ?1", nativeQuery = true)
    Integer ratingCount(String place);

    @Query(value = "SELECT SUM(rating) FROM ratings WHERE place_id = ?1", nativeQuery = true)
    Integer sumRatings(String place);
}
