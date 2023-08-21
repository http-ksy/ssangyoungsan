package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.landboardMapper;
import com.sist.vo.landboardVO;

@Repository
public class landboardDAO {
	@Autowired
	private landboardMapper mapper;
	public void landboardInsert(landboardVO vo) {
		mapper.landboardInsert(vo);
	}
	
//	@Select("select no,bno,title,subject,id from landboard")
	public List<landboardVO> landboard_list(Map map){
		return mapper.landboard_list(map);
	}
}
