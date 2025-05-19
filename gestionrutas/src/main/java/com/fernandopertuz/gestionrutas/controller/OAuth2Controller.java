package com.fernandopertuz.gestionrutas.controller;

import com.fernandopertuz.gestionrutas.model.Usuario;
import com.fernandopertuz.gestionrutas.repository.UsuarioRepository;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.oauth2.client.authentication.OAuth2AuthenticationToken;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/login")
@CrossOrigin(origins = "*")
public class OAuth2Controller {

    @Autowired
    private UsuarioRepository usuarioRepository;

    @GetMapping("/oauth2/success")
    public String loginSuccess(OAuth2AuthenticationToken authToken) {
        Map<String, Object> userDetails = authToken.getPrincipal().getAttributes();
        String email = (String) userDetails.get("email");

        Usuario usuario = usuarioRepository.findByEmail(email).orElseGet(() -> {
            Usuario nuevo = new Usuario();
            nuevo.setEmail(email);
            nuevo.setNombre((String) userDetails.get("name"));
            nuevo.setImagenUrl((String) userDetails.get("picture"));
            nuevo.setProveedor("google");
            return usuarioRepository.save(nuevo);
        });

        return "Bienvenido " + usuario.getNombre() + "!";
    }
}
