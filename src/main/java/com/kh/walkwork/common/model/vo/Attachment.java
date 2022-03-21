package com.kh.walkwork.common.model.vo;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
public class Attachment {

	private String fileName;
	private int boardNo;
	private String memberNo;
	private String docuNo;
	private String fileOriginName;
	private String filePath;
	private String fileSize;
	private Date fileUploadDate;
	
}
