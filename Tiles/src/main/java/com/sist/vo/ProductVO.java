package com.sist.vo;
/*
 * no NUMBER,
	poster VARCHAR2(260),
	title VARCHAR2(800) CONSTRAINT gd_title_nn NOT NULL,
	original_pri VARCHAR2(30),
	sale VARCHAR2(5),
	priced_sale VARCHAR2(30),
	brand VARCHAR2(100),
	delivery_pri CLOB,
	review_cnt NUMBER DEFAULT 0,
	score VARCHAR2(10),
	detailposters VARCHAR2(260),
	CONSTRAINT gd_no_pk PRIMARY KEY(no)
 */
import java.util.*;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
public class ProductVO {
private String poster,title,original_pri,sale,priced_sale,brand,
	delivery_pri,score,detailposters;
private int no,review_cnt;
	
}
