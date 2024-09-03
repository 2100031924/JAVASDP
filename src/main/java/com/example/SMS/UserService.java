package com.example.SMS;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {


    @Autowired
    private UserRepository userRepository;

    public User getUserByUsername(String username) {
        // Implement the logic to retrieve a user by their username from the UserRepository
        return userRepository.findByUsername(username);
    }

    public void updateUser(User user) {
        userRepository.save(user);
    }
}
