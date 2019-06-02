package jungmo.shoppingmall.admin.policy.service;

import java.util.*;

import jungmo.shoppingmall.admin.policy.dao.*;
import jungmo.shoppingmall.admin.policy.domain.*;
import jungmo.shoppingmall.user.join.domain.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.jdbc.datasource.*;
import org.springframework.stereotype.*;
import org.springframework.transaction.annotation.*;
import org.springframework.web.multipart.*;

@Service
@Transactional
public class ClauseServiceImpl implements ClauseService{
	@Autowired private ClauseDao clauseDao;
	@Autowired private DataSourceTransactionManager tansactionManager;
	
	public void insertClause(Clause cls){
		clauseDao.insertClause(cls);
	}
	
	public void updateClause(Clause cls){
		clauseDao.updateClause(cls);
	}
	
	public void deleteClause(HashMap<String,List<Integer>> map){
		clauseDao.deleteClause(map);
	}
	
	public DeliveryPolicy getDeliveryPolicy(){
		return clauseDao.getDeliveryPolicy();
	}
	
	public List<NoDeliveryArea> getNoDeliveryArea(){
		return clauseDao.getNoDeliveryArea();
	}
	
	public PointPolicy getPointPolicy(){
		return clauseDao.getPointPolicy();
	}
	
	public CommonPolicy getCommonPolicy(){
		return clauseDao.getCommonPolicy();
	}
	
	public void insertNda(HashMap<String,List<NoDeliveryArea>> map){
		clauseDao.insertNda(map);
	}
	
	public void deleteNda(){
		clauseDao.deleteNda();
	}
	
	public void updateDp(DeliveryPolicy dp){
		clauseDao.updateDp(dp);
	}
	
	public void updatePp(PointPolicy pp){
		clauseDao.updatePp(pp);
	}
	
	public void updateCp(CommonPolicy cp){
		clauseDao.updateCp(cp);
	}
	
	@Transactional(isolation=Isolation.DEFAULT,propagation=Propagation.REQUIRED)
	public String modifyPolicy(MultipartHttpServletRequest request,ClauseService clsService){
		String basicFee = request.getParameter("basicFee");
		String freeDeliveryMp = request.getParameter("freeDeliveryMp");
		String ndaList = request.getParameter("ndaList");
		HashMap<String,List<NoDeliveryArea>> map = new HashMap<>();
		List<NoDeliveryArea> list = new ArrayList<>();
		StringTokenizer st = new StringTokenizer(ndaList,",");
		String joinP = request.getParameter("joinP");
		String saveP = request.getParameter("saveP");
		String delivery = request.getParameter("delivery").trim();
		String service = request.getParameter("service").trim();
		clsService.deleteNda();
			if(!ndaList.equals("")){
				StringTokenizer st1 = new StringTokenizer(ndaList,",");
				while(st1.hasMoreElements()){
					StringTokenizer st2 = new StringTokenizer(st1.nextToken(),"[]");
					String postcode = st2.nextToken().trim();
					String street = st2.nextToken().trim();
					NoDeliveryArea nda = new NoDeliveryArea(postcode,street);
					list.add(nda);
				}
				map.put("ndaList", list);
				clsService.insertNda(map);
			}
		clsService.updateDp(new DeliveryPolicy(Integer.parseInt(basicFee),Integer.parseInt(freeDeliveryMp)));
		clsService.updatePp(new PointPolicy(Integer.parseInt(joinP),Integer.parseInt(saveP)));
		clsService.updateCp(new CommonPolicy(delivery,service));
		return "";
	}
}
