package com.sist.vo;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class CleanVO {
	private int cno,reviewcount;
	private String title,content,address,carrer, INTRODUCE,EMPLO,contanttime, service,poster ,count,link,category;
	private double score;
}
/*
SELECT cno,title,address,poster,carrer,EMPLO,contanttime,service, score,category
FROM CLEAN_DETAIL
WHERE cno=2;
*/