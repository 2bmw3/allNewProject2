package org.won.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.won.domain.EphotosVO;

@Repository
public class EditorDAOImpl implements EditorDAO {

   @Inject
   protected SqlSession sqlSession;

   protected String NAME = "org.won.dao.EditorMapper";

   @Override
   public void ephotoWrite(String fileName) throws Exception {
      sqlSession.insert(NAME + ".ephotoWrite", fileName );
   }

   @Override
   public void ephotoUpdate(EphotosVO evo) throws Exception {

      sqlSession.update(NAME + ".ephotoUpdate", evo);
   }

   @Override
   public List<EphotosVO> ephotoRead() throws Exception {
      return sqlSession.selectList(NAME + ".ephotoRead");
   }

   @Override
   public void ephotoDelete() throws Exception {
      sqlSession.delete(NAME + ".ephotoDelete");
   }

   @Override
   public void ephotoPnoDelete(int pno) throws Exception {
      sqlSession.delete(NAME + ".ephotoPnoDelete", pno);
   }

   

}