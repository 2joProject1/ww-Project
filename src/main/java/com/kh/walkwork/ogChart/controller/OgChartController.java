package com.kh.walkwork.ogChart.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.walkwork.ogChart.model.service.OgChartService;

@Controller
public class OgChartController {

	@RequestMapping("chart.li")
	public String ogChartListView() {
		return "ogChart/ogChartListView";
	}
	
	@Autowired
	private OgChartService ogChartService;
	
	
}
