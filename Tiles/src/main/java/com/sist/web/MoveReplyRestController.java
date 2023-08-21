package com.sist.web;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.service.MoveReplyService;
import com.sist.vo.MoveReplyVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
public class MoveReplyRestController {
    @Autowired
    private MoveReplyService service;

    public String move_reply_list_data(int mno){
        String json="";
        try {
            List<MoveReplyVO> list =service.moveReplyListData(mno);
            ObjectMapper mapper=new ObjectMapper();
            json=mapper.writeValueAsString(list);
        }catch (Exception e){}
        return json;
    }
    @GetMapping(value = "reply/move_reply_read_vue.do",produces = "text/plain;charset=UTF-8")
    public String move_reply_read(int mno) {
        return move_reply_list_data(mno);
    }

    @PostMapping(value = "reply/move_reply_insert_vue.do",produces = "text/plain;charset=UTF-8")
    public String move_reply_insert(MoveReplyVO vo, HttpSession session) {
        String id=(String)session.getAttribute("id");
        String name=(String)session.getAttribute("name");
        vo.setId(id);
        vo.setName(name);
        service.moveReplyInsert(vo);
        return move_reply_list_data(vo.getMno());
    }
    @GetMapping(value = "reply/move_reply_delete_vue.do",produces = "text/plain;charset=UTF-8")
    public String move_reply_delete(int no,int mno) {
        return move_reply_list_data(mno);
    }

    @PostMapping(value = "reply/move_reply_update_vue.do",produces = "text/plain;charset=UTF-8")
    public String move_reply_update(MoveReplyVO vo) {
        System.out.println("msg="+vo.getMsg());
        service.moveReplyUpdate(vo);
        return move_reply_list_data(vo.getMno());
    }
}
