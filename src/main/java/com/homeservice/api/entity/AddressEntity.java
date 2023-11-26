package com.homeservice.api.entity;

import java.io.Serializable;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "tb_address")
public class AddressEntity implements Serializable {
	private static final long serialVersionUID = 3945945963473060985L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer addressId;
	
	private String street;
	
	@Column(name = "number_of_house")
	private String numberOfHouse;
	
	private String district;
	
	private String city;
	
	private String state;
	
	private String complement;
	
	public AddressEntity() {
		
	}

	public AddressEntity(Integer addressId, String street, String numberOfHouse, String district, String city, String state,
			String complement) {
		super();
		this.addressId = addressId;
		this.street = street;
		this.numberOfHouse = numberOfHouse;
		this.district = district;
		this.city = city;
		this.state = state;
		this.complement = complement;
	}

	public Integer getAddressId() {
		return addressId;
	}

	public void setAddressId(Integer addressId) {
		this.addressId = addressId;
	}

	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
	}
	
	public String getNumber() {
		return numberOfHouse;
	}

	public void setNumber(String numberOfHouse) {
		this.numberOfHouse = numberOfHouse;
	}

	public String getDistrict() {
		return district;
	}

	public void setDistrict(String district) {
		this.district = district;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getComplement() {
		return complement;
	}

	public void setComplement(String complement) {
		this.complement = complement;
	}
	
}
