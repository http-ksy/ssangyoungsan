package com.sist.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.sist.dao.*;
import com.sist.vo.*;

@Service
public class FooterServiceImpl implements FooterService{
	@Autowired
	private FooterDAO dao;

	@Override
	public List<EstateDetailVO> estateTop7() {
		// TODO Auto-generated method stub
		return dao.estateTop7();
	}

	@Override
	public List<CleanVO> cleanTop7() {
		return dao.cleanTop7();
	}

	@Override
	public List<InteVO> InteTop7() {
		return dao.InteTop7();
	}

	@Override
	public List<ProductVO> GaguTop7() {
		return dao.GaguTop7();
	}

	@Override
	public List<MoveVO> moveTop7() {
		// TODO Auto-generated method stub
		return dao.moveTop7();
	}
	
}
