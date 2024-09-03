package com.example.SMS;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
@Service
public class StudentService {
    @Autowired
    private StudentRepository studentRepository;

    public Student addStudent(Student student) {
        return studentRepository.save(student);
    }

    public List<Student> getAllStudents() {
        return (List<Student>) studentRepository.findAll();
    }
    
    public Student getStudentByFirstName(String firstName) {
        return studentRepository.findByFirstName(firstName);
    }
    
    public int getNumberOfStudents() {
        // Query the database to get the count of students
        return (int) studentRepository.count();
    }

}
