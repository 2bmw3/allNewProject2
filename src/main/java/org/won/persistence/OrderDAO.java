package org.won.persistence;

import java.util.List;

import org.won.domain.CartVO;
import org.won.domain.OrderVO;

public interface OrderDAO {

	public List<OrderVO> adminOrderRead(String adminid) throws Exception;

	public void adminOrderUpdate(int odno) throws Exception;

	public List<OrderVO> adminOrderList(String adminid) throws Exception;

	public List<OrderVO> adminOrderMoreList(OrderVO vo) throws Exception;

	public List<CartVO> cartList(CartVO vo) throws Exception;

	public void cartDelete(int cno) throws Exception;

	public void cartAdd(CartVO vo) throws Exception;

	public void memberOrderWrite(OrderVO vo) throws Exception;

	public void memberOrderWriteDetail(OrderVO vo) throws Exception;

	public List<OrderVO> memberOrderList(OrderVO vo) throws Exception;

	public void memberOrderUpdate(int odno) throws Exception;

}