package com.sist.dao;
import com.sist.vo.*;
import com.sist.mapper.*;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
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
}
