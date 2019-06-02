package jungmo.shoppingmall.admin.boardadmin.service;

import java.util.*;

import jungmo.shoppingmall.admin.boardadmin.dao.*;
import jungmo.shoppingmall.admin.boardadmin.domain.*;
import jungmo.shoppingmall.admin.order.domain.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Service
public class EventServiceImpl implements EventService{
	@Autowired private EventDao eventDao;
	
	public List<Event> getEvent(Page page){
		return eventDao.getEvent(page);
	}
	
	public List<Event> getEventSearch(Page page){
		return eventDao.getEventSearch(page);
	}
	
	public Event getEventRead(int eventNum){
		return eventDao.getEventRead(eventNum);
	}
	
	public int deleteEvent(List<Integer> list){
		return eventDao.deleteEvent(list);
	}
	
	public int delEvent(int eventNum){
		return eventDao.delEvent(eventNum);
	}
	
	public int addEvent(Event event){
		return eventDao.addEvent(event);
	}
	
	public int modifyEvent(Event event){
		return eventDao.modifyEvent(event);
	}
	
	public Event getEventContent(int eventNum){
		return eventDao.getEventContent(eventNum);
	}
}
