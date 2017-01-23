package org.won.domain;

import java.util.List;

import org.springframework.stereotype.Repository;

public class PinfoVO {

	private int pino;
	private int pno;
	private String picolor, pisize;
	private int pistock;
	private List<PinfoVO> list;

	public int getPino() {
		return pino;
	}

	public void setPino(int pino) {
		this.pino = pino;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public String getPicolor() {
		return picolor;
	}

	public void setPicolor(String picolor) {
		this.picolor = picolor;
	}

	public String getPisize() {
		return pisize;
	}

	public void setPisize(String pisize) {
		this.pisize = pisize;
	}

	public int getPistock() {
		return pistock;
	}

	public void setPistock(int pistock) {
		this.pistock = pistock;
	}

	public List<PinfoVO> getList() {
		return list;
	}

	public void setList(List<PinfoVO> list) {
		this.list = list;
	}

	@Override
	public String toString() {
		return "PinfoVO [pino=" + pino + ", pno=" + pno + ", picolor=" + picolor + ", pisize=" + pisize + ", pistock="
				+ pistock + ", list=" + list + "]";
	}


}
