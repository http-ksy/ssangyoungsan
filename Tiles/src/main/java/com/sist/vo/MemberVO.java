package com.sist.vo;
/*
 *  id varchar2(50),
 pwd varchar2(50) CONSTRAINT amem_pwd_nn NOT NULL,
 email VARCHAR2(200) CONSTRAINT amem_email_nn NOT NULL,
 name VARCHAR2(51) CONSTRAINT amem_name_nn NOT NULL,
 nickname varchar2(51) CONSTRAINT amem_nick_nn NOT NULL,
 sex varchar2(10),  --CHECK IN (�궓�옄,�뿬�옄)
 birthday VARCHAR2(20) CONSTRAINT amem_bday_nn NOT NULL,
 phone varchar2(13) CONSTRAINT amem_phone_nn NOT NULL,
 addr1 varchar2(1000) CONSTRAINT amem_addr1_nn NOT NULL,
 addr2 varchar2(500) CONSTRAINT amem_addr2_nn NOT NULL,
 post VARCHAR2(100) CONSTRAINT amem_post_nn NOT NULL,
 admin varchar2(10), --CHECK IN (愿�由ъ옄,�궗�슜�옄,�궗�옣�떂)
 regdate DATE DEFAULT sysdate,
 CONSTRAINT amem_id_pk PRIMARY KEY(id), 
 CONSTRAINT amem_sex_ck CHECK (sex IN('�궓�옄','�뿬�옄')),
 CONSTRAINT amem_user_ck CHECK (admin IN('愿�由ъ옄','�궗�슜�옄','�궗�옣�떂'))
 */
import java.util.*;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
public class MemberVO {
  private String id,pwd,email,name,nickname,sex,birthday,phone,addr1,addr2,post,admin,msg;
  private Date regdate;
}
