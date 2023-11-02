package com.homeservice.api.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.homeservice.api.entity.UserEntity;

public interface UserRepository extends JpaRepository<UserEntity, Integer>{

}
