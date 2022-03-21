package com.kh.walkwork.signoffs.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.walkwork.signoffs.model.vo.Signoffs;

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
}
