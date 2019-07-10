package jungmo.shoppingmall.admin.goodsadmin.service;

import java.io.*;
import java.text.*;
import java.util.*;
import java.util.regex.*;

import jungmo.shoppingmall.admin.goodsadmin.dao.*;
import jungmo.shoppingmall.admin.goodsadmin.domain.*;
import jungmo.shoppingmall.admin.order.domain.*;
import jungmo.shoppingmall.admin.order.service.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.transaction.annotation.*;
import org.springframework.web.multipart.*;

@Service
public class GoodsAdminServiceImpl implements GoodsAdminService{
	@Autowired private GoodsAdminDao gaDao;
	
	public int insertGoods(Goods god){
		return gaDao.insertGoods(god);
	}
	
	public int insertGoodsSub(HashMap<String,List<String>> map){
		return gaDao.insertGoodsSub(map);
	}
	
	public int insertGoodsOption(HashMap<String,List<GoodsOption>> map){
		return gaDao.insertGoodsOption(map);
	}
	
	public int insertGoodsIntroduce(HashMap<String,List<GoodsIntroduce>> map){
		return gaDao.insertGoodsIntroduce(map);
	}
	
	public int deleteGoods(int godNum){
		return gaDao.deleteGoods(godNum);
	}
	
	public List<Goods> getGoods(Page page){
		return gaDao.getGoods(page);
	}
	
	public List<Goods> getGoodsSearch(Page page){
		return gaDao.getGoodsSearch(page);
	}
	
	public Goods selectGoods(int godNum){
		return gaDao.selectGoods(godNum);
	}
	
	public List<GoodsOption> selectGodcList(int godNum){
		return gaDao.selectGodcList(godNum);
	}
	
	public List<GoodsOption> selectGodc(String godNum,String optName){
		return gaDao.selectGodc(godNum, optName);
	}
	
	public List<GoodsOption> selectGodo(String godNum){
		return gaDao.selectGodo(godNum);
	}
	
	public List<GoodsIntroduce> selectGodI(int godNum){
		return gaDao.selectGodI(godNum);
	}
	
	public List<GoodsSubImage>selectSubImg(int godNum){
		return gaDao.selectSubImg(godNum);
	}
	
	public int deleteGoodsSub(int godNum){
		return gaDao.deleteGoodsSub(godNum);
	}
	
	public int removeGoodsSub(String godNum,String imgNum){
		return gaDao.removeGoodsSub(godNum, imgNum);
	}
	
	public int deleteGoodsOption(int godNum){
		return gaDao.deleteGoodsOption(godNum);
	}
	
	public int deleteGoodsIntroduce(int godNum){
		return gaDao.deleteGoodsIntroduce(godNum);
	}
	
	public int updateGoods(Goods god){
		return gaDao.updateGoods(god);
	}
	
	public int removeGoods(HashMap<String,List<String>> map){
		return gaDao.removeGoods(map);
	}
	
	public int insertGml(String godNum,String gmlContent,String userId){
		return gaDao.insertGml(godNum, gmlContent, userId);
	}
	
	public List<GoodsManageLog> selectGml(String godNum){
		return gaDao.selectGml(godNum);
	}
	
	public Goods getGodDetail(String godNum){
		return gaDao.getGodDetail(godNum);
	}
	
	@Transactional
	public String addGoods(MultipartHttpServletRequest request,GoodsAdminService gaService){
		String category = request.getParameter("category");
		String godName = request.getParameter("productName");
		String sellingPrice = request.getParameter("sellingPrice");
		String normalPrice = request.getParameter("normalPrice");
		String godSellingLimit = request.getParameter("godSellingLimit");
		String godStock = request.getParameter("godStock");
		String goodsIntroduce = request.getParameter("productIntroduce");
		String productInfo = request.getParameter("WriteContent");
		String memo = request.getParameter("memo");
		String productState = request.getParameter("productstate");
		String optionList = request.getParameter("optionList");
		String infoList = request.getParameter("infoList");
		Goods goods = gaService.getGodName(godName);
		if(goods != null){
			return "nameoverlap";
		}
		String indexFile = "";
		String mainFile ="";
		productInfo.trim();
		String userId = (String)request.getSession().getAttribute("admin");
		List<String> files = new ArrayList<String>();
		List<String> repreFiles = new ArrayList<String>();
		Calendar calendar = Calendar.getInstance();
        java.util.Date date = calendar.getTime();
		String today = (new SimpleDateFormat("yyyyMMddHHmmss").format(date));
		String dir = request.getServletContext().getRealPath("/upload");
		String fullName = "";
		Iterator<String> itr = request.getFileNames();
		int idx = 1;
		while(itr.hasNext()){
			String uploadFile = itr.next();
			MultipartFile file = request.getFile(uploadFile);
			String fileName = file.getOriginalFilename();
			if(!fileName.equals("")){
				fullName = fileName + userId+ today + idx + ".jpg";
				files.add(fullName);
				save(dir + "/" + fullName,file);
			}
			idx++;
		}
		for(int i = 0 ; i < files.size() ; i++){
			if(i == 0){
				indexFile = files.get(i);
			}else if(i == files.size()-1){
				mainFile = files.get(i);
			}else{
				repreFiles.add(files.get(i));
			}
		}
		Goods god = new Goods(Integer.valueOf(normalPrice),Integer.valueOf(sellingPrice),mainFile,indexFile,Integer.valueOf(godStock),Integer.valueOf(godSellingLimit),godName,productState,Integer.valueOf(category),productInfo,memo,goodsIntroduce);
		gaService.insertGoods(god);
		String godNum = String.valueOf(god.getGodNum());
		List<String> num = new ArrayList<>();
		num.add(godNum);
		HashMap<String,List<String>> godSub = new HashMap<>();
		godSub.put("num", num);
		godSub.put("img", repreFiles);
		gaService.insertGoodsSub(godSub);
		List<GoodsOption> optionArray = new ArrayList<>();
		List<GoodsIntroduce> giArray = new ArrayList<>();
		HashMap<String,List<GoodsOption>> go = new HashMap<>(); 
		HashMap<String,List<GoodsIntroduce>> intro = new HashMap<>();
		int k = 0;
		GoodsOption ol = new GoodsOption();
		GoodsIntroduce gi = new GoodsIntroduce();
		StringTokenizer st1 = new StringTokenizer(optionList,"$$%");
		StringTokenizer st2 = new StringTokenizer(infoList,"$$%");
			while(st2.hasMoreTokens()){
				String str2 = st2.nextToken();
				StringTokenizer str22 = new StringTokenizer(str2,"@^&");
				while(str22.hasMoreTokens()){
					String str222 = str22.nextToken();
					switch(k){
					case 0:	gi.setGodNum(god.getGodNum());
								gi.setItrName(str222);
								k++;
								break;
					case 1:gi.setItrContent(str222);
								k = 0;
								giArray.add(gi);
								gi = new GoodsIntroduce();
								break;
					}					
				}
			}
			if(!infoList.equals("")){
				intro.put("gi",giArray);
				gaService.insertGoodsIntroduce(intro);
			}
			while(st1.hasMoreTokens()){
				String str1 = st1.nextToken();
				StringTokenizer str11= new StringTokenizer(str1,"@^&");
				while(str11.hasMoreTokens()){
					String str111 = str11.nextToken();
					switch(k){
					case 0:	ol.setGodNum(god.getGodNum());
								ol.setOptName(str111);
								k++;
								break;
					case 1:ol.setOptContent(str111);
								k++;
								break;
					case 2:ol.setOptPrice(str111);
								k = 0;
								optionArray.add(ol);
								ol = new GoodsOption();
								break;
					}					
				}
			}
			if(!optionList.equals("")){
				go.put("ol", optionArray);
				gaService.insertGoodsOption(go);
			}
			gaService.insertGml(godNum, "상품 등록", userId);
		return "";
	}
	
	@Transactional
	public String modifyGoods(MultipartHttpServletRequest request,GoodsAdminService gaService,OrderService orderService,	String ListImageUrl,String MainImageUrl,String repreImageUrl1,String repreImageUrl2,String repreImageUrl3,String repreImageUrl4){
		String godNum = request.getParameter("godNum");
		String category = request.getParameter("category");
		String godName = request.getParameter("productName");
		String sellingPrice = request.getParameter("sellingPrice");
		String normalPrice = request.getParameter("normalPrice");
		String godSellingLimit = request.getParameter("godSellingLimit");
		String godStock = request.getParameter("godStock");
		String goodsIntroduce = request.getParameter("productIntroduce");
		String productInfo = request.getParameter("WriteContent");
		String memo = request.getParameter("memo");
		String productState = request.getParameter("productstate");
		String optionList = request.getParameter("optionList");
		String infoList = request.getParameter("infoList");
		String optionCheck  = request.getParameter("optionCheck");
		String indexFile = "";
		String mainFile ="";
		productInfo.trim();
		String userId = (String)request.getSession().getAttribute("admin");
		Goods god = orderService.getGod(godName);
		if(god != null){
			if(god.getGodNum() != Integer.valueOf(godNum)){
				return "nameoverlap";
			}
		}
		List<String> files = new ArrayList<String>();
		List<String> repreFiles = new ArrayList<String>();
		Calendar calendar = Calendar.getInstance();
        java.util.Date date = calendar.getTime();
		String today = (new SimpleDateFormat("yyyyMMddHHmmss").format(date));
		String dir = request.getServletContext().getRealPath("/upload");
		String fullName = "";
		Iterator<String> itr = request.getFileNames();
		String filePath;
		List<String> imgLink = new ArrayList<>();
		Goods gooo = gaService.getGodDetail(godNum);
        Pattern pattern = Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>"); //img 태그 src 추출 정규표현식
        Matcher matcher = pattern.matcher(gooo.getGodDetailInfo());
        while(matcher.find()){
        	String [] value = matcher.group(1).split("/shoppingmall/upload");
                if(productInfo.contains(value[1])){

                }else{
                	String root = dir+value[1];
                	File f = new File(root);
                    if (f.isFile()) {
                    	f.delete();
                      }
                }    		
        }
		File f;
		int idx = 1;
		while(itr.hasNext()){
			String uploadFile = itr.next();
			MultipartFile file = request.getFile(uploadFile);
			String fileName = file.getOriginalFilename();
			if(!fileName.equals("")){
				switch(idx){
				case 1:filePath = dir + "/" + ListImageUrl;
						  f = new File(filePath);
						 if(f.exists()){
							f.delete();
						}
						 break;
				case 2:filePath = dir + "/" + repreImageUrl1;
						  f = new File(filePath);
						 if(f.exists()){
							f.delete();
						}
				 break;
				case 3:filePath = dir + "/" + repreImageUrl2;
						  f = new File(filePath);
						 if(f.exists()){
							f.delete();
						}
				 break;
				case 4:filePath = dir + "/" + repreImageUrl3;
						  f = new File(filePath);
						 if(f.exists()){
							f.delete();
						}
				 break;
				case 5:filePath = dir + "/" + repreImageUrl4;
				  f = new File(filePath);
				 if(f.exists()){
					f.delete();
				}
				 break;
				case 6:filePath = dir + "/" + MainImageUrl;
				  f = new File(filePath);
				 if(f.exists()){
					f.delete();
				}
				 break;
				}
				fullName = fileName + userId+ today + idx + ".jpg";
				files.add(fullName);
				save(dir + "/" + fullName,file);
			}else{
				files.add("");
			}
			idx++;
		}
		for(int i = 0 ; i < files.size() ; i++){
			if(i == 0){
				indexFile = files.get(i);
			}else if(i == files.size()-1){
				mainFile = files.get(i);
			}else{
				if(!files.get(i).equals("")){
					repreFiles.add(files.get(i));
				}else{
					switch(i){
					case 1:repreFiles.add(repreImageUrl1);
							 break;
					case 2:repreFiles.add(repreImageUrl2);
					  		 break;
					case 3:repreFiles.add(repreImageUrl3);
					  		 break;
					case 4:repreFiles.add(repreImageUrl4);
					  		 break;
					}
				}
			}
		}
		
		for(int i = 3 ; i > 0 ; i--){
			if(repreFiles.get(i).equals("")){
				repreFiles.remove(i);
			}
		}
		if(mainFile.equals("")){
			mainFile = MainImageUrl;
		}
		if(indexFile.equals("")){
			indexFile = ListImageUrl;
		}
		Goods goods = new Goods(Integer.valueOf(godNum),Integer.valueOf(normalPrice),Integer.valueOf(sellingPrice),mainFile,indexFile,Integer.valueOf(godStock),Integer.valueOf(godSellingLimit),godName,productState,Integer.valueOf(category),productInfo,memo,goodsIntroduce);
		gaService.updateGoods(goods);
		gaService.insertGml(godNum, "상품 수정", userId);
		gaService.deleteGoodsSub(Integer.valueOf(godNum));
		List<String> num = new ArrayList<>();
		num.add(godNum);
		HashMap<String,List<String>> godSub = new HashMap<>();
		godSub.put("num", num);
		godSub.put("img", repreFiles);
		gaService.insertGoodsSub(godSub);
		List<GoodsOption> optionArray = new ArrayList<>();
		List<GoodsIntroduce> giArray = new ArrayList<>();
		HashMap<String,List<GoodsOption>> go = new HashMap<>(); 
		HashMap<String,List<GoodsIntroduce>> intro = new HashMap<>();
		int k = 0;
		GoodsOption ol = new GoodsOption();
		GoodsIntroduce gi = new GoodsIntroduce();
		StringTokenizer st1 = new StringTokenizer(optionList,"$$%");
		StringTokenizer st2 = new StringTokenizer(infoList,"$$%");
		gaService.deleteGoodsIntroduce(Integer.valueOf(godNum));
			while(st2.hasMoreTokens()){
				String str2 = st2.nextToken();
				StringTokenizer str22 = new StringTokenizer(str2,"@^&");
				while(str22.hasMoreTokens()){
					String str222 = str22.nextToken();
					switch(k){
					case 0:	gi.setGodNum(Integer.valueOf(godNum));
								gi.setItrName(str222);
								k++;
								break;
					case 1:gi.setItrContent(str222);
								k = 0;
								giArray.add(gi);
								gi = new GoodsIntroduce();
								break;
					}					
				}
			}
			if(!infoList.equals("")){
				intro.put("gi",giArray);
				gaService.insertGoodsIntroduce(intro);
			}
		if(optionCheck.equals("사용")){
			gaService.deleteGoodsOption(Integer.valueOf(godNum));
				while(st1.hasMoreTokens()){
					String str1 = st1.nextToken();
					StringTokenizer str11= new StringTokenizer(str1,"@^&");
					while(str11.hasMoreTokens()){
						String str111 = str11.nextToken();
						switch(k){
						case 0:	ol.setGodNum(Integer.valueOf(godNum));
									ol.setOptName(str111);
									k++;
									break;
						case 1:ol.setOptContent(str111);
									k++;
									break;
						case 2:ol.setOptPrice(str111);
									k = 0;
									optionArray.add(ol);
									ol = new GoodsOption();
									break;
						}					
					}
				}
				if(!optionList.equals("")){
					go.put("ol", optionArray);
					gaService.insertGoodsOption(go);
				}	
		}
		return "";		
	}
	
	private void save(String fileFullName,MultipartFile uploadFile){
		try{
			uploadFile.transferTo(new File(fileFullName));
		}catch(IOException e){
			e.printStackTrace();
		}
	}
	
	public Goods getGodName(String godName){
		return gaDao.getGodName(godName);
	}
}
