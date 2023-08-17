package com.sist.vo;

import lombok.Getter;
import lombok.Setter;

/*
	no NUMBER,
    name VARCHAR2(100),
    type VARCHAR2(100),
    completion VARCHAR2(100),
    room VARCHAR2(100),
    floor VARCHAR2(100),
    addr1 VARCHAR2(100),
    addr2 VARCHAR2(100),
    area VARCHAR2(100),
    realarea VARCHAR2(100),
    structure VARCHAR2(50),
    parking VARCHAR2(50),
    heating VARCHAR2(50),
    form VARCHAR2(50),
    cold VARCHAR2(50),
    trafic VARCHAR2(50),
    monthprice VARCHAR2(50),
	payment VARCHAR2(50),
	people VARCHAR2(100),
	tel VARCHAR2(50),
	email VARCHAR2(50),
	phone VARCHAR2(50),
	compony VARCHAR2(100),
	reg VARCHAR2(100),
	state VARCHAR2(50),
	moveday VARCHAR2(50),
	bathroom VARCHAR2(50),
	img CLOB,
 */
@Getter
@Setter
public class RoomVO {
	private int no;
	private String name,type,completion,room,floor,addr1,form,addr2,area,realarea,structure,parking,heating,cold,trafic,monthprice,payment,people,tel
				,email,phone,compony,reg,state,moveday,bathroom,img;
}
