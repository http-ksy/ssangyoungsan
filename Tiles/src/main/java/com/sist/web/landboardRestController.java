package com.sist.web;

import java.io.File;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.service.landboardService;
import com.sist.vo.landboardVO;


@RestController
public class landboardRestController {	
	@Autowired
	private landboardService service;
	
	@PostMapping(value = "landboard/landboard_insert.do",produces = "text/plain;charset=utf-8", consumes = {MediaType.MULTIPART_FORM_DATA_VALUE})
	public String landboardInsert(landboardVO vo,HttpSession session,HttpServletRequest request) {
		String result = "";
		String path = request.getSession().getServletContext().getRealPath("/")+"upload/";
		System.out.println("path :" + path);
		path=path.replace("\\", File.separator);
		List<MultipartFile> mlist = vo.getFiles();
		System.out.println("path :" + path);
		String filesize="";
		String filename="";
		int filecount=0;
		if(mlist!=null) {
			System.out.println("file이 "+mlist.size()+"업로드 됨 ");
			for(MultipartFile mf : mlist) {
				String name = mf.getOriginalFilename();
				System.out.print(name+",");
				File file = new File(path+name);
				try {
					mf.transferTo(file); // 업로드 변환??
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}
				filename +=name+",";
				filesize+=file.length()+",";
			}
			filecount = mlist.size();
			filename=filename.substring(0,filename.lastIndexOf(","));
			filesize=filesize.substring(0,filesize.lastIndexOf(","));
		}
		else {
			System.out.println("file 이 비었습니다.");
		}
		vo.setFilename(filename);
		vo.setFilesize(filesize);
		vo.setFilecount(filecount);
		
		try {
			String id = (String)session.getAttribute("id");	
			System.out.println("id" + id);
			vo.setId(id);
			System.out.println();
			service.landboardInsert(vo);
			result = "yes";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			result = "no";
		}
		return result;
	}
	@GetMapping(value = "landboard/landboard_list.do", produces = "text/plain;charset=utf-8")
	public String landboardList(int bno) throws Exception {
		
		Map map = new HashMap();
		map.put("bno",bno);
		List<landboardVO> list = service.landboard_list(map);
		ObjectMapper mapper = new ObjectMapper();
		String json=mapper.writeValueAsString(list);
		
		return json;
	}
	@GetMapping(value="landboard/landboard_detail.do", produces = "text/plain;charset=utf-8")
	public String landboardDetail(int no) throws Exception{
		String json="";
		landboardVO vo= service.landboard_detail(no);
		ObjectMapper mapper=new ObjectMapper();
		json=mapper.writeValueAsString(vo);
		return json;
	}
	@PostMapping(value = "landboard/landboardUpdate.do", produces = "text/plain;charset=utf-8")
	public String landboardUpdate(landboardVO vo) {
		String result="no";
		try {
			service.landboard_update(vo);
			result = "yes";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return result;
	}
	@GetMapping(value = "landboard/landboard_delete.do", produces = "text/plain;charset=utf-8")
	public String landboardDelete(int no) {
		String result="no";
		try {
			service.landboard_delete(no);
			result = "yes";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return result;
	}
}
