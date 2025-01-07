package com.peachmarket.opticyellow.interceptor;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public enum Role {
	ADMIN, USER;
	
	public static Role fromString(String value) {
		log.info("fromString()...{}",value);
        // Role.values()는 Role 열거형(enum)에 정의된 모든 상수를 배열로 반환
		for (Role role : Role.values()) {
            // role.name()은 Role 열거형의 특정 상수의 이름을 반환
			if (role.name().equals(value)) {
                return role;
            }
        }
        throw new IllegalArgumentException("Invalid Role: " + value);
    }

}