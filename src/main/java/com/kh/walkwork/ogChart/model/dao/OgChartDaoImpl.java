package com.kh.walkwork.ogChart.model.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.walkwork.member.model.vo.Member;
import com.kh.walkwork.ogChart.model.dao.OgChartDao;

@Repository
public class OgChartDaoImpl implements OgChartDao{

	
	@Inject
	private SqlSession session;

	private static String namespace = "com.kh.walkwork.ogChart-mapper";

	@Override
	public List officerList(Map param) throws Exception {
		return session.selectList(namespace + ".officerList", param);
	}
	
	@Override
	public int officerListCount(Map param) throws Exception {
		return session.selectOne(namespace + ".officerListCount", param);
	}

	@Override
	public List selectMember() throws Exception {
		return session.selectList(namespace + ".selectMember");
	}

	//@Override
	//public List selectAdmn_Tb() throws Exception {
		//return session.selectList(namespace + ".selectAdmn_Tb");
	//}

	@Override
	public List selectRank() throws Exception {
		return session.selectList(namespace + ".selectRank");
	}

	@Override
	public List selectDept() throws Exception {
		return session.selectList(namespace + ".selectDept");
	}
	
	@Override
	public int selectMemberNo(Map params) throws Exception {
		return session.selectOne(namespace + ".selectMemberNo", params);
	}

	@Override
	public void officerInsert(Member vo) throws Exception {
		session.insert(namespace + ".officerInsert", vo);
	}

	@Override
	public Map<String, Object> selectUpdateOfficer(Map params) throws Exception {
		return session.selectOne(namespace + ".selectUpdateOfficer", params);
	}
	
	@Override
	public int officerUpdate(Member vo) throws Exception {
		return session.update(namespace + ".officerUpdate", vo);
	}

	@Override
	public int deptInsert(Map params) throws Exception {
		return session.insert(namespace + ".deptInsert", params);
	}
	
	@Override
	public int selectDeptName(Map params) throws Exception {
		return session.selectOne(namespace + ".selectDeptName", params);
	}

	@Override
	public int deptUpdate(Map params) throws Exception {
		return session.update(namespace + ".deptUpdate", params);
	}

	@Override
	public int deptDelete(Map params) throws Exception {
		return session.delete(namespace + ".deptDelete", params);
	}
}
