package com.sist.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.sist.dao.*;
import com.sist.vo.*;
import java.util.*;
@Service
public class MemberServiceImpl implements MemberService{
  @Autowired
  private MemberDAO dao;
  @Autowired
  private InteDAO idao;
	@Override
	public void MemberInsert(MemberVO vo) {
		// TODO Auto-generated method stub
		dao.MemberInsert(vo);
	}

	@Override
	public MemberVO memberLogin(String id) {
		return dao.memberLogin(id);
	}

	@Override
	public int memberIdCheck(String id) {
		// TODO Auto-generated method stub
		return dao.memberIdCheck(id);
	}

	@Override
	public int memberNickCheck(String nickname) {
		// TODO Auto-generated method stub
		return dao.memberNickCheck(nickname);
	}

	@Override
	public int memberEmailCheck(String email) {
		// TODO Auto-generated method stub
		return dao.memberEmailCheck(email);
	}

	@Override
	public int memberPhoneCheck(String phone) {
		// TODO Auto-generated method stub
		return dao.memberPhoneCheck(phone);
	}

	@Override
	public MemberVO memberInfo(String id) {
		// TODO Auto-generated method stub
		return dao.memberInfo(id);
	}

	@Override
	public String memberPwdCheck(String id) {
		// TODO Auto-generated method stub
		return dao.memberPwdCheck(id);
	}

	@Override
	public void memberUpdate(MemberVO vo) {
		// TODO Auto-generated method stub
		dao.memberUpdate(vo);
	}

	@Override
	public void memberDelete(String id) {
		// TODO Auto-generated method stub
		dao.memberDelete(id);
	}

	@Override
	public List<MemberVO> memberFindData(Map map) {
		// TODO Auto-generated method stub
		return dao.memberFindData(map);
	}

	@Override
	public int memberTotalPage(Map map) {
		// TODO Auto-generated method stub
		return dao.memberTotalPage(map);
	}

	@Override
	public List<EstateDetailVO> zipTypeData(Map map) {
		// TODO Auto-generated method stub
		return dao.zipTypeData(map);
	}

	@Override
	public int zipBuyTotalPage(Map map) {
		// TODO Auto-generated method stub
		return dao.zipBuyTotalPage(map);
	}

	@Override
	public List<InteVO> inteLike(Map map) {
		// TODO Auto-generated method stub
		List<InteVO> list=new ArrayList<InteVO>();
		List<Integer> ilist=dao.inteLike(map);
		for(Integer ivo:ilist)
		{
			list.add(idao.inteDetailData(ivo));
		}
		return list;
	}

	@Override
	public int inteLikeTotalPage(Map map) {
		// TODO Auto-generated method stub
		return dao.inteLikeTotalPage(map);
	}
 
}
