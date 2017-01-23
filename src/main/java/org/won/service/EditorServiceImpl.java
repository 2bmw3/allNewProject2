package org.won.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.won.domain.EphotosVO;
import org.won.persistence.EditorDAO;

@Service
public class EditorServiceImpl implements EditorService {

   @Inject
   private EditorDAO dao;

   @Override
   public void ephotoWrite(String fileName) throws Exception {
      dao.ephotoWrite(fileName);
   }

   @Override
   public void ephotoUpdate(EphotosVO evo) throws Exception {
      dao.ephotoUpdate(evo);
   }

   @Override
   public List<EphotosVO> ephotoRead() throws Exception {
      return dao.ephotoRead();
   }

   
}