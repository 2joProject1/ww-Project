package com.kh.walkwork.ogChart.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.walkwork.ogChart.model.dao.OgChartDao;

@Service
public class OgChartServiceImpl implements OgChartService{

	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private OgChartDao ogChartDao;
	
}
