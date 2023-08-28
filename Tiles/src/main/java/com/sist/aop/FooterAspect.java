package com.sist.aop;

import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import java.util.*;

import javax.servlet.http.HttpServletRequest;

import com.sist.dao.*;
import com.sist.service.FooterService;
import com.sist.vo.*;
@Aspect //공통모듈 메모리할당하는애가 아님
@Component // 메모리할당
public class FooterAspect {
  @Autowired
  private FooterService service;
  
  @After("execution(* com.sist.web.*Controller.*(..))")
  public void footerData()
  {
	  HttpServletRequest request= ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();

	  List<EstateDetailVO> elist=service.estateTop7();
	  List<CleanVO> cList=service.cleanTop7();
	  
	  request.setAttribute("elist", elist);
	  request.setAttribute("cList", cList);
	  	
  }
}
