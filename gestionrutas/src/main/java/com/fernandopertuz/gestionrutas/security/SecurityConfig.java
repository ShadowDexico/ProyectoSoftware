package com.fernandopertuz.gestionrutas.security;

import com.fernandopertuz.gestionrutas.CustomOAuth2SuccessHandler;
import com.fernandopertuz.gestionrutas.security.jwt.JwtAuthenticationFilter;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.context.annotation.Bean;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

    private final CustomOAuth2SuccessHandler successHandler;
    private final JwtAuthenticationFilter jwtFilter;

    public SecurityConfig(CustomOAuth2SuccessHandler successHandler, JwtAuthenticationFilter jwtFilter) {
        this.successHandler = successHandler;
        this.jwtFilter = jwtFilter;
    }

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http
                .csrf(csrf -> csrf.disable())
                .authorizeHttpRequests(auth -> auth
                .requestMatchers("/", "/auth/**").permitAll()
                .anyRequest().authenticated()
                )
                .oauth2Login(oauth -> oauth
                .successHandler(successHandler)
                )
                .addFilterBefore(jwtFilter, UsernamePasswordAuthenticationFilter.class);

        return http.build();
    }
}
