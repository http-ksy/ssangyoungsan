package com.sist.service;

import org.apache.ibatis.annotations.Select;

import com.sist.vo.CleanVO;
import com.sist.vo.EstateDetailVO;
import com.sist.vo.InteVO;
import com.sist.vo.MoveVO;

import java.util.*;
public interface ContentService {
//	@Select("SELECT * FROM estate_detail WHERE no=#{no}")
	public List<EstateDetailVO> estateRandomList();
	
	// 청소
	public List<CleanVO> cleanRandomList();
		
	// 이사
	public List<MoveVO> moveRandomList();
	
	//인테리어
	public List<InteVO> inteRandomList();
}
