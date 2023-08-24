package com.sist.vo;

import java.util.*;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReserveMoveVO {
	private int mrno,mno;
	private String rcid,rday,rtime,rinwon,rok;
	private Date regdate;
	private String poster,title,address,mdbday;
}
