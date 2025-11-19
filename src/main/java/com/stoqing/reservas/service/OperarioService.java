package com.stoqing.reservas.service;

import com.stoqing.reservas.entities.model.Operario;
import com.stoqing.reservas.repository.OperarioRepository;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class OperarioService {

    private final OperarioRepository operarioRepo;

    public List<Operario> findAll(){
        return operarioRepo.findAll();
    }

    public void createOperario(Operario operario){
        operarioRepo.save(operario);
    }

}