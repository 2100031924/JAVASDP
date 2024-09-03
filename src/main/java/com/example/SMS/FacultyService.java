package com.example.SMS;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FacultyService {
	@Autowired
    private FacultyRepository facultyRepository;

    public Faculty addFaculty(Faculty faculty) {
        return facultyRepository.save(faculty);
    }

    public List<Faculty> getAllFaculty() {
        return (List<Faculty>) facultyRepository.findAll();
    }
    
    public int getNumberOfFaculty() {
        // Query the database to get the count of students
        return (int) facultyRepository.count();
    }


    // You can add more methods for faculty management as needed
}
