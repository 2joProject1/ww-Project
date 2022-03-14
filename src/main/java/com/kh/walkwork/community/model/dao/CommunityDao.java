package com.kh.walkwork.community.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.walkwork.community.model.vo.Community;
import com.kh.walkwork.community.model.vo.PageInfo;

@Repository
public class CommunityDao {
	public int insertCommunity(SqlSessionTemplate sqlSession, Community c) {
		return sqlSession.insert("communityMapper.insertCommunity", c);
	}
	
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("communityMapper.selectListCount");
	}

	public ArrayList<Community> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {

		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();

		RowBounds rowBounds = new RowBounds(offset, limit);

		return (ArrayList) sqlSession.selectList("communityMapper.selectCommunity", null, rowBounds);
	}
}
