package com.stoqing.reservas.entities.model;

import com.stoqing.reservas.entities.dto.Audit;
import com.stoqing.reservas.entities.emuns.CapacidadMesa;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalTime;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Mesa {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "num_mesa")
    public int id;

    @ManyToOne
    @JoinColumn(name = "id_estado", nullable = false)
    public Estado estado;

    @NotNull
    @Enumerated(EnumType.STRING)
    public CapacidadMesa capacidad;

    public LocalTime fecha;

    @Embedded
    private Audit audit = new Audit();
}
