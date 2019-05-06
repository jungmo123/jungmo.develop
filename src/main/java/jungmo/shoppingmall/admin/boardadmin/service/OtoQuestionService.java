package jungmo.shoppingmall.admin.boardadmin.service;

import java.util.*;

import jungmo.shoppingmall.admin.boardadmin.domain.*;
import jungmo.shoppingmall.admin.order.domain.*;

public interface OtoQuestionService {
	List<OtoQuestion> getOtoq(Page page);
	List<OtoQuestion> getOtoqSearch(Page page);
	OtoQuestion getOto(int otoqNum);
}
