package com.order.model;

import java.sql.Timestamp;
import java.util.List;
import java.util.Set;

import com.order_detail.model.Order_detail_VO;

public class Order_Service {
	
	private Order_DAO_interface dao;
	
	public Order_Service() {
		dao = new Order_DAO();
	}
	
	public Order_VO addOrder(Integer mem_no, Integer order_price_total, Integer dis_price_total, Integer payment_method, Integer pickup_method, Integer shipping_fee, String receiver_name, String receiver_address, String receiver_phone) {
		
		Order_VO orderVO = new Order_VO();
		
		orderVO.setMem_no(mem_no);
		orderVO.setOrder_price_total(order_price_total);
		orderVO.setDis_price_total(dis_price_total);
		orderVO.setPayment_method(payment_method);
		orderVO.setPickup_method(pickup_method);
		orderVO.setShipping_fee(shipping_fee);
		orderVO.setReceiver_name(receiver_name);
		orderVO.setReceiver_address(receiver_address);
		orderVO.setReceiver_phone(receiver_phone);
		dao.insert(orderVO);
		
		return orderVO;
	}
	
	public Order_VO updateOrder(Integer order_no, Integer mem_no, Timestamp order_time, Integer order_price_total, Integer dis_price_total, Integer order_status, Integer payment_method, Integer pickup_method, Integer shipping_fee, String receiver_name, String receiver_address, String receiver_phone) {
		
		Order_VO orderVO = new Order_VO();
		
		orderVO.setOrder_no(order_no);
		orderVO.setMem_no(mem_no);
		orderVO.setOrder_time(order_time);
		orderVO.setOrder_price_total(order_price_total);
		orderVO.setDis_price_total(dis_price_total);
		orderVO.setOrder_status(order_status);
		orderVO.setPayment_method(payment_method);
		orderVO.setPickup_method(pickup_method);
		orderVO.setShipping_fee(shipping_fee);
		orderVO.setReceiver_name(receiver_name);
		orderVO.setReceiver_address(receiver_address);
		orderVO.setReceiver_phone(receiver_phone);
		dao.update(orderVO);
		
		return orderVO;
	}
	
	public Order_VO changeStatus(Integer order_no, Integer order_status) {
		
		Order_VO orderVO = new Order_VO();
		
		orderVO.setOrder_no(order_no);
		orderVO.setOrder_status(order_status);
		dao.changeStatus(orderVO);
		
		return orderVO;
	}
	
	public void deleteOrder(Integer order_no) {
		dao.delete(order_no);
	}
	
	public Order_VO getOneOrder(Integer order_no) {
		return dao.findByPrimaryKey(order_no);
	}
	
	public List<Order_VO> getAll() {
		return dao.getAll();
	}
	
	public Set<Order_detail_VO> getOrder_detailsByOrder(Integer order_no) {
		return dao.getOrder_detailsByOrder(order_no);
	}
	
	public Set<Integer> getCreateOrder(Integer mem_no) {
		return dao.getCreateOrder(mem_no);
	}
}