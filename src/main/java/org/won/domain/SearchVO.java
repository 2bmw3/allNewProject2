package org.won.domain;

public class SearchVO {

	private int page;
	private String sType, keyword, adminid;

	public SearchVO(String sType, String keyword) {
		super();
		this.sType = sType;
		this.keyword = keyword;
	}

	
	public void setPage(int page) {
		this.page = page;
	}


	public String getAdminid() {
		return adminid;
	}

	public void setAdminid(String adminid) {
		this.adminid = adminid;
	}

	public int getPage() {
		return page;
	}

	public String getsType() {
		return sType;
	}

	public String getKeyword() {
		return  keyword;
		//"%" + keyword + "%"
	}

	@Override
	public String toString() {
		return "Search [page=" + page + ", sType=" + sType + ", keyword=" + keyword + "]";
	}

}