package com.kh.walkwork.community.model.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Attachment {

	private String fileName;
	private int boardNo;
	private String memberNo;
	private String fileOriginName;
	private String filePath;
	private String fileSize;
	private Date fileUploadDaTE;
	
	
	
}
