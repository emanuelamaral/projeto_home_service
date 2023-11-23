package com.homeservice.api.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

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
	
	@GetMapping("{id}")
	private ProfessionalEntity getProfessionalById(@PathVariable Integer id) {
		return profRepository.findById(id).get();
	}
	
	@PostMapping
	@ResponseStatus(value = HttpStatus.CREATED)
	private ProfessionalEntity insertProfessional(@RequestBody ProfessionalEntity profEntity) {
		return profRepository.save(profEntity);
	}
}
