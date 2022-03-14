package com.kh.walkwork.dayOff.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.walkwork.common.model.vo.PageInfo;
import com.kh.walkwork.dayOff.model.vo.DayOff;
import com.kh.walkwork.dayOff.model.dao.DayOffDao;

@Service
public class DayOffServiceImpl implements DayOffService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private DayOffDao dayOffDao;

	@Override
	public int insertOff(DayOff off) {
		return dayOffDao.insertOff(sqlSession, off);
	}

	@Override
	public ArrayList<DayOff> selectListOff(String offWriter, PageInfo pi) {
		return dayOffDao.selectListOff(sqlSession, offWriter, pi);
	}

	@Override
	public ArrayList<DayOff> searchListOff(DayOff off, PageInfo pi) {
		return null;
	}

	@Override
	public int selectCountOff(String offWriter) {
		return dayOffDao.selectCountOff(sqlSession, offWriter);
	}

	@Override
	public int searchCountOff(DayOff off) {
		return 0;
	}

	@Override
	public int approval(int offNo) {
		return 0;
	}

	@Override
	public ArrayList<DayOff> adminSelectListOff(PageInfo pi) {
		return null;
	}

	@Override
	public ArrayList<DayOff> adminSearchListOff(DayOff off, PageInfo pi) {
		return null;
	}

	@Override
	public int adminSelectCountOff() {
		return 0;
	}

	@Override
	public int adminSearchCountOff(DayOff off) {
		return 0;
	}
	



}
