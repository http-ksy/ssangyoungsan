package com.sist.service;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.sist.vo.ReserveCleanVO;

public interface ReserveCleanService {
	
	public void reserve_ok(ReserveCleanVO vo);
	
}
