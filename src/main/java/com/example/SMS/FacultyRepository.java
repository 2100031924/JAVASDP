package com.example.SMS;

import org.springframework.data.repository.CrudRepository;

public interface FacultyRepository extends CrudRepository<Faculty, Long> {
    // Define custom query methods if needed
}
