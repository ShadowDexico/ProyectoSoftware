package com.fernandopertuz.gestionrutas;

import com.fernandopertuz.gestionrutas.model.Usuario;
import com.fernandopertuz.gestionrutas.repository.UsuarioRepository;
import com.fernandopertuz.gestionrutas.security.jwt.JwtUtil;
import jakarta.servlet.ServletException;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

import java.util.Optional;
import org.springframework.security.oauth2.core.user.OAuth2User;

@Component
public class CustomOAuth2SuccessHandler implements AuthenticationSuccessHandler {

    private final JwtUtil jwtUtil;
    private final UsuarioRepository usuarioRepository;

    public CustomOAuth2SuccessHandler(UsuarioRepository usuarioRepository, JwtUtil jwtUtil) {
        this.usuarioRepository = usuarioRepository;
        this.jwtUtil = jwtUtil;
    }

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request,
            HttpServletResponse response,
            Authentication authentication)
            throws IOException, ServletException {
        OAuth2User oAuth2User = (OAuth2User) authentication.getPrincipal();
        String email = oAuth2User.getAttribute("email");
        String nombre = oAuth2User.getAttribute("name");
        String imagen = oAuth2User.getAttribute("picture");

        Optional<Usuario> usuarioOpt = usuarioRepository.findByEmail(email);
        Usuario usuario = usuarioOpt.orElseGet(() -> {
            Usuario nuevo = new Usuario();
            nuevo.setEmail(email);
            nuevo.setNombre(nombre);
            nuevo.setImagenUrl(imagen);
            nuevo.setProveedor("GOOGLE");
            return usuarioRepository.save(nuevo);
        });
        String jwt = jwtUtil.generateToken(email);
        response.sendRedirect("http://localhost:8080/oauth2/redirect?token=" + jwt);

    }
}
