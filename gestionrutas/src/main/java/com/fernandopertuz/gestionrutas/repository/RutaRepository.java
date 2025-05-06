package com.fernandopertuz.gestionrutas.repository;

import com.fernandopertuz.gestionrutas.model.Ruta;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface RutaRepository extends JpaRepository<Ruta, Integer> {

    List<Ruta> findByOrigenIdAndDestinoId(Integer origenId, Integer destinoId);
}
