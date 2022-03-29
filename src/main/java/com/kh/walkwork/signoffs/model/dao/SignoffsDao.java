package com.kh.walkwork.signoffs.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.walkwork.dept.model.vo.Dept;
import com.kh.walkwork.signoffs.model.vo.Signoffs;
import com.kh.walkwork.signoffs.model.vo.SignoffsDept;

@Repository
public class SignoffsDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public Signoffs selectSignoffsOne(Signoffs vo) {
		return sqlSession.selectOne("signoffsMapper.selectSignoffsOne", vo);
	}

	public List<Signoffs> selectSignoffsList(Signoffs vo) {
		return sqlSession.selectList("signoffsMapper.selectSignoffsList", vo);
	}

	public int updateSignoffs(Signoffs vo) {
		return sqlSession.update("signoffsMapper.updateSignoffs", vo);
	}

	public int deleteSignoffs(Signoffs vo) {
		return sqlSession.delete("signoffsMapper.deleteSignoffs", vo);
	}

	public int insertSignoffs(Signoffs vo) {
		return sqlSession.insert("signoffsMapper.insertSignoffs", vo);
	}

	public Dept getSignoffsDept(String docuNo) {
		return sqlSession.selectOne("signoffsMapper.getSignoffsDept", docuNo);
	}

	public int insertSignoffsDept(SignoffsDept vo) {
		return sqlSession.insert("signoffsMapper.insertSignoffsDept", vo);
	}

	public Dept getDept(String deptNo) {
		return sqlSession.selectOne("signoffsMapper.getDept", deptNo);
	}

	public String getLatestApprovalNo(Signoffs s) {
		return sqlSession.selectOne("signoffsMapper.getLatestApprovalNo", s);
	}
}
