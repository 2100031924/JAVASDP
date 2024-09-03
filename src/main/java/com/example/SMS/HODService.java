package com.example.SMS;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class HODService {

    private final HODRepository hodRepository;

    @Autowired
    public HODService(HODRepository hodRepository) {
        this.hodRepository = hodRepository;
    }

    // Create a new HOD
    public HOD createHOD(HOD hod) {
        return hodRepository.save(hod);
    }

    // Retrieve all HODs
    public List<HOD> getAllHODs() {
        return hodRepository.findAll();
    }

    // Retrieve a specific HOD by ID
    public HOD getHODById(Long id) {
        return hodRepository.findById(id).orElse(null);
    }

    // Update an existing HOD
    public HOD updateHOD(HOD hod) {
        return hodRepository.save(hod);
    }

    // Delete a HOD by ID
    public void deleteHODById(Long id) {
        hodRepository.deleteById(id);
    }
    
    public int getNumberOfHODs() {
        // Query the database to get the count of students
        return (int) hodRepository.count();
    }

}


