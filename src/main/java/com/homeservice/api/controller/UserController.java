package com.homeservice.api.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.homeservice.api.auth.UserAuth;
import com.homeservice.api.entity.AddressEntity;
import com.homeservice.api.entity.UserEntity;
import com.homeservice.api.repository.UserRepository;

@RestController
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserRepository userRepository;

	@GetMapping
	public ArrayList<UserEntity> getAllUser() {
		return (ArrayList<UserEntity>) userRepository.findAll();
	}

	@GetMapping("/id={id}")
	public UserEntity getById(@PathVariable Integer id) {
		return userRepository.findById(id).get();
		
	}
	
	@GetMapping("/find-email/{email}")
	public UserEntity getByEmail(@PathVariable String email) {
		
		String emailVerify = null;
		ArrayList<UserEntity> users = getAllUser();
		
		for(int i = 0; i < users.size(); i++) {
			emailVerify = users.get(i).getEmail();
			if(emailVerify.compareTo(email) == 0) {
				return userRepository.findById(users.get(i).getUserId()).get();
				
			}
		}
		
		return null;
		
	}
	
	@PostMapping("/auth")
	public UserEntity authUser(@RequestBody UserAuth userAuth) {
		
		UserEntity user = getByEmail(userAuth.getEmail());
		if(user != null) {
			if(user.getPassword().compareTo(userAuth.getPassword()) == 0) {
				return getById(user.getUserId()); 
			}
		} 
		
		return null;
	}

	@PostMapping
	@ResponseStatus(value = HttpStatus.CREATED)
	public UserEntity insertUser(@RequestBody UserEntity user) {
		
		return userRepository.save(user);
	}
	
	@PutMapping("/id={id}")
	public UserEntity updateUser(@PathVariable Integer id, @RequestBody UserEntity user) {
		UserEntity userUpdated = getById(id);
		userUpdated.setName(!user.getName().isEmpty() ? user.getName() : userUpdated.getName());
		userUpdated.setEmail(!user.getEmail().isEmpty() ? user.getEmail() : userUpdated.getEmail());
		userUpdated.setPassword(!user.getPassword().isEmpty() ? user.getPassword() : userUpdated.getPassword());
		userUpdated.setCpf(!user.getCpf().isEmpty() ? user.getCpf() : userUpdated.getCpf());
		
		if (user.getAddress() != null) {
			updateAddressUser(userUpdated.getUserId(), user);
		}
		
		return userRepository.save(userUpdated);
	}
	
	@PutMapping("/address/id={id}")
	public void updateAddressUser(@PathVariable Integer id, @RequestBody UserEntity user) {
		UserEntity userAddressUpdated = getById(id);
		AddressEntity userAddressFromJson = user.getAddress();
		
		AddressEntity addressToUpdate = userAddressUpdated.getAddress();
		addressToUpdate.setStreet(!userAddressFromJson.getStreet().isEmpty() ? userAddressFromJson.getStreet() : addressToUpdate.getStreet());
		addressToUpdate.setNumberOfHouse(!userAddressFromJson.getNumberOfHouse().isEmpty() ? userAddressFromJson.getNumberOfHouse() : addressToUpdate.getNumberOfHouse());
		addressToUpdate.setDistrict(!userAddressFromJson.getDistrict().isEmpty() ? userAddressFromJson.getDistrict() : addressToUpdate.getDistrict());
		addressToUpdate.setCity(!userAddressFromJson.getCity().isEmpty() ? userAddressFromJson.getCity() : addressToUpdate.getCity());
		addressToUpdate.setState(!userAddressFromJson.getState().isEmpty() ? userAddressFromJson.getState() : addressToUpdate.getState());
		addressToUpdate.setComplement(!userAddressFromJson.getComplement().isEmpty() ? userAddressFromJson.getComplement() : addressToUpdate.getComplement());
		
		userAddressUpdated.setAddress(addressToUpdate);
	}
	
	@DeleteMapping("/id={id}")
	public UserEntity deleteUser(@PathVariable Integer id) {
		UserEntity deletedUser = getById(id);
		userRepository.deleteById(id);
		return deletedUser;
	}
}