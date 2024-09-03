package com.example.SMS;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CourseService {
	 @Autowired
	    private CourseRepository courseRepository;

	    public List<Course> getAllCourses() {
	        // Return a list of all courses from the repository
	        return (List<Course>) courseRepository.findAll();
	    }

	    
	    
	    public Course addCourse(Course course) {
	        return courseRepository.save(course);
	    }
}
