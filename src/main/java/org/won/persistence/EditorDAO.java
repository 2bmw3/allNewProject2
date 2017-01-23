package org.won.persistence;

import java.util.List;

import org.won.domain.EphotosVO;

public interface EditorDAO {
   
   public void ephotoWrite(String fileName) throws Exception;
   
   public void ephotoUpdate(EphotosVO evo) throws Exception;
   
   public List<EphotosVO> ephotoRead() throws Exception;
   
   public void ephotoDelete() throws Exception;
   
   public void ephotoPnoDelete(int pno) throws Exception;

}