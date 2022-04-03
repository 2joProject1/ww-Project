package com.kh.walkwork.schedule.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.walkwork.schedule.model.service.ScheduleService;
import com.kh.walkwork.schedule.model.vo.Schedule;
import com.kh.walkwork.todo.model.service.TodoService;
import com.kh.walkwork.todo.model.vo.Todo;

@Controller
public class ScheduleController {
	
	@Autowired
	private ScheduleService scheduleService;
	
	@Autowired
	private TodoService todoService;
	
	@ResponseBody
	@RequestMapping(value="selectCalendar.pj", produces="application/json; charset=UTF-8")
	public List<Map<String, Object>> selectCalendar(String memberNo){
		
		System.out.println("캘린더 통신 성공");
		System.out.println("memberNo : " + memberNo);
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Map<String, Object> map = new HashMap<String, Object>();
		
		ArrayList<Schedule> scList = new ArrayList<Schedule>();
		scList = scheduleService.selectScheduleList(memberNo);
		
		for(int i=0; i<scList.size(); i++) {
			map = new HashMap<String, Object>();
			map.put("start", scList.get(i).getStartDate());
			map.put("end", scList.get(i).getEndDate());
			map.put("title", scList.get(i).getTitle());
			map.put("content", scList.get(i).getContent());
			map.put("type", 1);
			System.out.println(map);
			list.add(map);
		}
		
		ArrayList<Todo> tdList = new ArrayList<Todo>();
		tdList = todoService.selectTodoList(memberNo);
		
		for(int i=0; i<tdList.size(); i++) {
			map = new HashMap<String, Object>();
			map.put("start", tdList.get(i).getStartDate());
			map.put("end", tdList.get(i).getEndDate());
			map.put("content", tdList.get(i).getContent());
			map.put("type", 2);
			System.out.println(map);
			
			list.add(map);
		}
		
		System.out.println(list);
		
		return list;
	}
	
	@ResponseBody
	@RequestMapping(value="insertSchedule.pj")
	public String insertSchedule (Schedule schedule) {
		
		System.out.println(schedule);
//		System.out.println(title);
////		System.out.println(content);
//		System.out.println(startDate);
//		System.out.println(endDate);
//		System.out.println(memberNo);
		
		int result = scheduleService.insertSchedule(schedule);
		System.out.println(result);
		
		return "gd";
	}
}
