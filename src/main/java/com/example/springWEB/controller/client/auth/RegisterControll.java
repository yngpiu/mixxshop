package com.example.springWEB.controller.client.auth;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.springWEB.domain.Roles;
import com.example.springWEB.domain.Users;
import com.example.springWEB.domain.dto.RegisterDTO;
import com.example.springWEB.repository.RolesRepository;
import com.example.springWEB.service.UserService;

import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class RegisterControll {

    private UserService userService;
    private RolesRepository rolesRepository;

    public RegisterControll(UserService userService, RolesRepository rolesRepository) {
        this.userService = userService;
        this.rolesRepository = rolesRepository;
    }

    @GetMapping("/register")
    public String register(Model model, @ModelAttribute("regisNew") RegisterDTO re) {
        return "/client/auth/register";
    }

    @PostMapping("/register")
    public String registerf(Model model, @ModelAttribute("regisNew") RegisterDTO re,
            RedirectAttributes redirectAttributes) {
        // Validate password and email first
        String pass = re.getPassword();
        String repass = re.getRepeatPassword();
        boolean hasER = false;
        
        if (!pass.equals(repass)) {
            redirectAttributes.addFlashAttribute("showMess", true);
            hasER = true;
            System.out.println("error repass");
        }

        if (this.userService.existsByEmailUser(re.getEmail())) {
            redirectAttributes.addFlashAttribute("emailExist", true);
            hasER = true;
            System.out.println("email is exist");
        }

        if (hasER) {
            return "redirect:/register";
        }
        
        // Create user after validation passes
        Users kq = this.userService.registerDtoToUser(re);
        
        // Get User role and assign it
        Roles userRole = this.rolesRepository.findByName("User");
        if (userRole == null) {
            System.out.println("WARNING: 'User' role not found in database. Creating it now.");
            userRole = new Roles();
            userRole.setName("User");
            userRole.setDescription("Regular user role");
            userRole = this.rolesRepository.save(userRole);
        }
        
        kq.setRoles(userRole);
        System.out.println("Setting role: " + userRole.getName() + " (ID: " + userRole.getId() + ") to user: " + kq.getEmail());
        
        // Save user with role
        Users savedUser = this.userService.createUser(kq);
        System.out.println("User saved with ID: " + savedUser.getId() + ", has role: " + (savedUser.getRoles() != null));
        
        return "redirect:/login";
    }

    @GetMapping("/login")
    public String login(Model model) {
        return "/client/auth/login";
    }

    @GetMapping("/access-deny")
    public String getMethodName(Model model) {
        return "/client/auth/access-deny";
    }
}
