
package org.won.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.won.domain.CartVO;
import org.won.domain.OrderVO;

@Repository
public class OrderDAOImpl implements OrderDAO {

	@Inject
	protected SqlSession sqlSession;

	protected String NAME = "org.won.dao.OrderMapper";

	@Override
	public List<OrderVO> adminOrderRead(String adminid) throws Exception {

		return sqlSession.selectList(NAME + ".adminOrderView", adminid);

	}

	@Override
	public void adminOrderUpdate(int odno) throws Exception {

		sqlSession.update(NAME + ".adminOrderUpdate", odno);

	}

	@Override
	public List<OrderVO> adminOrderList(String adminid) throws Exception {

		return sqlSession.selectList(NAME + ".adminOrderList", adminid);
	}

	@Override
	public List<OrderVO> adminOrderMoreList(OrderVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAME + ".adminOrderMoreList", vo);
	}

	@Override
	public List<CartVO> cartList(CartVO vo) throws Exception {

		return sqlSession.selectList(NAME + ".cartList", vo);
	}

	@Override
	public void cartDelete(int cno) throws Exception {
		sqlSession.delete(NAME+".cartDelete",cno);
		
	}

	@Override
	public void cartAdd(CartVO vo) throws Exception {
		sqlSession.insert(NAME + ".cartAdd",vo);
		
	}

	@Override
	public void memberOrderWrite(OrderVO vo) throws Exception {
		sqlSession.insert(NAME+".memberOrderWrite",vo);
	}

	@Override
	public void memberOrderWriteDetail(OrderVO vo) throws Exception {
		sqlSession.insert(NAME+".memberOrderWriteDetail",vo);
		
	}

	@Override
	public List<OrderVO> memberOrderList(OrderVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAME+".memberOrderList",vo);
	}

	@Override
	public void memberOrderUpdate(int odno) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update(NAME + ".memberOrderUpdate", odno);
	}

}