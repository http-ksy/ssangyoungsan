package com.sist.vo;

import lombok.Getter;
import lombok.Setter;

/*
no NUMBER,
    name VARCHAR2(100),
    type VARCHAR2(100),
    completion VARCHAR2(100),
    parking VARCHAR2(50),
    addr1 VARCHAR2(100),
    area VARCHAR2(100),
    realarea VARCHAR2(50),
    cost VARCHAR2(50),
    saletype VARCHAR2(50),
	state VARCHAR2(50),
	moveday VARCHAR2(50),
    floor VARCHAR2(100),
	img CLOB,
 */
@Getter
@Setter
public class BunVO {
	private int no;
	private String name,type,completion,parking,addr1,area,realarea,cost,saletype,state,moveday,floor,img;
}
