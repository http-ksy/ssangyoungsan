package com.sist.vo;

import java.util.*;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReserveMoveVO {
	private int no,mno,price;
	private String id,rday,rtime,room,rok;
	private Date regdate;
	private String poster,title,address,dbday;
}
