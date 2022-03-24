package com.kh.walkwork.dept.model.service;

import java.util.HashMap;
import java.util.List;

import com.kh.walkwork.dept.model.vo.Dept;
import com.kh.walkwork.member.model.vo.Member;

public interface DeptService {

	
	public int listCount(String cno);
	
	public List<Dept> selectDept(String cno);

	public int searchlistCount();
	
	public List<Dept> searchDept(String keyword);  
	
	public Dept selectDtOne(String deptNo);

	public int insertDept(Dept d);
	
	public int deleteDept(HashMap<String, String> paramMap2); 
	
	public int updateDept(List<Member> list);
	
}
