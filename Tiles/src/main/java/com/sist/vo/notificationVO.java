package com.sist.vo;

/*
 * NO
ID
NAME
TYPE
SUBJECT
CONTENT
REGDATE
HIT
 */
import java.util.*;

import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
public class notificationVO {
	private int no,type,hit;
	private String id,name,subject,content,dbday;
	private Date regdate;
}
