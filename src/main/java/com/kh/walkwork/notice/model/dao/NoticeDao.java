package com.kh.walkwork.notice.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.walkwork.common.model.vo.PageInfo;
import com.kh.walkwork.notice.model.vo.Notice;

@Repository
public class NoticeDao {

	public int selectNoticeListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("noticeMapper.selectNoticeListCount");
	}

	public ArrayList<Notice> selectNoticeList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("noticeMapper.selectNoticeList", null, rowBounds);
	}

	public int increaseCount(SqlSessionTemplate sqlSession, int bno) {
		return sqlSession.update("noticeMapper.increaseCount", bno);
	}

	public ArrayList<Notice> selectNotice(SqlSessionTemplate sqlSession, Notice n) {
		
		/*
		 * ArrayList list = (ArrayList)
		 * sqlSession.selectList("noticeMapper.selectNotice", n);
		 * System.out.println(list.size()); List<Object> list2 =
		 * sqlSession.selectList("noticeMapper.selectNotice", n);
		 * System.out.println(list2.size()); for(int i = 0; i < list.size(); i++) {
		 * System.out.println(list.get(i)); } for(int i = 0; i < list2.size(); i++) {
		 * System.out.println(list2.get(i)); }
		 */
		System.out.println("디에이오임게시글ㅇㄷ"+n.getBoardNo());
		System.out.println("디에이오임누가씀"+n.getBoardWriter());
		return (ArrayList)sqlSession.selectList("noticeMapper.selectNotice", n);
	}

	public Notice insertNotice(SqlSessionTemplate sqlSession, Notice n) {
		sqlSession.insert("noticeMapper.insertNotice", n);
		return sqlSession.selectOne("noticeMapper.selectBoardNo", n);
	}
 
} 




