package com.sist.vo;

import lombok.Getter;
import lombok.Setter;

// 가격, 이름, 사진, 매물구분, 소재지, 면적, 지하철, 계약상태, 담당자, 상호명 ,소재지 ,(주차대수,주차가능여부),(입주일자,입주가능일)
@Getter
@Setter
public class EstateDetailVO {
	private String dprice,name,img, type,addr,area,trafic,state,manager,company,comaddr,parking,moveday;
	private int no,etype;
}
