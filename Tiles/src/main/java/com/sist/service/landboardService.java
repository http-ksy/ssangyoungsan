package com.sist.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import com.sist.vo.landboardVO;

public interface landboardService {
	public void landboardInsert(landboardVO vo);
	
	public List<landboardVO> landboard_list(Map map);
	
	public landboardVO landboard_detail(int no);
	
	public void landboard_update(landboardVO vo);

	public void landboard_delete(int no);
}
