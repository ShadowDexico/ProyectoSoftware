
package com.fernandopertuz.gestionrutas.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "rutas")
public class Ruta {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String nombre;
    private String descripcion;

    @Column(name = "imagen_url")
    private String imagenUrl;

    @ManyToOne
    @JoinColumn(name = "origen_id")
    private Ubicacion origen;

    @ManyToOne
    @JoinColumn(name = "destino_id")
    private Ubicacion destino;

    @ManyToOne
    @JoinColumn(name = "estado_id")
    private Estado estado;
}
