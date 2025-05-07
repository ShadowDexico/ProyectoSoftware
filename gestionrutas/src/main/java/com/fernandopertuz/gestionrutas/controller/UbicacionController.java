package com.fernandopertuz.gestionrutas.controller;

import com.fernandopertuz.gestionrutas.model.Ubicacion;
import com.fernandopertuz.gestionrutas.service.UbicacionService;
import java.util.List;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequestMapping("/api/ubicaciones")
@CrossOrigin(origins = "*")
public class UbicacionController {

    private final UbicacionService ubicacionService;

    public UbicacionController(UbicacionService ubicacionService) {
        this.ubicacionService = ubicacionService;
    }

    @GetMapping
    public List<Ubicacion> obtenerUbicaciones() {
        return ubicacionService.obtenerTodas();
    }
}