package org.won.service;

import java.util.List;

import org.won.domain.EphotosVO;

public interface EditorService {

   public void ephotoWrite(String fileName) throws Exception;
   
   public void ephotoUpdate(EphotosVO evo) throws Exception;
   
   public List<EphotosVO> ephotoRead() throws Exception;
   
}