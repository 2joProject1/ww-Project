package com.kh.walkwork.commute.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.walkwork.common.model.vo.PageInfo;
import com.kh.walkwork.commute.model.vo.Commute;

@Repository
public class CommuteDao {

	public int insertCommute(SqlSessionTemplate sqlSession, Commute commute) {
		return sqlSession.insert("commuteMapper.insertCommute", commute);
	}

	public int checkCommute(SqlSessionTemplate sqlSession, Commute commute) {
		return sqlSession.selectOne("commuteMapper.checkCommute", commute);
	}

	public int checkEnd(SqlSessionTemplate sqlSession, Commute commute) {
		return sqlSession.selectOne("commuteMapper.checkEnd", commute);
	}

	public int checkLate(SqlSessionTemplate sqlSession, Commute commute) {
		return sqlSession.selectOne("commuteMapper.checkLate", commute);
	}

	public int updateCommute(SqlSessionTemplate sqlSession, Commute commute) {
		return sqlSession.update("commuteMapper.updateCommute", commute);
	}

	public ArrayList<Commute> selectListCommute(SqlSessionTemplate sqlSession, Commute commute, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("commuteMapper.selectListCommute", commute, rowBounds);
	}

	public int selectListCount(SqlSessionTemplate sqlSession, Commute commute) {
		return sqlSession.selectOne("commuteMapper.selectListCount", commute);
	}

	public ArrayList<Commute> selectMonthList(SqlSessionTemplate sqlSession, Commute commute) {
		return (ArrayList)sqlSession.selectList("commuteMapper.selectMonthList", commute);
	}

	public int selectMonthCount(SqlSessionTemplate sqlSession, Commute commute) {
		return sqlSession.selectOne("commuteMapper.selectMonthCount", commute);
	}

}
