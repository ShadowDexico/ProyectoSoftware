package com.fernandopertuz.gestionrutas.service;

import com.fernandopertuz.gestionrutas.model.Horario;
import com.fernandopertuz.gestionrutas.model.Ruta;
import com.fernandopertuz.gestionrutas.repository.HorarioRepository;
import com.fernandopertuz.gestionrutas.repository.RutaRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class RutaService {

    private final RutaRepository rutaRepository;
    private final HorarioRepository horarioRepository;

    public RutaService(RutaRepository rutaRepository, HorarioRepository horarioRepository) {
        this.rutaRepository = rutaRepository;
        this.horarioRepository = horarioRepository;
    }

    public List<Ruta> buscarRutasPorUbicaciones(Integer origenId, Integer destinoId) {
        return rutaRepository.findByOrigenIdAndDestinoId(origenId, destinoId);
    }

    public Optional<Ruta> buscarRutaPorId(Integer id) {
        return rutaRepository.findById(id);
    }

    public List<Horario> buscarHorariosPorRutaId(Integer rutaId) {
        return horarioRepository.findByRutaId(rutaId);
    }

    public List<Ruta> obtenerTodasLasRutas() {
        return rutaRepository.findAll();
    }

}
