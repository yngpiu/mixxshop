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
	
	@Bean
	public CommandLineRunner initFakeData(
			RolesRepository rolesRepository,
			UserRepository userRepository,
			ProductsRepository productsRepository,
			CartRepository cartRepository,
			CartDetailRepository cartDetailRepository,
			OrderRepository orderRepository,
			OrderDetailRepository orderDetailRepository,
			FeedbackRepository feedbackRepository,
			PasswordEncoder passwordEncoder) {
		
		return args -> {
			Random random = new Random();
			
			// Get roles
			Roles userRole = rolesRepository.findByName("User");
			Roles adminRole = rolesRepository.findByName("Admin");
			
			if (userRole == null || adminRole == null) {
				System.out.println("Roles not found. Cannot initialize fake data.");
				return;
			}
			
			// Check if we already have users
			if (userRepository.count() > 3) {
				System.out.println("Fake data already exists. Skipping initialization.");
				return;
			}
			
			// Create admin user
			Users admin = new Users();
			admin.setEmail("admin@example.com");
			admin.setPassword(passwordEncoder.encode("admin123"));
			admin.setFullname("Admin User");
			admin.setAddress("123 Admin Street, Admin City");
			admin.setPhone("0987654321");
			admin.setRoles(adminRole);
			userRepository.save(admin);
			
			// Create 5 regular users
			String[] firstNames = {"Nguyen", "Tran", "Le", "Pham", "Hoang"};
			String[] lastNames = {"An", "Binh", "Cuong", "Dung", "Hoa"};
			
			for (int i = 0; i < 5; i++) {
				Users user = new Users();
				String firstName = firstNames[random.nextInt(firstNames.length)];
				String lastName = lastNames[random.nextInt(lastNames.length)];
				user.setEmail(firstName.toLowerCase() + "." + lastName.toLowerCase() + i + "@example.com");
				user.setPassword(passwordEncoder.encode("user123"));
				user.setFullname(firstName + " " + lastName);
				user.setAddress(random.nextInt(100) + " " + firstName + " Street, HCM City");
				user.setPhone("09" + (10000000 + random.nextInt(90000000)));
				user.setRoles(userRole);
				userRepository.save(user);
				System.out.println("Created user: " + user.getEmail());
			}
			
			// Create 10 products
			String[] laptopBrands = {"DELL", "ASUS", "ACER", "LENOVO", "HP"};
			String[] laptopTargets = {"GAMING", "SINHVIEN-VANPHONG", "MONG-NHE"};
			
			for (int i = 0; i < 10; i++) {
				Products product = new Products();
				String brand = laptopBrands[random.nextInt(laptopBrands.length)];
				String target = laptopTargets[random.nextInt(laptopTargets.length)];
				
				product.setName("Laptop " + brand + " Model " + (2020 + random.nextInt(5)));
				product.setPrice(10000000 + random.nextInt(20000000));
				product.setDetailDes("Hiệu năng mạnh mẽ với bộ vi xử lý Intel Core i" + (5 + random.nextInt(5)) + 
						", RAM " + (8 + random.nextInt(3) * 4) + "GB, SSD " + (256 + random.nextInt(3) * 256) + "GB");
				product.setShortDes("Laptop " + brand + " mạnh mẽ cho " + (target.equals("GAMING") ? "game thủ" : 
						target.equals("MONG-NHE") ? "người dùng di chuyển nhiều" : "sinh viên và văn phòng"));
				product.setFactory(brand);
				product.setQuantity(50 + random.nextInt(50));
				product.setSold(random.nextInt(30));
				product.setTarget(target);
				product.setImage("laptop" + (i+1) + ".png");
				
				productsRepository.save(product);
				System.out.println("Created product: " + product.getName());
			}
			
			// Create carts for all users except admin
			for (Users user : userRepository.findAll()) {
				if (user.getRoles().getName().equals("User")) {
					Cart cart = new Cart();
					cart.setUsers(user);
					cart.setSum(0);
					cartRepository.save(cart);
					
					// Add 1-3 products to each cart
					int numProducts = 1 + random.nextInt(3);
					int totalItems = 0;
					
					for (int i = 0; i < numProducts; i++) {
						// Get random product
						long productId = 1 + random.nextInt((int) productsRepository.count());
						Products product = productsRepository.findById(productId);
						
						if (product != null) {
							int quantity = 1 + random.nextInt(3);
							totalItems += quantity;
							
							CartDetail cartDetail = new CartDetail();
							cartDetail.setCart(cart);
							cartDetail.setProducts(product);
							cartDetail.setQuantity(quantity);
							cartDetail.setPrice((long) product.getPrice());
							
							cartDetailRepository.save(cartDetail);
						}
					}
					
					// Update cart total items
					cart.setSum(totalItems);
					cartRepository.save(cart);
				}
			}
			
			// Create orders
			String[] statuses = {"Pending", "Processing", "Shipped", "Delivered"};
			
			for (Users user : userRepository.findAll()) {
				if (user.getRoles().getName().equals("User") && random.nextBoolean()) {
					Oders order = new Oders();
					order.setUsers(user);
					order.setDateOrder(new Date());
					order.setReceiverName(user.getFullname());
					order.setReceiverAddress(user.getAddress());
					order.setReceiverPhone(user.getPhone());
					order.setStatus(statuses[random.nextInt(statuses.length)]);
					
					// Create 1-3 order details
					int numOrderItems = 1 + random.nextInt(3);
					double totalPrice = 0;
					
					orderRepository.save(order);
					
					for (int i = 0; i < numOrderItems; i++) {
						// Get random product
						long productId = 1 + random.nextInt((int) productsRepository.count());
						Products product = productsRepository.findById(productId);
						
						if (product != null) {
							int quantity = 1 + random.nextInt(2);
							double itemPrice = product.getPrice() * quantity;
							totalPrice += itemPrice;
							
							OrderDetail orderDetail = new OrderDetail();
							orderDetail.setOrders(order);
							orderDetail.setProducts(product);
							orderDetail.setQuantity(quantity);
							orderDetail.setPrice(product.getPrice());
							
							orderDetailRepository.save(orderDetail);
						}
					}
					
					order.setTotalPrice(totalPrice);
					orderRepository.save(order);
					System.out.println("Created order for: " + user.getEmail());
				}
			}
			
			// Create product feedback
			String[] feedbackContent = {
				"Sản phẩm rất tốt, đúng như mô tả.",
				"Chất lượng tuyệt vời, giao hàng nhanh.",
				"Pin trâu, hiệu năng mạnh.",
				"Hơi nóng khi chơi game nhưng vẫn ổn.",
				"Mỏng nhẹ, phù hợp mang đi làm."
			};
			
			for (Products product : productsRepository.findAll()) {
				// 50% chance of having feedback
				if (random.nextBoolean()) {
					// Get 1-3 random users to leave feedback
					int numFeedbacks = 1 + random.nextInt(3);
					
					for (int i = 0; i < numFeedbacks; i++) {
						if (userRepository.count() > 1) {
							// Get a random user
							long userId = 2 + random.nextInt((int) (userRepository.count() - 1));
							Users user = userRepository.findById(userId);
							
							if (user != null) {
								FeedBack feedback = new FeedBack();
								feedback.setProduct(product);
								feedback.setUser(user);
								feedback.setContent(feedbackContent[random.nextInt(feedbackContent.length)]);
								feedback.setDate(new Date());
								
								feedbackRepository.save(feedback);
							}
						}
					}
				}
			}
			
			System.out.println("Fake data initialization completed!");
		};
	}
}
