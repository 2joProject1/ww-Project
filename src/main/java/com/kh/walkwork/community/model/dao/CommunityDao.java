package com.kh.walkwork.community.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.walkwork.common.model.vo.PageInfo;
import com.kh.walkwork.common.model.vo.Attachment;
import com.kh.walkwork.community.model.vo.BoardGood;
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
	
	public int selectListCount(SqlSessionTemplate sqlSession, String search) {
		return sqlSession.selectOne("communityMapper.selectListCount", search);
	}

	public ArrayList<Community> selectList(SqlSessionTemplate sqlSession, PageInfo pi, String search) {

		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();

		RowBounds rowBounds = new RowBounds(offset, limit);

		return (ArrayList) sqlSession.selectList("communityMapper.selectCommunity", search, rowBounds);
	}
	
	
	public ArrayList<Community> selectMyCommunity(SqlSessionTemplate sqlSession, PageInfo pi, Community c) {

		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();

		RowBounds rowBounds = new RowBounds(offset, limit);

		return (ArrayList) sqlSession.selectList("communityMapper.selectMyCommunity", c, rowBounds);
	}
	
	public ArrayList<Community> selectTopCm (SqlSessionTemplate sqlSession){
		
		return (ArrayList) sqlSession.selectList("communityMapper.selectTopCm");
	}
	
	public  ArrayList<Attachment> selectViewAtt(SqlSessionTemplate sqlSession){
		 return (ArrayList) sqlSession.selectList("communityMapper.selectViewAtt");
	}
	
	public  ArrayList<Attachment> selectboardAtt(SqlSessionTemplate sqlSession,  int[] listNo){
		 HashMap<String, Object> map = new HashMap<String, Object>();
		 map.put("listNo", listNo);
		 return (ArrayList) sqlSession.selectList("communityMapper.selectboardAtt", map);
	}
	
	
	public Community selectDetail(SqlSessionTemplate sqlSession, int pageNo) {
		return sqlSession.selectOne("communityMapper.selectDetail", pageNo);
	}
	
	
	
	public int insertAttachment(SqlSessionTemplate sqlSession, Attachment a) {
		return sqlSession.insert("communityMapper.insertAttachment", a);
	}
	public int deleteAttachment(SqlSessionTemplate sqlSession,String[] c) {	
		return sqlSession.delete("communityMapper.deleteAttachment", c);
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
	
	public int deleteReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.delete("communityMapper.deleteReply", r);
	}
	
	public int replyCnt(SqlSessionTemplate sqlSession,int bno) {
		return sqlSession.delete("communityMapper.replyCnt", bno);
	}
	public int thumbsPlus(SqlSessionTemplate sqlSession,Community c) {
		int result = sqlSession.update("communityMapper.thumbsPlus", c);
		return result;
	}
	public int thumbsMinus(SqlSessionTemplate sqlSession,Community c) {
		
		return sqlSession.update("communityMapper.thumbsMinus", c);
	}
	
	
	public int insertThumbsGood(SqlSessionTemplate sqlSession,BoardGood g) {
			
		return sqlSession.insert("communityMapper.insertThumbsGood", g);
	}
	
	public int deleteThumbsGood(SqlSessionTemplate sqlSession,BoardGood g) {
			
		return sqlSession.delete("communityMapper.deleteThumbsGood", g);
	}
	
	public int selectThumbsGood(SqlSessionTemplate sqlSession,BoardGood g) {
		
		return sqlSession.selectOne("communityMapper.selectThumbsGood", g);
	}
	
	
}
