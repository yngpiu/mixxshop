package com.example.springWEB.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.firewall.HttpFirewall;
import org.springframework.security.web.firewall.StrictHttpFirewall;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;

import jakarta.servlet.DispatcherType;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

        @Bean
        public HttpFirewall httpFirewall() {
                StrictHttpFirewall firewall = new StrictHttpFirewall();
                firewall.setAllowSemicolon(true); // Cho phép ký tự ;
                firewall.setAllowUrlEncodedDoubleSlash(true); // Cho phép //
                return firewall;
        }

        @Bean
        public AuthenticationSuccessHandler myAuthenticationSuccessHandler() {
                return new CustomSuccessHandlers();
        }
        
        @Bean
        public AuthenticationFailureHandler authenticationFailureHandler() {
            return new AuthenticationFailureHandler() {
                @Override
                public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
                                                  AuthenticationException exception) throws IOException, ServletException {
                    System.out.println("Authentication failed: " + exception.getClass().getName());
                    System.out.println("Exception message: " + exception.getMessage());
                    
                    if (exception instanceof BadCredentialsException) {
                        System.out.println("Bad credentials exception - wrong password");
                    } else if (exception instanceof InternalAuthenticationServiceException) {
                        System.out.println("Internal authentication service exception - likely role issues");
                    }
                    
                    response.sendRedirect("/login?error");
                }
            };
        }

        @Bean
        public PasswordEncoder encoder() {
                return new BCryptPasswordEncoder();
        }

        @Bean
        SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
                http
                                .authorizeHttpRequests(authorize -> authorize
                                                .dispatcherTypeMatchers(DispatcherType.FORWARD,
                                                                DispatcherType.INCLUDE)
                                                .permitAll()

                                                .requestMatchers("/", "/login", "/client/**", "/detail/**",
                                                                "/css/**", "/js/**", "/images/**", "/register")
                                                .permitAll()

                                                .requestMatchers("/adminDash/**").hasRole("Admin")

                                                .anyRequest().authenticated())

                                .formLogin(formLogin -> formLogin
                                                .loginPage("/login")
                                                .failureHandler(authenticationFailureHandler())
                                                .successHandler(myAuthenticationSuccessHandler()) // authorization
                                                .permitAll())

                                .exceptionHandling()
                                .and()
                                .rememberMe(reM -> reM.key("uniqueAndSecret").tokenValiditySeconds(86400))
                                .logout(logout -> logout.deleteCookies("JSESSIONID"));
                return http.build();
        }

}
