package com.kh.walkwork.dayOff.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.walkwork.common.model.vo.PageInfo;
import com.kh.walkwork.dayOff.model.vo.DayOff;

@Repository
public class DayOffDao {

	public int insertOff(SqlSessionTemplate sqlSession, DayOff off) {
		return sqlSession.insert("offMapper.insertOff", off);
	}

	public int selectCountOff(SqlSessionTemplate sqlSession, String offWriter) {
		return sqlSession.selectOne("offMapper.selectCountOff", offWriter);
	}

	public ArrayList<DayOff> selectListOff(SqlSessionTemplate sqlSession, String offWriter, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("offMapper.selectListOff", offWriter, rowBounds);
	}
	
	

}
