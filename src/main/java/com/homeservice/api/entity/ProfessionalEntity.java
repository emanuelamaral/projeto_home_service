package com.homeservice.api.entity;

import java.util.List;

import com.homeservice.api.enums.ProfessionEnum;

import jakarta.persistence.CollectionTable;
import jakarta.persistence.Column;
import jakarta.persistence.ElementCollection;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.Table;

@Entity
@Table(name = "tb_professional")
public class ProfessionalEntity {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer professionalID;
	
	private String name;
	
	@Enumerated(EnumType.STRING)
	private ProfessionEnum profession;
	
	private String description;
	
	@Column(name = "price_per_hour")
	private Double pricePerHour;
	
	@ElementCollection
	@CollectionTable(name = "tb_professional_avaliation", joinColumns = @JoinColumn(name = "professional_id"))
	@Column(name = "avaliations")
	private List<String> avaliations;
	
	@Column(name = "jobs_performeds")
	private Integer jobsPerformeds;
	
	public ProfessionalEntity() {
		
	}

	public ProfessionalEntity(Integer professionalID, String name, ProfessionEnum profession, String description,
			Double pricePerHour, List<String> avaliations, Integer jobsPerformeds) {
		super();
		this.professionalID = professionalID;
		this.name = name;
		this.profession = profession;
		this.description = description;
		this.pricePerHour = pricePerHour;
		this.avaliations = avaliations;
		this.jobsPerformeds = jobsPerformeds;
	}

	public Integer getProfessionalID() {
		return professionalID;
	}

	public void setProfessionalID(Integer professionalID) {
		this.professionalID = professionalID;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public ProfessionEnum getProfession() {
		return profession;
	}

	public void setProfession(ProfessionEnum profession) {
		this.profession = profession;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Double getPricePerHour() {
		return pricePerHour;
	}

	public void setPricePerHour(Double pricePerHour) {
		this.pricePerHour = pricePerHour;
	}

	public List<String> getAvaliations() {
		return avaliations;
	}

	public void setAvaliations(List<String> avaliations) {
		this.avaliations = avaliations;
	}

	public Integer getJobsPerformeds() {
		return jobsPerformeds;
	}

	public void setJobsPerformeds(Integer jobsPerformeds) {
		this.jobsPerformeds = jobsPerformeds;
	}
	
}
