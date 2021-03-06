package com.star.cinema.member.config;

public class PageConfig {
	public static int[] setPage(int totalCount, int currentPage) {
		int pageBlock = 10;			// 한 페이지당 10개씩 
		int end = currentPage * pageBlock;
		int begin = end + 1 - pageBlock;
		
		int[] page = {begin, end, pageBlock, totalCount};
		
		return page;
	}
	
	public static String getNavi(int currentPage, int pageBlock, int totalPage, String url) {
		int blockCnt = totalPage / pageBlock;
		if(totalPage % pageBlock > 0)
			blockCnt++;
		String result = "";
		if(currentPage != 1)
			result += "<a href='"+url+(currentPage-1)+"'> [이전] </a>";
		
		for(int i=1;i<=blockCnt;i++) {
			if(currentPage == i) result += "<b>";
			result+="<a href='"+url+i+"'>"+i+"</a>";
			if(currentPage == i) result += "</b>";
		}
		if(currentPage != blockCnt)
			result += "<a href='"+url+(currentPage+1)+"'> [다음] </a>";
		return result;
	}
}
