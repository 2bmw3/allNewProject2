package org.won.util;

public class PageingUtil {
	
	private int maxmumPage, minimumPage,nextPage,prevPage,total,currentPage;
	
	public PageingUtil(int totalData,int currentPage){
		this.currentPage = currentPage;
		total =  (int)(Math.ceil((double)totalData/(double)9)); //숫자 9는 몇개씩 뿌려줄것인지를 정해줌
		int currentMax = (int)(Math.floor((currentPage-1)/5)+1) *5;
		
		minimumPage = currentMax - 4;
		prevPage = (currentMax>5)?1:0;
		if(currentMax >= total){
			nextPage = 0;
			maxmumPage = total;
		}else{
			nextPage = 1;
			maxmumPage = currentMax;
		}
	}//end PageingUtil
	

	@Override
	public String toString() {
		return "PageingUtil [maxmumPage=" + maxmumPage + ", minimumPage=" + minimumPage + ", nextPage=" + nextPage
				+ ", prevPage=" + prevPage + ", total=" + total + "]";
	}


	public int getMaxmumPage() {
		return maxmumPage;
	}

	public void setMaxmumPage(int maxmumPage) {
		this.maxmumPage = maxmumPage;
	}

	public int getMinimumPage() {
		return minimumPage;
	}

	public void setMinimumPage(int minimumPage) {
		this.minimumPage = minimumPage;
	}

	public int getNextPage() {
		return nextPage;
	}

	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}

	public int getPrevPage() {
		return prevPage;
	}

	public void setPrevPage(int prevPage) {
		this.prevPage = prevPage;
	}

	public int getTotalData() {
		return total;
	}

	public void setTotalData(int total) {
		this.total = total;
	}


	public int getCurrentPage() {
		return currentPage;
	}


	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	
}