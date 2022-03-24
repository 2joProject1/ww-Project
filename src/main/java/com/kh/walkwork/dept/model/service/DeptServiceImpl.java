package com.kh.walkwork.dept.model.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.walkwork.dept.model.dao.DeptDao;
import com.kh.walkwork.dept.model.vo.Dept;
import com.kh.walkwork.member.model.vo.Member;

@Service("deptServ")
public class DeptServiceImpl implements DeptService{

	@Autowired
	private DeptDao deptDao;

	
	@Override
	public int listCount(String cno) {
		return deptDao.listCount(cno);
	}
	
	@Override
	public List<Dept> selectDept(String cno) {
		return deptDao.selectDept(cno);
	}
	
	@Override
	public int searchlistCount() {
		return deptDao.searchlistCount();
	}
	
	@Override
	public List<Dept> searchDept(String keyword) {  
		return deptDao.searchDept(keyword);
	}
	
	@Override
	public int insertDept(Dept d) {  
		return deptDao.insertDept(d);
	}
	
	@Override
	public int deleteDept(HashMap<String, String> paramMap2) {  
		
		
		int rs = deptDao.deleteDept(paramMap2);
		return rs;
		
	}
	
	@Override
	public Dept selectDtOne(String deptNo){
		return deptDao.selectDtOne(deptNo);
		
	}
	
	public int updateDept(List<Member> list) { 
		int rs = 0;
		for(int i = 0; i < list.size(); i++) {
			 rs += deptDao.updateDept(list.get(i));
		}
		System.out.println(rs + "행이 업데이트됨");
		return rs;
	}



}