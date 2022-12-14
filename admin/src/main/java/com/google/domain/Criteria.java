package com.google.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {
	private int pageNum; //현재페이지
	private int amount;	//보여줄 게시글 수
	
	private String type;
	private String keyword;
	
	public Criteria() {
		super();
		// 디폴트 값
		this.pageNum = 1;
		this.amount = 10;
	}
	public Criteria(int pageNum, int amount) {
		super();
		//값을 전달 받았을 때
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	public int getSkip() {
		return (this.pageNum-1) * this.amount;
		//getskip메소드
	}
	
	public String[] getTypeArr() {
		return type == null? new String[] {}: type.split("");
	}
	
	/**
	 * 글 삭제시 현재 페이지 및 검색어 유지
	 * 
	 */
	public String getListLink() {
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("pageNum", this.getPageNum())
				.queryParam("amount", this.getAmount())
				.queryParam("type", this.getType())
				.queryParam("keyword", this.getKeyword());
		
		return builder.toUriString();
	}
	
}
