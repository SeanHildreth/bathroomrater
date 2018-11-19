package com.seanhildreth.bathroomrater.services;

import com.seanhildreth.bathroomrater.models.User;
import com.seanhildreth.bathroomrater.repositories.UserRepo;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class UserService {
    private final UserRepo userRepo;

    public UserService(UserRepo userRepo) { this.userRepo = userRepo; }

    public User registerUser(User user) {
        String hashed = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
        user.setPassword(hashed);
        return userRepo.save(user);
    }

    public User findByEmail(String email) { return userRepo.findByEmail(email); }

    public User findUserById(Long id) {
        Optional<User> u = userRepo.findById(id);
        return u.orElse(null);
    }

    public boolean authenticateUser(String email, String password) {
        User user = userRepo.findByEmail(email);
        if(user == null) { return false; }
        else {
            return BCrypt.checkpw(password, user.getPassword());
        }
    }

}
