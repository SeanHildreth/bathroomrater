package com.seanhildreth.bathroomrater.validator;

import com.seanhildreth.bathroomrater.models.User;
import com.seanhildreth.bathroomrater.services.UserService;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import java.util.regex.Pattern;

@Component
public class UserValidator implements Validator {
    private final UserService userService;

    public UserValidator(UserService userService) { this.userService = userService; }

    @Override
    public boolean supports(Class<?> clazz) { return User.class.equals(clazz); }

    @Override
    public void validate(Object target, Errors errors) {
        User user = (User) target;
        if(!Pattern.matches("^(?=.{2,64}$)[a-zA-Z]+(([\\'\\,\\.\\- ][a-zA-Z ])?[a-zA-Z]*)*$", user.getFirst_name())) {
            errors.rejectValue("first_name", "FirstName");
        }
        if(!Pattern.matches("^(?=.{2,64}$)[a-zA-Z]+(([\\'\\,\\.\\- ][a-zA-Z ])?[a-zA-Z]*)*$", user.getLast_name())) {
            errors.rejectValue("last_name", "LastName");
        }
        if(!Pattern.matches("^(?=.{7,255}$)[a-zA-Z0-9.+_-]+@[a-zA-Z0-9._-]+\\.[a-zA-Z]+$", user.getEmail())) {
            errors.rejectValue("email", "Email");
        }
        if(!Pattern.matches("^(?=.{2,64}$)[a-zA-Z]+(([\\'\\,\\.\\- ][a-zA-Z ])?[a-zA-Z]*)*$", user.getCity())) {
            errors.rejectValue("city", "City");
        }
        if(!Pattern.matches("^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{8,32}$", user.getPassword())) {
            errors.rejectValue("password", "Password");
        }
        if(!user.getPasswordConfirmation().equals(user.getPassword())) {
            errors.rejectValue("passwordConfirmation", "Match");
        }
        if(userService.findByEmail(user.getEmail()) != null) {
            errors.rejectValue("email", "EmailTaken");
        }
    }
}
