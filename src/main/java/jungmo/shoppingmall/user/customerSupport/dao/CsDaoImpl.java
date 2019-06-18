package jungmo.shoppingmall.user.customerSupport.dao;

import java.util.*;

import jungmo.shoppingmall.user.customerSupport.dao.mapper.*;
import jungmo.shoppingmall.user.customerSupport.domain.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Repository
public class CsDaoImpl implements CsDao{
	@Autowired private CsMapper csMapper;
	
	public Customer getPwd(Customer cs){
		return csMapper.getPwd(cs);
	}
	
	public List<Customer> getId(Customer cs){
		return csMapper.getId(cs);
	}
	
	public int updatePwd(Customer cs){
		return csMapper.updatePwd(cs);
	}
}
