package com.kh.walkwork.dept.model.vo;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Component
public class Dept {

	private int deptNo;//DEPT_NO
	private String deptName;//DEPT_NAME
	
}
