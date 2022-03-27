package com.kh.walkwork.notice.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.walkwork.common.model.vo.Attachment;
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

	
	//상세조회
	public Notice selectNotice(SqlSessionTemplate sqlSession, Notice n) {

				
		return sqlSession.selectOne("noticeMapper.selectNotice", n);

	}
	
	//상세조회 파일가져오기
	public ArrayList<Attachment> selectFile(SqlSessionTemplate sqlSession, Notice n) {
		return (ArrayList)sqlSession.selectList("noticeMapper.selectFile", n);
	}
	
	

	public Notice insertNotice(SqlSessionTemplate sqlSession, Notice n) {
		System.out.println(n.getTopFix());
		int result = sqlSession.insert("noticeMapper.insertNotice", n);
		
		return sqlSession.selectOne("noticeMapper.selectBoardNo", n);
	}
 
	public int deleteNoitce(SqlSessionTemplate sqlSession, Notice n) {

		return sqlSession.delete("noticeMapper.deleteNotice", n);
	}

	public int updateNotice(SqlSessionTemplate sqlSession, Notice n) {
		return sqlSession.update("noticeMapper.updateNotice", n);
	}

	public ArrayList<Notice> rangeNotice(SqlSessionTemplate sqlSession, String noticeRange, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		
		return (ArrayList)sqlSession.selectList("noticeMapper.rangeNotice", noticeRange, rowBounds); 
	}

	public int selectRangeListCount(SqlSessionTemplate sqlSession, String noticeRange) {
		return sqlSession.selectOne("noticeMapper.selectRangeListCount", noticeRange);
	}

	public ArrayList<Notice> selectTopList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("noticeMapper.selectTopList");
	}

	
	//메인
	public ArrayList<Notice> selectNoticeList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("noticeMapper.selectMainList");
	}



 
} 

 


