package com.sist.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
public class ReserveCleanVO {
	private int no,cno,price;
	private String id,rday,rtime,room,rok;
	private Date regdate;
	private String poster,title,address,cdbday;
}
