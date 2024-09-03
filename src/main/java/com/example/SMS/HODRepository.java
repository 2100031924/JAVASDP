package com.example.SMS;

import org.springframework.data.jpa.repository.JpaRepository;

public interface HODRepository extends JpaRepository<HOD, Long> {
    // Define custom queries if needed
}
