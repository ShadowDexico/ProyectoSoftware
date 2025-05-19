package com.fernandopertuz.gestionrutas.controller;

import com.fernandopertuz.gestionrutas.model.Usuario;
import com.fernandopertuz.gestionrutas.repository.UsuarioRepository;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/usuario")
@CrossOrigin(origins = "*")
public class UsuarioController {

    private final UsuarioRepository usuarioRepository;

    public UsuarioController(UsuarioRepository usuarioRepository) {
        this.usuarioRepository = usuarioRepository;
    }

    // Ruta protegida: devuelve el perfil del usuario autenticado
    @GetMapping("/perfil")
    public ResponseEntity<Usuario> getPerfil(Authentication authentication) {
        // authentication.getName() devuelve el "principal", aqui el email
        String email = authentication.getName();
        Usuario usuario = usuarioRepository.findByEmail(email)
                .orElseThrow(() -> new RuntimeException("Usuario no encontrado"));
        return ResponseEntity.ok(usuario);
    }
}
