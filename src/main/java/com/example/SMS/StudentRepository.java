package com.example.SMS;

import org.springframework.data.repository.CrudRepository;

public interface StudentRepository extends CrudRepository<Student, Long> {
    // Define custom query methods if needed
	
	Student findByFirstName(String firstName);

}

