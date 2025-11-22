package com.stoqing.reservas.entities.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
import java.time.LocalTime;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
public class HistorialMesa {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id_h_mesa")
    private int id;

    @ManyToOne
    @JoinColumn(name="id_operario")
    private Operario operario;

    @ManyToOne
    @JoinColumn(name="num_mesa")
    private Mesa mesa;

    @ManyToOne
    @JoinColumn(name="id_estado_anterior")
    private Estado estado_anterior;

    @ManyToOne
    @JoinColumn(name="id_estado_actual")
    private Estado estado_atual;

    @Column(nullable=false)
    private LocalDate fecha_actualizacion;

    @Column(nullable=false)
    private LocalTime hora_actualizacion;
}
