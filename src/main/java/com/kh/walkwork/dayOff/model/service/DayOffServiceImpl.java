package com.kh.walkwork.dayOff.model.service;

import java.util.ArrayList;
import java.util.List;

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
		return dayOffDao.searchListOff(sqlSession, off, pi);
	}

	@Override
	public int selectCountOff(String offWriter) {
		return dayOffDao.selectCountOff(sqlSession, offWriter);
	}

	@Override
	public int searchCountOff(DayOff off) {
		return dayOffDao.searchCountOff(sqlSession, off);
	}

	@Override
	public int approval(int offNo) {
		return 0;
	}

	@Override
	public ArrayList<DayOff> adminSelectListOff(int deptNo, PageInfo pi) {
		return dayOffDao.adminSelectListOff(sqlSession, deptNo, pi);
	}

	@Override
	public ArrayList<DayOff> adminSearchListOff(DayOff off, PageInfo pi) {
		return dayOffDao.adminSearchListOff(sqlSession, off, pi);
	}


	@Override
	public int adminSearchCountOff(DayOff off) {
		return dayOffDao.adminSearchCountOff(sqlSession, off);
	}

	@Override
	public int adminSelectCountOff(int deptNo) {
		return dayOffDao.adminSelectCountOff(sqlSession, deptNo);
	}
	
	@Override
	public int adminApprovalOff(DayOff off) {
		return dayOffDao.adminApprovalOff(sqlSession, off);
	}
	@Override
	public List<Object> selectDto(int memberNo) {
		return dayOffDao.selectDto(sqlSession, memberNo);
	}
	
	@Override
	public List<Object> adminSelectDto(int deptNo) {
		return dayOffDao.adminSelectDto(sqlSession, deptNo);
	}


}
