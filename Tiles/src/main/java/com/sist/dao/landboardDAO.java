package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
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
	//@Update("UPDATE landboard set hit=hit+1 where no=#{no}")
	public void incrementHit(int no)
	{
		mapper.incrementHit(no);
	}
	public landboardVO landboard_detail(int no)
	{
		return mapper.landboard_detail(no);
	}
	
//	@Update("update landboard set title=#{title}, subject=#{subject} where no=#{no}")
	public void landboard_update(landboardVO vo) {
		mapper.landboard_update(vo);
	}
	
//	@Delete("delete from landboard where no=#{no}")
	public void landboard_delete(int no) {
		mapper.landboard_delete(no);
	}
}
