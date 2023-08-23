package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.InteMapper;
import com.sist.vo.InteReplyVO;
import com.sist.vo.InteVO;

@Repository
public class InteDAO {
	@Autowired
	private InteMapper mapper;
	
	
	//@Select("SELECT no,title,poster,jiyoek,price "
	//		+ "FROM inte_detail ORDER BY no ASC")
	
	 public List<InteVO> inteListData(Map map) { 
		 return mapper.inteListData(map);
	  }
	 
	
	//@Select("SELECT CEIL(COUNT(*)/12.0) FROM inte_detail")
	public int inteTotalPage(Map map) {
		return mapper.inteTotalPage(map);
	}
	
	public InteVO inteDetailData(int ino) {
		return mapper.inteDetailData(ino);
	}
	
//댓글
	public List<InteReplyVO> InteReplyListData(int ino) {
		return mapper.InteReplyListData(ino);
	}
	
	//@Select("INSERT INTO inte_reply VALUES(ir_no_seq.nextval,#{ino},#{id},#{name},#{msg},SYSDATE)")
	public void InteReplyInsert(InteReplyVO vo) {
		mapper.InteReplyInsert(vo);
	}
}
