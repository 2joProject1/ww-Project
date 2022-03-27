package com.kh.walkwork.signoffs.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.walkwork.member.model.vo.Dept;
import com.kh.walkwork.signoffs.model.dao.SignoffsDao;
import com.kh.walkwork.signoffs.model.vo.Signoffs;
import com.kh.walkwork.signoffs.model.vo.SignoffsDept;

@Service
public class SignoffsService {
	@Autowired
	private SignoffsDao signoffsDao;
	
	public List<Signoffs> selectSignoffsList(Signoffs vo) {
		return signoffsDao.selectSignoffsList(vo);
	}
	
	public Signoffs selectSignoffsOne(Signoffs vo) {
		return signoffsDao.selectSignoffsOne(vo);
	}
	
	public int insertSignoffs(Signoffs vo) {
		return signoffsDao.insertSignoffs(vo);
	}

	public int insertSignoffsDept(SignoffsDept vo) {
		return signoffsDao.insertSignoffsDept(vo);
	}
	
	public int updateSignoffs(Signoffs vo) {
		return signoffsDao.updateSignoffs(vo);
	}
	
	public int deleteSignoffs(Signoffs vo) {
		return signoffsDao.deleteSignoffs(vo);
	}

	public Dept getSignoffsDept(String docuNo) {
		return signoffsDao.getSignoffsDept(docuNo);
	}

	public Dept getDept(String deptNo) {
		return signoffsDao.getDept(deptNo);
	}

	public String getLatestApprovalNo(Signoffs s) {
		return signoffsDao.getLatestApprovalNo(s);
	}
	
}
