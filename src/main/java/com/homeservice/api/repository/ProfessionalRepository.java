package com.homeservice.api.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.homeservice.api.entity.ProfessionalEntity;

public interface ProfessionalRepository extends JpaRepository<ProfessionalEntity, Integer>{

}
