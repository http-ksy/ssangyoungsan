package com.sist.vo;

import lombok.Getter;
import lombok.Setter;
/*
	no NUMBER,
	title VARCHAR2(1000) CONSTRAINT id_title_nn NOT NULL,
	subject CLOB,
	poster VARCHAR2(500),
	poster2 VARCHAR2(500),
	hashtag CLOB,
	gubun VARCHAR2(260),
	price VARCHAR2(260),
	jiyoek VARCHAR2(300),
 */
@Getter
@Setter
public class InteVO {
	private int ino;
	private String title,subject,poster,poster2,hashtag,gubun,price,jiyoek;
}
