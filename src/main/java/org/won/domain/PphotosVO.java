package org.won.domain;

import java.util.List;

import org.springframework.stereotype.Repository;
@Repository
public class PphotosVO {

   private int pno;
   private List<String> pphoto;
   private String pphotostr;

   public int getPno() {
      return pno;
   }

   public void setPno(int pno) {
      this.pno = pno;
   }

   public List<String> getPphoto() {
      return pphoto;
   }

   public void setPphoto(List<String> pphoto) {
      this.pphoto = pphoto;
   }

   public String getPphotostr() {
      return pphotostr;
   }

   public void setPphotostr(String pphotostr) {
      this.pphotostr = pphotostr;
   }

   @Override
   public String toString() {
      return "PphotosVO [pno=" + pno + ", pphoto=" + pphoto + ", pphotostr=" + pphotostr + "]";
   }

}