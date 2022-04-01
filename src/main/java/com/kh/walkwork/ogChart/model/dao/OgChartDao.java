package com.kh.walkwork.ogChart.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.walkwork.member.model.vo.Member;

public interface OgChartDao {

	public List officerList(Map params) throws Exception;
	public int officerListCount(Map params) throws Exception;
	
	public List selectMember() throws Exception;
	//public List selectAdmn_Tb() throws Exception;
	public List selectRank() throws Exception;
	public List selectDept() throws Exception;
	
	public int selectMemberNo(Map params) throws Exception;
	public void officerInsert(Member vo) throws Exception;
	
	public Map<String, Object> selectUpdateOfficer(Map params) throws Exception;
	public int officerUpdate(Member vo) throws Exception;
	
	public int deptInsert(Map params) throws Exception;
	public int selectDeptName(Map params) throws Exception;
	public int deptUpdate(Map params) throws Exception;
	
	public int deptDelete(Map params) throws Exception;
}
