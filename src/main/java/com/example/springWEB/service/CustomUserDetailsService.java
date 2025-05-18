package com.example.springWEB.service;

import java.util.Collections;

import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.example.springWEB.domain.Roles;
import com.example.springWEB.domain.Users;
import com.example.springWEB.repository.RolesRepository;

@Service
public class CustomUserDetailsService implements UserDetailsService {

    private UserService userService;
    private RolesRepository rolesRepository;

    public CustomUserDetailsService(UserService userService, RolesRepository rolesRepository) {
        this.userService = userService;
        this.rolesRepository = rolesRepository;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        System.out.println("Loading user by email: " + username);
        Users users = this.userService.findUsersByEmail(username);
        if (users == null) {
            System.out.println("User not found with email: " + username);
            throw new UsernameNotFoundException("Not find this user");
        }
        
        System.out.println("User found: " + users.getEmail() + ", has role: " + (users.getRoles() != null));
        
        // Check if user has role assigned and auto-assign if missing
        if (users.getRoles() == null) {
            System.out.println("User doesn't have a role assigned: " + users.getEmail() + ". Assigning default role.");
            
            // Try to find User role
            Roles userRole = this.rolesRepository.findByName("User");
            if (userRole == null) {
                System.out.println("Creating default User role");
                userRole = new Roles();
                userRole.setName("User");
                userRole.setDescription("Regular user role");
                userRole = this.rolesRepository.save(userRole);
            }
            
            // Assign role to user and save
            users.setRoles(userRole);
            users = this.userService.saveUser(users);
            System.out.println("Assigned role to user: " + users.getEmail() + ", role: " + users.getRoles().getName());
        }

        return new User(
                users.getEmail(),
                users.getPassword(),
                Collections.singletonList(new SimpleGrantedAuthority("ROLE_" + users.getRoles().getName())));
    }

}
