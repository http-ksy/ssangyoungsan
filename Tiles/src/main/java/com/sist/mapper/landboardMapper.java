package com.sist.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.sist.vo.landboardVO;
import java.util.*;

public interface landboardMapper {
	@Insert("insert into landboard(no,bno,title,subject,id) "
			+ "values(lb_no_seq.nextVal, #{bno}, #{title}, #{subject}, #{id})")
	public void landboardInsert(landboardVO vo);
	
	@Select("select no,title,subject,id,to_char(regdate,'yy-mm-dd')as dbday,hit "
			+"from landboard "
			+ "where bno=#{bno}"
			+ " order by no desc")
	public List<landboardVO> landboard_list(Map map);
}
