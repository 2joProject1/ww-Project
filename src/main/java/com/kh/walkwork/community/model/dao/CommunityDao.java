package com.kh.walkwork.community.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.walkwork.common.model.vo.PageInfo;
import com.kh.walkwork.community.model.vo.Attachment;
import com.kh.walkwork.community.model.vo.Community;
import com.kh.walkwork.community.model.vo.Reply;

@Repository
public class CommunityDao {
	public int insertCommunity(SqlSessionTemplate sqlSession, Community c) {
		return sqlSession.insert("communityMapper.insertCommunity", c);
	}
	
	public int updateCommunity(SqlSessionTemplate sqlSession, Community c) {
		return sqlSession.update("communityMapper.updateCommunity", c);
	}
	
	public int deleteCommunity(SqlSessionTemplate sqlSession, int bno) {
		return sqlSession.update("communityMapper.deleteCommunity", bno);
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
	
	public ArrayList<Community> selectTopCm (SqlSessionTemplate sqlSession){
		
		return (ArrayList) sqlSession.selectList("communityMapper.selectTopCm");
	}
	
	public  ArrayList<Attachment> selectViewAtt(SqlSessionTemplate sqlSession){
		 return (ArrayList) sqlSession.selectList("communityMapper.selectViewAtt");
	}
	
	public Community selectDetail(SqlSessionTemplate sqlSession, int pageNo) {
		return sqlSession.selectOne("communityMapper.selectDetail", pageNo);
	}
	
	
	
	public int insertAttachment(SqlSessionTemplate sqlSession, Attachment a) {
		return sqlSession.insert("communityMapper.insertAttachment", a);
	}
	
	public int lastBno(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("communityMapper.lastBno");
	}
	
	public ArrayList<Attachment> selectAttachmentDetail(SqlSessionTemplate sqlSession, int pageNo){
		return (ArrayList) sqlSession.selectList("communityMapper.selectAttachmentDetail", pageNo);
	}
	
	public int insertReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.insert("communityMapper.insertReply", r);
	}
	
	public ArrayList<Reply> selectReply(SqlSessionTemplate sqlSession, int bno){
		 return (ArrayList) sqlSession.selectList("communityMapper.selectReply", bno);
	}
	

}
