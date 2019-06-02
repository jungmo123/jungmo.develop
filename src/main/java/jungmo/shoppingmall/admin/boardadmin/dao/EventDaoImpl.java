package jungmo.shoppingmall.admin.boardadmin.dao;

import java.util.*;

import jungmo.shoppingmall.admin.boardadmin.dao.mapper.*;
import jungmo.shoppingmall.admin.boardadmin.domain.*;
import jungmo.shoppingmall.admin.order.domain.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
@Repository
public class EventDaoImpl implements EventDao{
	@Autowired private EventMapper eventMapper;
	
	public List<Event> getEvent(Page page){
		return eventMapper.getEvent(page);
	}
	
	public List<Event> getEventSearch(Page page){
		return eventMapper.getEventSearch(page);
	}
	
	public Event getEventRead(int eventNum){
		return eventMapper.getEventRead(eventNum);
	}
	
	public int deleteEvent(List<Integer> list){
		return eventMapper.deleteEvent(list);
	}
	
	public int delEvent(int eventNum){
		return eventMapper.delEvent(eventNum);
	}
	
	public int addEvent(Event event){
		return eventMapper.addEvent(event);
	}
	
	public int modifyEvent(Event event){
		return eventMapper.modifyEvent(event);
	}
	
	public Event getEventContent(int eventNum){
		return eventMapper.getEventContent(eventNum);
	}
}
