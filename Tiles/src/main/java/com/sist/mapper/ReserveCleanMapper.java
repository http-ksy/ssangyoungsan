package com.sist.mapper;

import java.util.*;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.sist.vo.ReserveCleanVO;

public interface ReserveCleanMapper {	
	@Insert("INSERT INTO reserve_info_clean VALUES("
			+ "RIC_NO_SEQ.nextval,#{id},#{cno},#{rday},#{rtime},#{room},30000,'y',SYSDATE)")
	public void reserve_ok(ReserveCleanVO vo);
	
}
