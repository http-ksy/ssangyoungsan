package com.sist.vo;

import java.util.*;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
//NO NUMBER,
//bno NUMBER CONSTRAINT lb_bno_nn NOT null,
//title varchar2(2000) CONSTRAINT lo_title_nn NOT NULL,
//subject clob CONSTRAINT lo_subject_nn NOT NULL,
//id varchar2(50),
//filename varchar2(2000),
//filesize NUMBER,
//filecount NUMBER,
//hit NUMBER DEFAULT 0,
//regdate DATE DEFAULT sysdate,
//good NUMBER DEFAULT 0,
public class landboardVO {
	private int no,hit,filecount,bno,good;
	private String id,title,subject,filename,filesize,dbday;
	private Date regdate;
	private List<MultipartFile> files;
}
