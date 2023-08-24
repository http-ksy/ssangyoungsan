package com.sist.service;

import org.apache.ibatis.annotations.Select;

import com.sist.vo.EstateDetailVO;
import java.util.*;
public interface ContentService {
//	@Select("SELECT * FROM estate_detail WHERE no=#{no}")
	public List<EstateDetailVO> estateRandomList();
}
