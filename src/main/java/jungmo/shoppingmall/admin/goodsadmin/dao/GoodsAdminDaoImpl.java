package jungmo.shoppingmall.admin.goodsadmin.dao;

import jungmo.shoppingmall.admin.goodsadmin.dao.mapper.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Repository
public class GoodsAdminDaoImpl implements GoodsAdminDao{
	@Autowired private GoodsAdminMapper gaMapper;
}
