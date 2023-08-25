package com.sist.vo;
import java.util.*;

import lombok.Getter;
import lombok.Setter;

/*
 *  NO NUMBER,
	bno NUMBER,
	id varchar2(50),
	content clob CONSTRAINT lbr_cont_nn NOT NULL,
	regdate DATE DEFAULT sysdate,
	group_id NUMBER,  -- NVL(max(group_id)+1,1) sequence
	group_step NUMBER DEFAULT 0,
	group_tab NUMBER DEFAULT 0,
	root NUMBER DEFAULT 0,
	dept NUMBER DEFAULT 0,
 */
@Getter
@Setter
public class landboardReplyVO {
	private int no,bno,group_id,group_step,group_tab,root,dept;
	private String content,dbday,nickname,id;
	private Date regdate;
}
