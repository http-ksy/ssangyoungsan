package com.sist.mapper;
import java.util.*;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

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
	@Select("SELECT pwd,name,sex,admin FROM amem "
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
}
