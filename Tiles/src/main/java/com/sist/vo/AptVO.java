package com.sist.vo;

import lombok.Getter;
import lombok.Setter;

/*
no NUMBER,
    type VARCHAR2(20),
    completion VARCHAR2(20),
    room VARCHAR2(10),
    floor VARCHAR2(100),
    addr1 VARCHAR2(100),
    addr2 VARCHAR2(100),
    area VARCHAR2(20),
    structure VARCHAR2(20),
    parking VARCHAR2(30),
    heating VARCHAR2(20),
    trafic VARCHAR2(50),
    price VARCHAR2(50),
	payment VARCHAR2(50),
	people VARCHAR2(100),
	tel VARCHAR2(50),
	email VARCHAR2(50),
	phone VARCHAR2(50),
	compony VARCHAR2(100),
	reg VARCHAR2(100),
	loc VARCHAR2(100),
	
	state VARCHAR2(50),
	moveday VARCHAR2(50),
	bathroom VARCHAR2(30),
	faces VARCHAR2(30),
	realarea VARCHAR2(20),
	cold VARCHAR2(20),
	hot VARCHAR2(20),
	totalhouseholds VARCHAR2(20),
 */
@Getter
@Setter
public class AptVO {
	private int no;
	private String name,type,completion,room,floor,addr1,addr2,area,structure,parking,heating,trafic,price,payment,people,tel,email,phone,compony,reg,loc,
					state,moveday,bathroom,faces,realarea,cold,hot,totalhouseholds,img;
}
