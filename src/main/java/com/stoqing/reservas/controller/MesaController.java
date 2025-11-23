package com.stoqing.reservas.controller;

import com.stoqing.reservas.repository.ReservaRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.time.LocalDate;

@Controller
@AllArgsConstructor
@RequestMapping("/gestion_mesas")
public class MesaController {
    private final ReservaRepository reservaRepo;

    @GetMapping({"/", ""})
    public String mesas(Model model) {
        LocalDate hoy = LocalDate.now();

        model.addAttribute("reservas", reservaRepo.findByFechaReserva(hoy));

        return "pages/mesas";
    }
}
