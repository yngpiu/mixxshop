package com.example.springWEB;

import java.util.Date;
import java.util.Random;

import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.example.springWEB.domain.Oders;
import com.example.springWEB.domain.OrderDetail;
import com.example.springWEB.domain.Products;
import com.example.springWEB.domain.Roles;
import com.example.springWEB.domain.Users;
import com.example.springWEB.domain.cart.Cart;
import com.example.springWEB.domain.cart.CartDetail;
import com.example.springWEB.domain.cart.FeedBack;
import com.example.springWEB.repository.CartDetailRepository;
import com.example.springWEB.repository.CartRepository;
import com.example.springWEB.repository.FeedbackRepository;
import com.example.springWEB.repository.OrderDetailRepository;
import com.example.springWEB.repository.OrderRepository;
import com.example.springWEB.repository.ProductsRepository;
import com.example.springWEB.repository.RolesRepository;
import com.example.springWEB.repository.UserRepository;

@SpringBootApplication
public class SpringWebApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringWebApplication.class, args);
	}

	@Bean
	public CommandLineRunner initRoles(RolesRepository rolesRepository) {
		return args -> {
			// Check if the User role exists
			if (rolesRepository.findByName("User") == null) {
				Roles userRole = new Roles();
				userRole.setName("User");
				userRole.setDescription("Regular user role");
				rolesRepository.save(userRole);
				System.out.println("Created User role");
			}

			// Check if the Admin role exists
			if (rolesRepository.findByName("Admin") == null) {
				Roles adminRole = new Roles();
				adminRole.setName("Admin");
				adminRole.setDescription("Administrator role");
				rolesRepository.save(adminRole);
				System.out.println("Created Admin role");
			}
		};
	}
}
