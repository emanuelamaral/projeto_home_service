package com.homeservice.api.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.homeservice.api.enums.DaysOfWeek;
import com.homeservice.api.utils.JsonTimeListSerializer;

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
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "tb_professional_availability")
public class ProfessionalAvailability implements Serializable{

	private static final long serialVersionUID = -2213572304484393725L;

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "professional_id")
    @JsonBackReference
    private ProfessionalEntity professional;

    @Enumerated(EnumType.STRING)
    @Column(name = "day_of_week")
    private DaysOfWeek dayOfWeek;

    @ElementCollection
    @CollectionTable(name = "tb_professional_hour", joinColumns = @JoinColumn(name = "professional_availability_id"))
    @Column(name = "available_hour")
    @JsonSerialize(using = JsonTimeListSerializer.ListTimeSerializer.class)
    @JsonDeserialize(using = JsonTimeListSerializer.ListTimeDeserializer.class)
    private List<Date> availableHours;
    
    public ProfessionalAvailability() {
    	
    }

	public ProfessionalAvailability(Integer id, ProfessionalEntity professional, DaysOfWeek dayOfWeek,
			List<Date> availableHours) {
		super();
		this.id = id;
		this.professional = professional;
		this.dayOfWeek = dayOfWeek;
		this.availableHours = availableHours;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public ProfessionalEntity getProfessional() {
		return professional;
	}

	public void setProfessional(ProfessionalEntity professional) {
		this.professional = professional;
	}

	public DaysOfWeek getDayOfWeek() {
		return dayOfWeek;
	}

	public void setDayOfWeek(DaysOfWeek dayOfWeek) {
		this.dayOfWeek = dayOfWeek;
	}

	public List<Date> getAvailableHours() {
		return availableHours;
	}

	public void setAvailableHours(List<Date> availableHours) {
		this.availableHours = availableHours;
	}
}