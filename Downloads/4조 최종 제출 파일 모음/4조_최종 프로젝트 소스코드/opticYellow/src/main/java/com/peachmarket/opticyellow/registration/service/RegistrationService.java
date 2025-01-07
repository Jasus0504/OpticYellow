package com.peachmarket.opticyellow.registration.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.peachmarket.opticyellow.registration.model.RegistrationDAO;
import com.peachmarket.opticyellow.registration.model.RegistrationVO;

@Service
public class RegistrationService {

	@Autowired
	RegistrationDAO dao;
	
	// 병엽님 코드
	public int registration(RegistrationVO vo) {
		return dao.registration(vo);
	}
}
