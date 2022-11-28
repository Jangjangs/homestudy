package com.google.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PageDTO {
	
	private int startPage; // 시작페이지
	private int endPage; //끝 페이지
	private boolean prev, next; //이전, 다음 여부
	
	private int total; //전체 글수
	private Criteria cri; //페이징
	
	
	public PageDTO(Criteria cri, int total ) {
		super();
		
		this.total = total;
		this.cri = cri;
		
		this.endPage = (int)(Math.ceil(cri.getPageNum()/10.0)) * 10;
		//끝 페이지 번호
		this.startPage = this.endPage - 9;
		
		int realEnd = (int)(Math.ceil((total*1.0)/cri.getAmount()));
		
		if (realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage > 1;
		//1보다 크면 true, 1 보다 같거나 작으면(이하) false
		this.next = this.endPage < realEnd;
		// 보이는 엔드페이지(endPage)가 진짜엔드페이지(realEnd)보다 크면 false 작으면 true
	}


	public PageDTO(Criteria cri) {
		super();
		this.cri = cri;
	}
	
	
}
