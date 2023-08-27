package com.sist.mapper;
import java.util.*;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

/*
 *  id varchar2(50),
 pwd varchar2(50) CONSTRAINT amem_pwd_nn NOT NULL,
 email VARCHAR2(200) CONSTRAINT amem_email_nn NOT NULL,
 name VARCHAR2(51) CONSTRAINT amem_name_nn NOT NULL,
 nickname varchar2(51) CONSTRAINT amem_nick_nn NOT NULL,
 sex varchar2(10),  --CHECK IN (남자,여자)
 birthday VARCHAR2(20) CONSTRAINT amem_bday_nn NOT NULL,
 phone varchar2(13) CONSTRAINT amem_phone_nn NOT NULL,
 addr1 varchar2(1000) CONSTRAINT amem_addr1_nn NOT NULL,
 addr2 varchar2(500) CONSTRAINT amem_addr2_nn NOT NULL,
 post VARCHAR2(100) CONSTRAINT amem_post_nn NOT NULL,
 admin varchar2(10), --CHECK IN (관리자,사용자,사장님)
 regdate DATE DEFAULT sysdate,
 CONSTRAINT amem_id_pk PRIMARY KEY(id), 
 CONSTRAINT amem_sex_ck CHECK (sex IN('남자','여자')),
 CONSTRAINT amem_user_ck CHECK (admin IN('관리자','사용자','사장님'))
 */
import com.sist.vo.*;
public interface MemberMapper {
 
	// 회원가입
	@Insert("INSERT INTO amem VALUES("
			+ "#{id},#{pwd},#{email},#{name},#{nickname},#{sex},#{birthday},#{phone},#{addr1},#{addr2},"
			+ "#{post},#{admin},SYSDATE)")
	public void MemberInsert(MemberVO vo);
	// 로그인 
	@Select("SELECT pwd,name,sex,admin,id,nickname FROM amem "
			+ "WHERE id=#{id}")
	public MemberVO memberLogin(String id);
	// 아이디 췌크
	@Select("SELECT COUNT(*) FROM amem WHERE id=#{id}")
	public int memberIdCheck(String id);
	// 닉네임 체크
	@Select("SELECT COUNT(*) FROM amem WHERE nickname=#{nickname}")
	public int memberNickCheck(String nickname);
	// 이메일 체크
	@Select("SELECT COUNT(*) FROM amem WHERE email=#{email}")
	public int memberEmailCheck(String email);
	// 핸드폰 번호 체크
	@Select("SELECT COUNT(*) FROM amem WHERE phone=#{phone}")
	public int memberPhoneCheck(String phone);
	
	// 내 정보 가져오기
	@Select("SELECT id,pwd,email,name,nickname,sex,birthday,phone,addr1,addr2,post,admin FROM amem "
			+ "WHERE id=#{id}")
	public MemberVO memberInfo(String id);
	// 비밀번호 확인 
	@Select("SELECT pwd FROM amem WHERE id=#{id}")
	public String memberPwdCheck(String id);
	// 개인정보 수정
	@Update("UPDATE amem SET nickname=#{nickname},email=#{email},post=#{post},addr1=#{addr1},addr2=#{addr2},phone=#{phone},pwd=#{pwd} "
			+ "WHERE id=#{id}")
	public void memberUpdate(MemberVO vo);
	// 회원 탈퇴 
	@Delete("DELETE FROM amem WHERE id=#{id}")
	public void memberDelete(String id);
	
	/// 관리자 페이지 관리자가 유저 정보 보기
	public List<MemberVO> memberFindData(Map map);
	public int memberTotalPage(Map map);
	
	// 사장님 부동산 매물 리스트 
	public List<EstateDetailVO> zipTypeData(Map map);
	public int zipBuyTotalPage(Map map);
	
	// 인테리어 찜 목록 출력 
	/*
	 * private int no,ino;
		private String id;
	 */
	@Select("SELECT ino,num "
			+ "FROM (SELECT ino,rownum as num "
			+ "FROM (SELECT ino "
			+ "FROM interior_like WHERE id=#{id} ORDER BY no ASC)) "
			+ "WHERE num BETWEEN #{start} AND #{end} ")
	public List<Integer> inteLike(Map map);
	@Select("SELECT CEIL(COUNT(*)/8.0) FROM interior_like WHERE id=#{id}")
	public int inteLikeTotalPage(Map map);
	@Delete("DELETE FROM INTERIOR_LIKE WHERE id=#{id} AND ino=#{ino}")
	public void inteZimDelete(InteLikeVO vo);
	/////////////////////////////////////////////////////////////////////////
	@Select("SELECT mno,num "
			+ "FROM (SELECT mno,rownum as num "
			+ "FROM (SELECT mno "
			+ "FROM move_jjim WHERE id=#{id} ORDER BY no ASC)) "
			+ "WHERE num BETWEEN #{start} AND #{end} ")
	public List<Integer> moveZzim(Map map);
	@Select("SELECT CEIL(COUNT(*)/8) FROM move_jjim WHERE id=#{id}")
	public int moveZzimTotalPage(Map map);
	@Delete("DELETE FROM move_jjim WHERE id=#{id} AND mno=#{mno}")
	public void moveZimDelete(MoveJjimVO vo);
	///////////////////////////////////////////////////////////////////////
	@Select("SELECT cno,num "
			+ "FROM (SELECT cno,rownum as num "
			+ "FROM (SELECT cno "
			+ "FROM clean_jjim WHERE id=#{id} ORDER BY no ASC)) "
			+ "WHERE num BETWEEN #{start} AND #{end} ")
	public List<Integer> cleanZzim(Map map);
	@Select("SELECT CEIL(COUNT(*)/8) FROM clean_jjim WHERE id=#{id}")
	public int cleanZzimTotalPage(Map map);
	@Delete("DELETE FROM clean_jjim WHERE id=#{id} AND cno=#{cno}")
	public void cleanZimDelete(CleanJjimVO vo);
	
	////////////////////////////////////////////////////////////
	// 인테리어 사장님 예약 목록 // 사용자 인테리어 예약 목록
	@Select("SELECT inteGetTitle(ino) as title,no,id,ino,reserve_date,reserve_time,num "
			+ "FROM (SELECT inteGetTitle(ino) as title,no,id,ino,reserve_date,reserve_time,rownum as num "
			+ "FROM (SELECT inteGetTitle(ino) as title,no,id,ino,reserve_date,reserve_time "
			+ "FROM reserve_info_inte ORDER BY no ASC)) "
			+ "WHERE num BETWEEN #{start} AND #{end} ")
	public List<InteReserveVO> inte_reserve(Map map);
	@Select("SELECT CEIL(COUNT(*)/8) FROM reserve_info_inte ")
	public int inte_reserve_totalPage(Map map);
	/// 인테리어 예약목록 사용자
	@Select("SELECT inteGetTitle(ino) as title,no,id,ino,reserve_date,reserve_time,num "
			+ "FROM (SELECT inteGetTitle(ino) as title,no,id,ino,reserve_date,reserve_time,rownum as num "
			+ "FROM (SELECT inteGetTitle(ino) as title,no,id,ino,reserve_date,reserve_time "
			+ "FROM reserve_info_inte WHERE id=#{id} ORDER BY no ASC)) "
			+ "WHERE num BETWEEN #{start} AND #{end} ")
	public List<InteReserveVO> inte_user_reserve(Map map);
	@Select("SELECT CEIL(COUNT(*)/8) FROM reserve_info_inte WHERE id=#{id} ")
	public int inte_user_reserve_totalPage(Map map);
	/////////////////////////////////////////////////////////////////////
	// 이사 예약목록 
	@Select("SELECT moveGetTitle(mno) as title,no,id,mno,rday,rtime,num "
			+ "FROM (SELECT moveGetTitle(mno) as title,no,id,mno,rday,rtime,rownum as num "
			+ "FROM (SELECT moveGetTitle(mno) as title,no,id,mno,rday,rtime "
			+ "FROM reserve_info_move ORDER BY no desc)) "
			+ "WHERE num BETWEEN #{start} AND #{end} ")
	public List<ReserveMoveVO> move_admin_reserve(Map map);
	@Select("SELECT CEIL(COUNT(*)/8) FROM reserve_info_move ")
	public int move_admin_reserve_totalPage(Map map);
	
	
	//// 청소 예약목록 
	@Select("SELECT cleanGetTitle(cno) as title,no,id,cno,rday,rtime,num "
			+ "FROM (SELECT cleanGetTitle(cno) as title,no,id,cno,rday,rtime,rownum as num "
			+ "FROM (SELECT cleanGetTitle(cno) as title,no,id,cno,rday,rtime "
			+ "FROM reserve_info_clean ORDER BY no desc)) "
			+ "WHERE num BETWEEN #{start} AND #{end} ")
	public List<ReserveCleanVO> clean_admin_reserve(Map map);
	@Select("SELECT CEIL(COUNT(*)/8) FROM reserve_info_clean ")
	public int clean_admin_reserve_totalPage(Map map);
	
	// 이사 사용자
		@Select("SELECT moveGetTitle(mno) as title,no,id,mno,rday,rtime,num "
				+ "FROM (SELECT moveGetTitle(mno) as title,no,id,mno,rday,rtime,rownum as num "
				+ "FROM (SELECT moveGetTitle(mno) as title,no,id,mno,rday,rtime "
				+ "FROM reserve_info_move WHERE id=#{id} ORDER BY no desc)) "
				+ "WHERE num BETWEEN #{start} AND #{end} ")
		public List<ReserveMoveVO> move_user_reserve(Map map);
		@Select("SELECT CEIL(COUNT(*)/8) FROM reserve_info_move WHERE id=#{id}")
		public int move_user_reserve_totalPage(Map map);
		
////청소 사용자 예약목록 
	@Select("SELECT cleanGetTitle(cno) as title,no,id,cno,rday,rtime,num "
			+ "FROM (SELECT cleanGetTitle(cno) as title,no,id,cno,rday,rtime,rownum as num "
			+ "FROM (SELECT cleanGetTitle(cno) as title,no,id,cno,rday,rtime "
			+ "FROM reserve_info_clean WHERE id=#{id} ORDER BY no desc)) "
			+ "WHERE num BETWEEN #{start} AND #{end} ")
	public List<ReserveCleanVO> clean_user_reserve(Map map);
	@Select("SELECT CEIL(COUNT(*)/8) FROM reserve_info_clean WHERE id=#{id} ")
	public int clean_admin_user_totalPage(Map map);
	
	/////////////////////////////// 부동산 사장님 페이지 부동산 구매 현황 
	@Select("SELECT no,etype,dprice,name,type,addr,state "
			+ "FROM estate_detail WHERE company=#{name} AND state='매매진행완료'")
	public List<EstateDetailVO> customer_zip_buy(Map map);
	
	/////////// 관리자 장바구니s 
	@Select("SELECT cno,no,type,id,poster,title,total_pri,amount,num "
			+ "FROM (SELECT cno,no,type,id,poster,title,total_pri,amount,rownum as num "
			+ "FROM (SELECT cno,no,type,id,poster,title,total_pri,amount "
			+ "FROM product_cart ORDER BY cno desc)) "
			+ "WHERE num BETWEEN #{start} AND #{end} ")
	public List<ProductCartVO> admin_cart(Map map);
	@Select("SELECT CEIL(COUNT(*)/8) FROM product_cart  ")
	public int admin_cart_totalpage(Map map);
}
