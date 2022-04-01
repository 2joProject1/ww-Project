package com.kh.walkwork.dayOff.model.dao;

import java.util.ArrayList;
import java.util.List;

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

	public int searchCountOff(SqlSessionTemplate sqlSession, DayOff off) {
		return sqlSession.selectOne("offMapper.searchCountOff", off);
	}

	public ArrayList<DayOff> searchListOff(SqlSessionTemplate sqlSession, DayOff off, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("offMapper.searchListOff", off, rowBounds);
	}

	public int adminSelectCountOff(SqlSessionTemplate sqlSession, int deptNo) {
		return sqlSession.selectOne("offMapper.adminSelectCountOff", deptNo);
	}
	
	public ArrayList<DayOff> adminSelectListOff(SqlSessionTemplate sqlSession, int deptNo, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("offMapper.adminSelectListOff", deptNo, rowBounds);
	}

	public int adminApprovalOff(SqlSessionTemplate sqlSession, DayOff off) {
		return sqlSession.update("offMapper.adminApprovalOff",off);
	}

	public ArrayList<DayOff> adminSearchListOff(SqlSessionTemplate sqlSession, DayOff off, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("offMapper.adminSearchListOff", off, rowBounds);
	}

	public int adminSearchCountOff(SqlSessionTemplate sqlSession, DayOff off) {
		return sqlSession.update("offMapper.adminSearchCountOff",off);
	}

	public List<Object> selectDto(SqlSessionTemplate sqlSession, int memberNo) {
		return sqlSession.selectList("offMapper.selectDto", memberNo);
	}

	public List<Object> adminSelectDto(SqlSessionTemplate sqlSession, int deptNo) {
		return sqlSession.selectList("offMapper.adminSelectDto", deptNo);
	}
	

}
