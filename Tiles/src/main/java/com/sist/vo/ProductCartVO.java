package com.sist.vo;
import java.util.*;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
public class ProductCartVO {
	private int cno,no,type,total_pri,amount,original_pri,priced_sale;
	private String id,poster,title,brand,delivery_pri;
}
