package com.google.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReportVO {
	private long bno;
	private String content;
	private String note;
	private String suggestion;
	private String writer;
	private Date regdate;
	private Date updatedate;
	private int hit;
}
