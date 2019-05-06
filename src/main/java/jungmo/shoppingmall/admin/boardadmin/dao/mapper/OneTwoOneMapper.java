package jungmo.shoppingmall.admin.boardadmin.dao.mapper;

import java.util.*;

import jungmo.shoppingmall.admin.boardadmin.domain.*;
import jungmo.shoppingmall.admin.order.domain.*;

public interface OneTwoOneMapper {
	List<OtoQuestion> getOtoq(Page page);
	List<OtoQuestion> getOtoqSearch(Page page);
	OtoQuestion getOto(int otoqNum);
	int getOtoa(int otoqNum);
}
