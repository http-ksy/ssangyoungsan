package com.sist.dao;
import com.sist.vo.*;
import com.sist.mapper.*;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {
 @Autowired
 private MemberMapper mapper;
//회원가입
	/*@Insert("INSERT INTO amem VALUES("
			+ "#{id},#{pwd},#{email},#{name},#{nickname},#{sex},#{birthday},#{phone},#{addr1},#{addr2},"
			+ "#{post},#{admin},SYSDATE)")*/
	public void MemberInsert(MemberVO vo)
	{
		mapper.MemberInsert(vo);
	}
	// 로그인 
	/*@Select("SELECT pwd,name,sex,admin FROM amem "
			+ "WHERE id=#{id}")*/
	public MemberVO memberLogin(String id)
	{
		return mapper.memberLogin(id);
	}
	// 아이디 췌크
	/*@Select("SELECT COUNT(*) FROM amem WHERE id=#{id}")*/
	public int memberIdCheck(String id)
	{
		return mapper.memberIdCheck(id);
	}
	public int memberNickCheck(String nickname)
	{
		return mapper.memberNickCheck(nickname);
	}
	// 이메일 체크
			//@Select("SELECT COUNT(*) FROM amem WHERE email=#{email}")
	public int memberEmailCheck(String email)
	{
		return mapper.memberEmailCheck(email);
	}
	//@Select("SELECT COUNT(*) FROM amem WHERE phone=${phone}")
	public int memberPhoneCheck(String phone)
	{
		return mapper.memberPhoneCheck(phone);
	}
	/*@Select("SELECT id,pwd,email,name,nickname,sex,birthday,phone,addr1,addr2,post,admin FROM amem"
			+ "WHERE id=#{id}")*/
	public MemberVO memberInfo(String id)
	{
		return mapper.memberInfo(id);
	}
	//@Select("SELECT pwd FROM amem WHERE id=#{id}")
	public String memberPwdCheck(String id)
	{
		return mapper.memberPwdCheck(id);
	}
	/*@Update("UPDATE amem SET nickname=#{nickname},email=#{email},post=#{post},addr1=#{addr1},addr2=#{addr2},phone=#{phone},pwd=#{pwd} "
			+ "WHERE id=#{id}")*/
	public void memberUpdate(MemberVO vo)
	{
		mapper.memberUpdate(vo);
	}
	//@Delete("DELETE FROM amem WHERE id=#{id}")
	public void memberDelete(String id)
	{
		mapper.memberDelete(id);
	}
	public List<MemberVO> memberFindData(Map map)
	{
		return mapper.memberFindData(map);
	}
	public int memberTotalPage(Map map)
	{
		return mapper.memberTotalPage(map);
	}
	public List<EstateDetailVO> zipTypeData(Map map)
	{
		return mapper.zipTypeData(map);
	}
	public int zipBuyTotalPage(Map map)
	{
		return mapper.zipBuyTotalPage(map);
	}
	
	/*@Select("SELECT no,ino,id,num "
			+ "FROM (SELECT no,ino,id,rownum as num "
			+ "FROM (SELECT no,ino,id "
			+ "FROM interior_like WHERE id=#{id} ORDER BY no ASC)) "
			+ "WHERE num BETWEEN #{start} AND #{end} ")*/
	public List<Integer> inteLike(Map map)
	{
		return mapper.inteLike(map);
	}
	//@Select("SELECT CEIL(COUNT(*)/8) FROM interior_like WHERE id=#{id}")
	public int inteLikeTotalPage(Map map)
	{
		return mapper.inteLikeTotalPage(map);
	}
	public void inteZimDelete(InteLikeVO vo)
	{
		mapper.inteZimDelete(vo);
	}
	
	public List<Integer> moveZzim(Map map)
	{
		return mapper.moveZzim(map);
	}
	//@Select("SELECT CEIL(COUNT(*)/8) FROM interior_like WHERE id=#{id}")
	public int moveZzimTotalPage(Map map)
	{
		return mapper.moveZzimTotalPage(map);
	}
	public void moveZimDelete(MoveJjimVO vo)
	{
		mapper.moveZimDelete(vo);
	}
	
	public List<Integer> cleanZzim(Map map)
	{
		return mapper.cleanZzim(map);
	}
	//@Select("SELECT CEIL(COUNT(*)/8) FROM clean_jjim WHERE id=#{id}")
	public int cleanZzimTotalPage(Map map)
	{
		return mapper.cleanZzimTotalPage(map);
	}
	public void cleanZimDelete(CleanJjimVO vo)
	{
		mapper.cleanZimDelete(vo);
	}
	// 인테리어 사장님 예약 목록 // 사용자 인테리어 예약 목록
		/*@Select("SELECT no,id,ino,reserve_date,reserve_time,num "
				+ "FROM (SELECT no,id,ino,reserve_date,reserve_time,rownum as num "
				+ "FROM (SELECT no,id,ino,reserve_date,reserve_time "
				+ "FROM reserve_info_inte ORDER BY no ASC)) "
				+ "WHERE num BETWEEN #{start} AND #{end} ")*/
		public List<InteReserveVO> inte_reserve(Map map)
		{
			return mapper.inte_reserve(map);
		}
		//@Select("SELECT CEIL(COUNT(*)/8) FROM reserve_info_inte ")
		public int inte_reserve_totalPage(Map map)
		{
			return mapper.inte_reserve_totalPage(map);
		}
	// 인테리어 사용자 예약 목록
//		@Select("SELECT inteGetTitle(ino) as title,no,id,ino,reserve_date,reserve_time,num "
//				+ "FROM (SELECT inteGetTitle(ino) as title,no,id,ino,reserve_date,reserve_time,rownum as num "
//				+ "FROM (SELECT inteGetTitle(ino) as title,no,id,ino,reserve_date,reserve_time "
//				+ "FROM reserve_info_inte WHERE id=#{id} ORDER BY no ASC)) "
//				+ "WHERE num BETWEEN #{start} AND #{end} ")
		public List<InteReserveVO> inte_user_reserve(Map map)
		{
			return mapper.inte_user_reserve(map);
		}
		//@Select("SELECT CEIL(COUNT(*)/8) FROM reserve_info_inte WHERE id=#{id} ")
		public int inte_user_reserve_totalPage(Map map)
		{
			return mapper.inte_reserve_totalPage(map);
		}
		
//		@Select("SELECT moveGetTitle(mno) as title,no,id,mno,reserve_date,reserve_time,num "
//				+ "FROM (SELECT moveGetTitle(mno) as title,no,id,mno,reserve_date,reserve_time,rownum as num "
//				+ "FROM (SELECT moveGetTitle(mno) as title,no,id,mno,reserve_date,reserve_time "
//				+ "FROM reserve_info_move OREDER BY no desc)) "
//				+ "WHERE num BETWEEN #{start} AND #{end} ")
		public List<ReserveMoveVO> move_admin_reserve(Map map)
		{
			return mapper.move_admin_reserve(map);
		}
//		@Select("SELECT CEIL(COUNT(*)/8) FROM reserve_info_move ")
		public int move_admin_reserve_totalPage(Map map)
		{
			return mapper.move_admin_reserve_totalPage(map);
		}
		
//		@Select("SELECT cleanGetTitle(mno) as title,no,id,mno,rday,rtime,num "
//				+ "FROM (SELECT cleanGetTitle(mno) as title,no,id,mno,rday,rtime,rownum as num "
//				+ "FROM (SELECT cleanGetTitle(mno) as title,no,id,mno,rday,rtime "
//				+ "FROM clean_info_move ORDER BY no desc)) "
//				+ "WHERE num BETWEEN #{start} AND #{end} ")
		public List<ReserveCleanVO> clean_admin_reserve(Map map)
		{
			return mapper.clean_admin_reserve(map);
		}
//		@Select("SELECT CEIL(COUNT(*)/8) FROM clean_info_move ")
		public int clean_admin_reserve_totalPage(Map map)
		{
			return mapper.clean_admin_reserve_totalPage(map);
		}
	// 이사 사용자
//	@Select("SELECT moveGetTitle(mno) as title,no,id,mno,rday,rtime,num "
//						+ "FROM (SELECT moveGetTitle(mno) as title,no,id,mno,rday,rtime,rownum as num "
//						+ "FROM (SELECT moveGetTitle(mno) as title,no,id,mno,rday,rtime "
//						+ "FROM reserve_info_move WHERE id=#{id} ORDER BY no desc)) "
//						+ "WHERE num BETWEEN #{start} AND #{end} ")
		public List<ReserveMoveVO> move_user_reserve(Map map)
		{
			return mapper.move_user_reserve(map);
		}
	 //@Select("SELECT CEIL(COUNT(*)/8) FROM reserve_info_move WHERE id=#{id}")
		public int move_user_reserve_totalPage(Map map)
		{
			return mapper.move_user_reserve_totalPage(map);
		}
				
		////청소 사용자 예약목록 
//			@Select("SELECT cleanGetTitle(cno) as title,no,id,cno,rday,rtime,num "
//					+ "FROM (SELECT cleanGetTitle(cno) as title,no,id,cno,rday,rtime,rownum as num "
//					+ "FROM (SELECT cleanGetTitle(cno) as title,no,id,cno,rday,rtime "
//					+ "FROM reserve_info_clean WHERE id=#{id} ORDER BY no desc)) "
//					+ "WHERE num BETWEEN #{start} AND #{end} ")
	public List<ReserveCleanVO> clean_user_reserve(Map map)
	{
		return mapper.clean_user_reserve(map);
	}
			//@Select("SELECT CEIL(COUNT(*)/8) FROM reserve_info_clean WHERE id=#{id} ")
	public int clean_admin_user_totalPage(Map map)
	{
		return mapper.clean_admin_user_totalPage(map);
	}
}
