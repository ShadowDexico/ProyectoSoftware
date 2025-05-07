package com.fernandopertuz.gestionrutas.service;

import com.fernandopertuz.gestionrutas.model.Ubicacion;
import com.fernandopertuz.gestionrutas.repository.UbicacionRepository;
import java.util.List;
import org.springframework.stereotype.Service;

@Service
public class UbicacionService {

    private final UbicacionRepository ubicacionRepository;

    public UbicacionService(UbicacionRepository ubicacionRepository) {
        this.ubicacionRepository = ubicacionRepository;
    }

    public List<Ubicacion> obtenerTodas() {
        return ubicacionRepository.findAll();
    }
}
