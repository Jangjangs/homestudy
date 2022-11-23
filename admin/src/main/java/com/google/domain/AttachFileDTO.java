package com.google.domain;

import lombok.Data;

@Data
public class AttachFileDTO {

	private String fileName; //파일명
	private String uploadPath; //업로드경로 년/월/일
	private String uuid; //UUID
	private boolean image; //그림여부
}
