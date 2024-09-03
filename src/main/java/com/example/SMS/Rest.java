package com.example.SMS;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpSession;

@Controller
public class Rest {
	
	@GetMapping("/home")
	public String home()
	{
		return "home";
	}
	  @Autowired
	    private HODService HODService;
	
	  
	  @Autowired
	    private CourseService CourseService;
	
	@Autowired
    private UserRepository userRepository;

    @GetMapping("/login")
    public String loginForm() {
        return "login"; 
    }

    @PostMapping("/login")
    public String loginSubmit(@RequestParam String username, @RequestParam String password, HttpSession session, Model model) {
        User user = userRepository.findByUsername(username);
        if (user != null && user.getPassword().equals(password)) {
            session.setAttribute("user", user); 
            String role = user.getRole();

            
            if ("STUDENT".equals(role)) {
                return "redirect:/student/dashboard";
            } else if ("HOD".equals(role)) {
                return "redirect:/hod/dashboard";
            } else if ("ADMIN".equals(role)) {
                return "redirect:/admin/dashboard";
            } else if ("FACULTY".equals(role)) {
                return "redirect:/faculty/dashboard";
            }
        }

        model.addAttribute("error", "Invalid username or password");
        return "login";
    }

    @GetMapping("/admin/dashboard")
    public String adminDashboard(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        model.addAttribute("user", user);
        
        // Fetch data for the charts and elements
        int numberOfStudents = studentService.getNumberOfStudents();
        int numberOfFaculty = facultyService.getNumberOfFaculty();
        int numberOfHODs = HODService.getNumberOfHODs();
        int numberOfCourse=CourseService.getAllCourses().size();
        
        // Add chart data to the model
        model.addAttribute("numberOfStudents", numberOfStudents);
        model.addAttribute("numberOfFaculty", numberOfFaculty);
        model.addAttribute("numberOfHODs", numberOfHODs);
        model.addAttribute("numberOfCourse", numberOfCourse);
        
        return "admindash";
    }
    

    @GetMapping("/getChartData")
    @ResponseBody
    public List<ChartData> getChartData() {
        // Fetch data for the charts
        int numberOfStudents = studentService.getAllStudents().size();
        int numberOfFaculty = facultyService.getAllFaculty().size();
        int numberOfHODs = HODService.getAllHODs().size();
        int numberOfCourses = CourseService.getAllCourses().size();

        // Create a list of data objects to send as JSON
        List<ChartData> chartData = new ArrayList<>();
        chartData.add(new ChartData("Students", numberOfStudents));
        chartData.add(new ChartData("Faculties", numberOfFaculty));
        chartData.add(new ChartData("HODs", numberOfHODs));
        chartData.add(new ChartData("Courses",numberOfCourses));
        return chartData;
    }

    
    
   /* @GetMapping("/managestudents")
    public String manageStudents(Model model) {
        // Add logic here to fetch and populate the student data
        // For example, you can fetch the list of students from your database
        // and add them to the "model" object to be displayed in the JSP.
        
        // Example:
        List<Student> students = studentService.getAllStudents(); // Use the instance of StudentService
        model.addAttribute("students", students);

        return "managestudents"; // Return the name of the JSP file (e.g., "managestudent.jsp")
    }*/
    
    @GetMapping("/managefaculty")
    public String manageFaculty(HttpSession session, Model model) {
    	User user = (User) session.getAttribute("user");
	    
	    // Add the user object to the model
	    model.addAttribute("user", user);
        List<Faculty> faculties = facultyService.getAllFaculty();
        model.addAttribute("faculties", faculties);
        return "managefaculty"; // Create a Thymeleaf template named "managefaculty.html"
    }

    
    @Autowired
    private StudentService studentService;

    @GetMapping("/addstd")
    public String addStudentForm(Model model) {
        model.addAttribute("student", new Student());
        return "addstudent"; // Display the add student form
    }

    @PostMapping("/addstudent")
    public String addStudentSubmit(@ModelAttribute Student student) {
        System.out.println("First Name: " + student.getFirstName());
        System.out.println("Last Name: " + student.getLastName());
        User user = new User();
        user.setUsername(student.getFirstName());  // Set username as the first name
        user.setPassword(student.getLastName());
        // Set password as the last name
        user.setRole("STUDENT"); 
       // user.setId(student.getId());// Set the role as "STUDENT"

        // Save the user information to the users table
        userRepository.save(user);
        
        studentService.addStudent(student);
        
        return "redirect:/managestudents";
    }
    
    @GetMapping("/student/dashboard")
    public String studentDashboard(HttpSession session, Model model) {
        // Retrieve user details from the session
        User user = (User) session.getAttribute("user");

        // Pass user details to the template
        model.addAttribute("user", user);

        return "studentdash";
    }

    @GetMapping("/courses")
    public String courses() {
        return "courses";
    }

    @GetMapping("/homeassignments")
    public String homeAssignments() {
        return "homeassignments";
    }

    @Autowired
    private FacultyService facultyService;

    @GetMapping("/add-faculty")
    public String addFacultyForm() {
        return "addfaculty";
    }
    
    @GetMapping("/faculty/dashboard")
    public String facultyDashboard(HttpSession session, Model model) {
        // Implement logic to load data and prepare the faculty dashboard
        return "facultydash"; // Return the faculty dashboard template
    }


    @PostMapping("/addfaculty")
    public String addFacultySubmit(Faculty faculty) {
        // Add faculty data to the database using FacultyService
    	User user = new User();
        user.setUsername(faculty.getFirstName());  // Set username as the first name
        user.setPassword(faculty.getLastName());
        // Set password as the last name
        user.setRole("FACULTY"); 
       // user.setId(student.getId());// Set the role as "STUDENT"

        // Save the user information to the users table
        userRepository.save(user);
        facultyService.addFaculty(faculty);
        return "redirect:/managefaculty"; // Redirect to the faculty management page
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        // Clear the session when the user logs out
        session.invalidate();
        return "redirect:/home";
    }

    @GetMapping("/feepayments")
    public String feePayments() {
        return "feepayments";
    }


    @GetMapping("/managestudents")
    public String manageStudents(HttpSession session, Model model) {
    	User user = (User) session.getAttribute("user");
	    
	    // Add the user object to the model
	    model.addAttribute("user", user);
        List<Student> students = studentService.getAllStudents();
        model.addAttribute("students", students);
        return "managestudents"; // Return the name of the JSP file (e.g., "managestudents.jsp")
    }
    
    @GetMapping("/profile")
    public String showStudentProfile(HttpSession session, Model model) {
        // Retrieve the currently logged-in user from the session
        User user = (User) session.getAttribute("user");

        // Check if the user exists and their role is "STUDENT"
        if (user != null && "STUDENT".equals(user.getRole())) {
            // Retrieve the student data based on the username (assuming it matches student's first name)
            Student student = studentService.getStudentByFirstName(user.getUsername());
            
            // Add the student data to the model to display in the template
            model.addAttribute("student", student);

            return "studentprof";
        } else {
            // Handle the case when the user is not logged in or doesn't have the "STUDENT" role
            return "redirect:/login"; // Redirect to the login page or another appropriate page
        }
    }
    
    @GetMapping("/student")
    public String getStudent(HttpSession session, Model model) {
        // Retrieve the currently logged-in user from the session
        User user = (User) session.getAttribute("user");
       

        // Pass user details to the template
        model.addAttribute("user", user);
        // Check if the user exists and their role is "STUDENT"
        if (user != null && "STUDENT".equals(user.getRole())) {
            // Retrieve the student data based on the username (assuming it matches student's first name)
            Student student = studentService.getStudentByFirstName(user.getUsername());

            if (student != null) {
                // Add the student object to the model
                model.addAttribute("student", student);
                return "studentprof";
            } else {
                // Handle the case when the student data is not found
                model.addAttribute("error", "Student data not found.");
                return "error"; // Create an "error.html" template for displaying error messages
            }
        } else {
            // Handle the case when the user is not logged in or doesn't have the "STUDENT" role
            return "redirect:/login"; // Redirect to the login page or another appropriate page
        }
    }
    @Autowired
    private HODRepository hodRepository;
    
  
    
    @GetMapping("/managehod")
    public String manageHOD(HttpSession session, Model model) {
User user = (User) session.getAttribute("user");
	    
	    // Add the user object to the model
	    model.addAttribute("user", user);
        List<HOD> hodList = HODService.getAllHODs();
        model.addAttribute("hodList", hodList);
        return "managehod"; // Create a Thymeleaf template for managing HOD
    }

    @GetMapping("/add-hod")
    public String addHODForm(Model model) {
        model.addAttribute("hod", new HOD());
        return "addhod"; // Display the add HOD form
    }
    

    @GetMapping("/hod/dashboard")
    public String hodDashboard(HttpSession session,Model model) {
    	 User user = (User) session.getAttribute("user");

         // Pass user details to the template
         model.addAttribute("user", user);
        // Load and display HOD-specific data in the dashboard
        

        return "hoddash"; // Create a Thymeleaf template for HOD dashboard
    }

    @PostMapping("/addhod")
    public String addHODSubmit(@ModelAttribute HOD hod) {
    	User user = new User();
        user.setUsername(hod.getFirstName());  // Set username as the first name
        user.setPassword(hod.getLastName());
        // Set password as the last name
        user.setRole("HOD"); 
       // user.setId(student.getId());// Set the role as "STUDENT"

        // Save the user information to the users table
        userRepository.save(user);
        hodRepository.save(hod);
        return "redirect:/managehod"; // Redirect to the HOD management page
    }


    @Autowired
    private UserService userService;

    @PostMapping("/updatePassword")
    public String updatePassword(@RequestParam("password") String newPassword, HttpSession session) {
        // Retrieve the currently logged-in user from the session
        User user = (User) session.getAttribute("user");

        // Check if the user exists and their role is "STUDENT"
        if (user != null && "STUDENT".equals(user.getRole())) {
            // Retrieve the student data based on the username (assuming it matches student's first name)
            Student student = studentService.getStudentByFirstName(user.getUsername());

            // Update the password for the corresponding user in the Users table
            User userToUpdate = userService.getUserByUsername(student.getFirstName());
            userToUpdate.setPassword(newPassword);
            userService.updateUser(userToUpdate);

            return "redirect:/profile"; // Redirect back to the student profile page
        } else {
            // Handle the case when the user is not logged in or doesn't have the "STUDENT" role
            return "redirect:/login"; // Redirect to the login page or another appropriate page
        }
    }
    
    
    //course--part----------------------------------------
    
    @Autowired
    private CourseService courseService;
    
    

    @GetMapping("/add-course")
    public String addCourseForm(Model model) {
        model.addAttribute("course", new Course());
        return "addcourse"; // Display the "Add Course" form
    }

    @PostMapping("/addcourse")
    public String addCourseSubmit(@ModelAttribute Course course) {
        // Add course data to the database using CourseService
        courseService.addCourse(course);
        return "redirect:/managecourse"; // Redirect to the course management page
    }
    @GetMapping("/managecourse")
    public String manageCourses(Model model) {
        List<Course> courses = courseService.getAllCourses();
        model.addAttribute("courses", courses);
        return "managecourse"; // Return the name of the Thymeleaf template
    }
    
}
