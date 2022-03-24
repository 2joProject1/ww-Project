package com.kh.walkwork.chatMember.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class ChatMemberDao {

	public int insertChatMember(SqlSession sqlSession, HashMap<String, Object> map) {
		return sqlSession.insert("chatMemberMapper.insertChatMember", map);
	}

	public ArrayList<String> searchChatNo(SqlSession sqlSession, HashMap map) {
		return (ArrayList)sqlSession.selectList("chatMemberMapper.searchChatNo", map);
	}

}
