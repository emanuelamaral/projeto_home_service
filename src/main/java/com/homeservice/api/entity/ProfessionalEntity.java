package com.homeservice.api.entity;

import java.io.Serializable;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.homeservice.api.enums.ProfessionEnum;

import jakarta.persistence.CascadeType;
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
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "tb_professional")
public class ProfessionalEntity implements Serializable{
	private static final long serialVersionUID = -5143543148194068766L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer professionalId;
	
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
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "address_id", referencedColumnName = "addressId")
	private AddressEntity address;
	
	@Column(name = "profile_image_path")
	private String profileImagePath;
	
	@OneToMany(mappedBy = "professional", cascade = CascadeType.ALL, orphanRemoval = true)
	@JsonManagedReference
	private List<ProfessionalAvailability> availabilities;	
	
	public ProfessionalEntity() {
		
	}

	public ProfessionalEntity(Integer professionalId, String name, ProfessionEnum profession, String description,
			Double pricePerHour, List<String> avaliations, Integer jobsPerformeds, AddressEntity address, String profileImagePath,
			List<ProfessionalAvailability> availabilities) {
		super();
		this.professionalId = professionalId;
		this.name = name;
		this.profession = profession;
		this.description = description;
		this.pricePerHour = pricePerHour;
		this.avaliations = avaliations;
		this.jobsPerformeds = jobsPerformeds;
		this.address = address;
		this.profileImagePath = profileImagePath;
//		this.availableHour = availableHour;
//		this.daysOfWeek = daysOfWeek;
		this.availabilities = availabilities;
		
		
	}

	public Integer getProfessionalId() {
		return professionalId;
	}

	public void setProfessionalId(Integer professionalID) {
		this.professionalId = professionalID;
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

	public AddressEntity getAddress() {
		return address;
	}

	public void setAddress(AddressEntity address) {
		this.address = address;
	}

	public String getProfileImagePath() {
		return profileImagePath;
	}

	public void setProfileImagePath(String profileImagePath) {
		this.profileImagePath = profileImagePath;
	}

	public List<ProfessionalAvailability> getAvailabilities() {
		return availabilities;
	}

	public void setAvailabilities(List<ProfessionalAvailability> availabilities) {
		this.availabilities = availabilities;
	}

//	public List<Date> getAvailableHour() {
//		return availableHour;
//	}
//
//	public void setAvailableHour(List<Date> availableHour) {
//		this.availableHour = availableHour;
//	}
//
//	public List<DaysOfWeek> getDaysOfWeek() {
//		return daysOfWeek;
//	}
//
//	public void setDaysOfWeek(List<DaysOfWeek> daysOfWeek) {
//		this.daysOfWeek = daysOfWeek;
//	}
	
	
}
