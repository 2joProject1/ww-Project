package com.kh.walkwork.ogChart.model.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.walkwork.member.model.vo.Member;
import com.kh.walkwork.ogChart.model.dao.OgChartDao;
import com.kh.walkwork.ogChart.model.service.OgChartService;

@Service
public class OgChartServiceImpl implements OgChartService{

	
	@Inject
	private OgChartDao dao;

	@Override
	public List officerList(Map params) throws Exception {
		return dao.officerList(params);
	}
	
	@Override
	public int officerListCount(Map params) throws Exception {
		return dao.officerListCount(params);
	}
	
	@Override
	public List selectMember() throws Exception {
		return dao.selectMember();
	}

	//@Override
	//public List selectAdmn_Tb() throws Exception {
	//	return dao.selectAdmn_Tb();
	//}

	@Override
	public List selectRank() throws Exception {
		return dao.selectRank();
	}

	@Override
	public List selectDept() throws Exception {
		return dao.selectDept();
	}
		
	@Override
	public int selectMemberNo(Map params) throws Exception {
		return dao.selectMemberNo(params);
	}

	@Override
	public void officerInsert(Member vo) throws Exception {
		dao.officerInsert(vo);
	}

	@Override
	public Map<String, Object> selectUpdateOfficer(Map params) throws Exception {
		return dao.selectUpdateOfficer(params);
	}

	@Override
	public int officerUpdate(Member vo) throws Exception {
		return dao.officerUpdate(vo);
	}

	@Override
	public int deptInsert(Map params) throws Exception {
		return dao.deptInsert(params);
	}
	
	@Override
	public int selectDeptName(Map params) throws Exception {
		return dao.selectDeptName(params);
	}

	@Override
	public int deptUpdate(Map params) throws Exception {
		return dao.deptUpdate(params);
	}

	@Override
	public int deptDelete(Map params) throws Exception {
		return dao.deptDelete(params);
	}
	
}
