package com.sist.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
public class ReserveCleanVO {
	private int crno,cno;
	private String rcid,rday,rtime,rinwon,rok;
	private Date regdate;
	private String poster,title,address,cdbday;
}
