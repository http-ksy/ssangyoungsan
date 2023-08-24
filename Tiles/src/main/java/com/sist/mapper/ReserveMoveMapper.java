package com.sist.mapper;

import org.apache.ibatis.annotations.Insert;

import com.sist.vo.ReserveCleanVO;
import com.sist.vo.ReserveMoveVO;

public interface ReserveMoveMapper {
	@Insert("INSERT INTO reserve_info_move VALUES("
			+ "RIC_NO_SEQ.nextval,#{id},#{mno},#{rday},#{rtime},#{room},100,'y',SYSDATE)")
	public void reserve_ok(ReserveMoveVO vo);
}
