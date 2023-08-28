package com.sist.vo;
import java.util.*;

import lombok.Getter;
import lombok.Setter;
/*
 *  ono NUMBER CONSTRAINT pdo_ono_nn NOT NULL,
	NO NUMBER,
	TYPE NUMBER,
	title VARCHAR2(800),
	brand VARCHAR2(100),
	poster VARCHAR2(260),
	id VARCHAR2(30),
	addr1 CLOB,
	addr2 CLOB,
	name VARCHAR2(51),
	email VARCHAR2(2000),
	phone VARCHAR2(100),
	select_pri NUMBER,
	del_pri NUMBER,
	final_pri NUMBER,
 */
@Getter
@Setter
public class ProductOrderVO {
	private int ono,no,type,select_pri,del_pri,final_pri;
	private String title,brand,poster,id,addr1,addr2,name,email,phone;
}
