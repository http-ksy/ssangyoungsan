package com.sist.vo;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class MoveReplyVO {
	private int no,Mno;
	private String id,name,msg,dbday;
	private Date regdate;
}
