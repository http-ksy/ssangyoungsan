package com.sist.vo;

import lombok.Getter;
import lombok.Setter;

/*
NO         NOT NULL NUMBER        
NAME                VARCHAR2(100) 
TYPE                VARCHAR2(100) 
COMPLETION          VARCHAR2(100) 
ROOM                VARCHAR2(100) 
FLOOR               VARCHAR2(100) 
ADDR1               VARCHAR2(100) 
ADDR2               VARCHAR2(100) 
AREA                VARCHAR2(100) 
STRUCTURE           VARCHAR2(50)  
PARKING             VARCHAR2(50)  
HEATING             VARCHAR2(50)  
TRAFIC              VARCHAR2(50)  
PRICE               VARCHAR2(50)  
PAYMENT             VARCHAR2(50)  
PEOPLE              VARCHAR2(100) 
TEL                 VARCHAR2(50)  
EMAIL               VARCHAR2(50)  
PHONE               VARCHAR2(50)  
COMPONY             VARCHAR2(100) 
REG                 VARCHAR2(100) 
STATE               VARCHAR2(50)  
MOVEDAY             VARCHAR2(50)  
BATHROOM            VARCHAR2(50)  
IMG                 CLOB          

 */
@Getter
@Setter
public class HouseVO {
	private int no;
	private String name,type,completion,room,floor,addr1,addr2,area,structure,parking,heatting,trafic,price,payment,people,tel,email,phone,compony,reg,
					state,moveday,bathroom,img;
}
