package com.fernandopertuz.gestionrutas.repository;

import com.fernandopertuz.gestionrutas.model.Horario;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface HorarioRepository extends JpaRepository<Horario, Integer> {

    List<Horario> findByRutaId(Integer rutaId);
}
