package com.fernandopertuz.gestionrutas.controller;

import com.fernandopertuz.gestionrutas.model.Horario;
import com.fernandopertuz.gestionrutas.model.Ruta;
import com.fernandopertuz.gestionrutas.service.RutaService;
import org.springframework.web.bind.annotation.*;

import java.util.*;

@RestController
@RequestMapping("/api/rutas")
@CrossOrigin(origins = "*")
public class RutaController {

    private final RutaService rutaService;

    public RutaController(RutaService rutaService) {
        this.rutaService = rutaService;
    }

    @GetMapping("/buscar")
    public List<Map<String, Object>> buscarRutas(
            @RequestParam("origen") Integer origenId,
            @RequestParam("destino") Integer destinoId) {

        List<Ruta> rutas = rutaService.buscarRutasPorUbicaciones(origenId, destinoId);
        List<Map<String, Object>> respuesta = new ArrayList<>();

        for (Ruta ruta : rutas) {
            List<Horario> horarios = rutaService.buscarHorariosPorRutaId(ruta.getId());

            for (Horario horario : horarios) {
                Map<String, Object> info = new HashMap<>();
                info.put("ruta", ruta.getNombre());
                info.put("frecuencia", horario.getFrecuenciaMinutos());
                info.put("horaInicio", horario.getHoraInicio());
                info.put("horaFin", horario.getHoraFin());
                info.put("idRuta", ruta.getId());
                respuesta.add(info);
            }
        }
        return respuesta;
    }

    @GetMapping("/{id}")
    public Map<String, Object> obtenerDetalleRuta(@PathVariable Integer id) {
        Optional<Ruta> rutaOpt = rutaService.buscarRutaPorId(id);
        if (rutaOpt.isEmpty()) {
            throw new NoSuchElementException("Ruta no encontrada");
        }

        Ruta ruta = rutaOpt.get();
        Map<String, Object> detalle = new HashMap<>();
        detalle.put("texto", ruta.getNombre());
        detalle.put("descripcion", ruta.getDescripcion());
        detalle.put("imagen", ruta.getImagenUrl());

        return detalle;
    }

    @GetMapping
    public List<Map<String, Object>> obtenerTodasLasRutas() {
        List<Ruta> rutas = rutaService.obtenerTodasLasRutas();
        List<Map<String, Object>> respuesta = new ArrayList<>();

        for (Ruta ruta : rutas) {
            Map<String, Object> detalle = new HashMap<>();
            detalle.put("texto", ruta.getNombre());
            detalle.put("descripcion", ruta.getDescripcion());
            detalle.put("imagen", ruta.getImagenUrl());
            respuesta.add(detalle);
        }

        return respuesta;
    }

}
