package com.homeservice.api.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.homeservice.api.entity.ProfessionalAvailability;
import com.homeservice.api.entity.ProfessionalEntity;
import com.homeservice.api.repository.ProfessionalRepository;

@RestController 
@RequestMapping("/professional")
public class ProfessionalController {
	
	@Autowired
	private ProfessionalRepository profRepository;
	
	@GetMapping
	private ArrayList<ProfessionalEntity> getAllProfessional() {
		return (ArrayList<ProfessionalEntity>) profRepository.findAll();
	}
	
	@GetMapping("/id={id}")
	private ProfessionalEntity getProfessionalById(@PathVariable Integer id) {
		return profRepository.findById(id).orElse(null);
	}
	
	@GetMapping("/availabilities/id={id}")
	private List<ProfessionalAvailability> getProfessionalAvailability(@PathVariable Integer id) {
		ProfessionalEntity professional =  profRepository.findById(id).orElse(null);
		
		return  professional.getAvailabilities();
	}
	
	@GetMapping("/profession={profession}")
	private ArrayList<ProfessionalEntity> getAllProfessionalsByProfession(@PathVariable String profession) {
		ArrayList<ProfessionalEntity> profEntity = getAllProfessional();
		ArrayList<ProfessionalEntity> professionals = new ArrayList<>();
		
		for (ProfessionalEntity pe : profEntity) {
			if (pe.getProfession().toString().toLowerCase().equals(profession)) {
				professionals.add(pe);
			}
		}
		
		return professionals;
	}
	
	@PostMapping
	@ResponseStatus(value = HttpStatus.CREATED)
	private ProfessionalEntity insertProfessional(@RequestBody ProfessionalEntity profEntity) {
		
		 if (profEntity.getAvailabilities() != null) {
	            for (ProfessionalAvailability availability : profEntity.getAvailabilities()) {
	                availability.setProfessional(profEntity);
	            }
	        }
		 
        return profRepository.save(profEntity);
        
        
	}
}
