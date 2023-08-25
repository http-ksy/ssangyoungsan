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
  @Autowired
  private MoveDAO mdao;
  @Autowired
  private CleanDAO cdao;
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

	@Override
	public void inteZimDelete(InteLikeVO vo) {
		// TODO Auto-generated method stub
		dao.inteZimDelete(vo);
	}

	@Override
	public List<MoveVO> moveZzim(Map map) {
		// TODO Auto-generated method stub
		List<MoveVO> list=new ArrayList<MoveVO>();
		List<Integer> mlist=dao.moveZzim(map);
		for(Integer mvo:mlist)
		{
			list.add(mdao.MoveDetailData(mvo));
		}
		return list;
	}

	@Override
	public int moveZzimTotalPage(Map map) {
		// TODO Auto-generated method stub
		return dao.moveZzimTotalPage(map);
	}

	@Override
	public List<CleanVO> cleanZzim(Map map) {
		// TODO Auto-generated method stub
		List<CleanVO> list=new ArrayList<CleanVO>();
		List<Integer> clist=dao.cleanZzim(map);
		for(Integer cvo:clist)
		{
			list.add(cdao.CleanDetailData(cvo));
		}
		return list;
	}

	@Override
	public int cleanZzimTotalPage(Map map) {
		// TODO Auto-generated method stub
		return dao.cleanZzimTotalPage(map);
	}

	@Override
	public void moveZimDelete(MoveJjimVO vo) {
		// TODO Auto-generated method stub
		dao.moveZimDelete(vo);
	}

	@Override
	public void cleanZimDelete(CleanJjimVO vo) {
		// TODO Auto-generated method stub
		dao.cleanZimDelete(vo);
	}
 
}
