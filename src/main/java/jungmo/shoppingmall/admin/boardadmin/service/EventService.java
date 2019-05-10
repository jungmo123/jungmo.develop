package jungmo.shoppingmall.admin.boardadmin.service;

import java.util.*;

import jungmo.shoppingmall.admin.boardadmin.domain.*;
import jungmo.shoppingmall.admin.order.domain.*;

public interface EventService {
	List<Event> getEvent(Page page);
	List<Event> getEventSearch(Page page);
	Event getEventRead(int eventNum);
	int deleteEvent(List<Integer> list);
	int delEvent(int eventNum);
	int addEvent(Event event);
}
