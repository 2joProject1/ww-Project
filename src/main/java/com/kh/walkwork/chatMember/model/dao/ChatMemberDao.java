package com.kh.walkwork.chatMember.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.walkwork.chat.model.vo.Chat;

@Repository
public class ChatMemberDao {

	public int insertChatMember(SqlSession sqlSession, HashMap<String, Object> map) {
		return sqlSession.insert("chatMemberMapper.insertChatMember", map);
	}

	public ArrayList<String> searchChatNo(SqlSession sqlSession, HashMap map) {
		return (ArrayList)sqlSession.selectList("chatMemberMapper.searchChatNo", map);
	}

	public int selectChatMemberCount(SqlSession sqlSession, String a) {
		return sqlSession.selectOne("chatMemberMapper.selectChatMemberCount", a);
	}

	public ArrayList<String> selectChatMemberList(SqlSession sqlSession, String chatNo) {
		return (ArrayList)sqlSession.selectList("chatMemberMapper.selectChatMemberList", chatNo);
	}

	public ArrayList<Chat> selectMyChatList(SqlSession sqlSession, String memberNo) {
		return (ArrayList)sqlSession.selectList("chatMemberMapper.selectMyChatList", memberNo);
	}
}
