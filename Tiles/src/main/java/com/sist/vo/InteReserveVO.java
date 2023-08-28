package com.sist.vo;
/*
  no    NUMBER, --예약번호
    id    VARCHAR2(20),
    ino   NUMBER,
    rday  VARCHAR2(30) constraint rii_day_nn NOT NULL,
    rtime VARCHAR2(30) constraint rii_time_nn NOT NULL,
    rok   VARCHAR2(10),
    regdate DATE  DEFAULT sysdate,
 */

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class InteReserveVO {
	private int no,ino;
	private String id,reserve_date,reserve_time,rok,dbday,title,poster;
	private Date regdate;
	
}
