
package org.won.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.won.domain.CartVO;
import org.won.domain.OrderVO;
import org.won.persistence.OrderDAO;

@Service
public class OrderServiceImpl implements OrderService {

	@Inject
	private OrderDAO dao;

	@Override
	public List<OrderVO> adminOrderRead(String amdinid) throws Exception {

		return dao.adminOrderRead(amdinid);
	}

	@Override
	public void adminOrderUpdate(int odno) throws Exception {

		dao.adminOrderUpdate(odno);
	}

	@Override
	public List<OrderVO> adminOrderList(String adminid) throws Exception {
		// TODO Auto-generated method stub
		return dao.adminOrderList(adminid);
	}

	@Override
	public List<OrderVO> adminOrderMoreList(OrderVO vo) throws Exception {

		return dao.adminOrderMoreList(vo);
	}

	@Override
	public List<CartVO> cartList(CartVO vo) throws Exception {

		return dao.cartList(vo);
	}

	@Override
	public void cartDelete(int cno) throws Exception {

		dao.cartDelete(cno);

	}

	@Override
	public void cartAdd(CartVO vo) throws Exception {
		dao.cartAdd(vo);

	}

	@Override
	@Transactional
	public void memberOrderWrite(OrderVO vo) throws Exception {
		dao.memberOrderWrite(vo);
		for (int i = 0; i < vo.getList().size(); i++) {

			dao.memberOrderWriteDetail(vo.getList().get(i));
			if (vo.getList().get(i).getCno() != 0) {
				
				System.out.println(vo.getList().get(i).getCno());
				dao.cartDelete(vo.getList().get(i).getCno());
			}

		}

	}

	@Override
	public List<OrderVO> memberOrderList(OrderVO vo) throws Exception {

		return dao.memberOrderList(vo);
	}

	@Override
	public void memberOrderUpdate(int odno) throws Exception {
		
		dao.memberOrderUpdate(odno);
		
	}

}