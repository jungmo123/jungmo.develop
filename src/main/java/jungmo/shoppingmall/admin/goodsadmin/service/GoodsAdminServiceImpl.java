package jungmo.shoppingmall.admin.goodsadmin.service;

import jungmo.shoppingmall.admin.goodsadmin.dao.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Service
public class GoodsAdminServiceImpl implements GoodsAdminService{
	@Autowired private GoodsAdminDao gaDao;
}
