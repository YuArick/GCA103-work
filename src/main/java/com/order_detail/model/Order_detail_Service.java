package com.order_detail.model;

import java.util.List;

public class Order_detail_Service {
	
	private Order_detail_DAO_interface dao;
	
	public Order_detail_Service() {
		dao = new Order_detail_DAO();
	}
	
	public Order_detail_VO addOrder_detail(Integer order_no, Integer prod_no, Integer prod_qty, Integer prod_price, Integer mem_no) {
		
		Order_detail_VO order_detailVO= new Order_detail_VO();
		
		order_detailVO.setOrder_no(order_no);
		order_detailVO.setProd_no(prod_no);
		order_detailVO.setProd_qty(prod_qty);
		order_detailVO.setProd_price(prod_price);
		order_detailVO.setMem_no(mem_no);
		dao.insert(order_detailVO);
		
		return order_detailVO;		
	}
	
	public Order_detail_VO updateOrder_detail(Integer order_no, Integer prod_no, Integer prod_qty, Integer prod_price, Integer mem_no) {
		
		Order_detail_VO order_detailVO= new Order_detail_VO();
		
		order_detailVO.setOrder_no(order_no);
		order_detailVO.setProd_no(prod_no);
		order_detailVO.setProd_qty(prod_qty);
		order_detailVO.setProd_price(prod_price);
		order_detailVO.setMem_no(mem_no);
		dao.update(order_detailVO);
		
		return order_detailVO;		
	}
	
	public void deleteOrder_detail(Integer order_no, Integer prod_no) {
		dao.delete(order_no, prod_no);
	}
	
	public Order_detail_VO getOneOrder_detail(Integer order_no, Integer prod_no) {
		return dao.findByPrimaryKey(order_no, prod_no);
	}
	
	public List<Order_detail_VO> getAll() {
		return dao.getAll();
	}
}
