package com.kh.walkwork.ogChart.controller;

import java.net.InetAddress;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.jdbc.UncategorizedSQLException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.walkwork.common.template.Pagination;
import com.kh.walkwork.member.model.vo.Member;
import com.kh.walkwork.ogChart.model.service.OgChartService;
import com.kh.walkwork.common.template.FileUpload;

@Controller
//@RequestMapping("ogChart/*")
public class OgChartController {


	@Inject
	private OgChartService OgChartService;

	//@Inject
	//private NavService navService;

	@Resource(name = "uploadPath")
	private String uploadPath;
/*
	@RequestMapping(value = "index", method = { RequestMethod.GET, RequestMethod.POST})
	public void index(HttpServletRequest request) throws Exception {


		Map<String, Object> result = new HashMap<String, Object>();

		try {

		} catch(Exception e) {
			e.printStackTrace();
		}


	}	
	
*/
	// 관리 - 구성원 관리 페이지
	@RequestMapping(value = "officerList.li", method = { RequestMethod.GET, RequestMethod.POST})
	public String officerList(HttpServletRequest request,HttpSession session, Model model, RedirectAttributes attr) throws Exception {

		/*** 로그인 ***/
		/*
		session = request.getSession(false);


		String memberNo = null;
		memberNo = (String)session.getAttribute("memberNo");

		if (memberNo == null || memberNo.equals(""))
			return "redirect:/";
		else if(!memberNo.equals("5")){
			attr.addAttribute("msg", "test");
			return "redirect:/";
		}
		*/
		/*** 로그인 ***/


		//Map<String, Object> myInfoList = new HashMap<String, Object>();

		List officerList = new ArrayList<HashMap<String, Object>>();
		int officerListCount = 0;
		Map params = new HashMap<String, Object>();
		List selectMember = new ArrayList<HashMap<String, Object>>();
		//List selectAdmn_Tb = new ArrayList<HashMap<String, Object>>();
		List selectRank = new ArrayList<HashMap<String, Object>>();
		List selectDept = new ArrayList<HashMap<String, Object>>();

		try {

			officerListCount = OgChartService.officerListCount(params);
			//myInfoList = navService.myInfo(memberNo);
			selectMember = OgChartService.selectMember();
			//selectAdmn_Tb = OgChartService.selectAdmn_Tb();
			selectRank = OgChartService.selectRank();
			selectDept = OgChartService.selectDept();

			// 페이징 처리 ========================================================================================================
			Pagination Pagination = new Pagination();

			int totalCnt = officerListCount;

			int current_page = 1;

			if (request.getParameter("page") != null) {
				current_page = Integer.parseInt((String)request.getParameter("page"));
			}

			String pageIndexList = Pagination.pageIndexList(totalCnt, current_page);

			int startCount = (current_page - 1) * 10 + 1;
			int endCount = current_page * 10;

			params.put("startCount", startCount);
			params.put("endCount", endCount);

			officerList = OgChartService.officerList(params);

			model.addAttribute("pageIndexList", pageIndexList);
			// ======================================================================================================== 페이징 처리

			//model.addAttribute("myInfoList", myInfoList);
			model.addAttribute("officerList", officerList);
			model.addAttribute("officerListCount", officerListCount);
			model.addAttribute("selectMember", selectMember);
			//model.addAttribute("selectAdmn_Tb", selectAdmn_Tb);
			model.addAttribute("selectRank", selectRank);
			model.addAttribute("selectDept", selectDept);


		} catch(Exception e) {
			e.printStackTrace();
		}

		return "ogChart/ogChartListView";
	}
	

	// 관리 - 구성원 관리 - 검색 - 사원 목록 Ajax
	@ResponseBody
	@RequestMapping(value = "officerListSearch.se", method = { RequestMethod.GET, RequestMethod.POST})
	public Map<String, Object> officerListSearch(@RequestBody Map<String, Object> params, HttpServletRequest request) throws Exception {


		Map<String, Object> result = new HashMap<String, Object>();
		List officerList = new ArrayList<HashMap<String, Object>>();
		Map<String, Object> map = new HashMap<String, Object>();
		int officerListCount = 0;



		try {

			officerListCount = OgChartService.officerListCount(params);

			// 페이징 처리 ========================================================================================================
			Pagination Pagination = new Pagination();

			int totalCnt = officerListCount;

			int current_page = 1;
			int before_page = 1;

			if (params.get("page") != null) {
				current_page = Integer.parseInt((String)params.get("page"));
			}

			String pageIndexListAjax = Pagination.pageIndexListAjax(totalCnt, current_page);



			int startCount = (current_page - 1) * 10 + 1;
			int endCount = current_page * 10;

			params.put("startCount", startCount);
			params.put("endCount", endCount);

			officerList = OgChartService.officerList(params);

			map.put("pageIndexListAjax", pageIndexListAjax);
			// ======================================================================================================== 페이징 처리



			map.put("officerList", officerList);
			map.put("officerListCount", officerListCount);

			result.putAll(map);  


		} catch(Exception e) {
			e.printStackTrace();
		}


		return result;
	}

	@ResponseBody
	@RequestMapping(value = "selectMemberNo.me", method = { RequestMethod.GET, RequestMethod.POST})
	public int selectMemberNo(HttpServletRequest request, @RequestBody Map<String, Object> params) throws Exception {


		int result = 0;

		try {
			result = OgChartService.selectMemberNo(params);
		} catch(Exception e) {
			e.printStackTrace();
		}


		return result;
	}

	// 관리 - 구성원 관리 - 구성원 추가 Ajax
	@ResponseBody
	@RequestMapping(value = "officerInsert.in", method = { RequestMethod.GET, RequestMethod.POST})
	public ResponseEntity<String> officerInsert(MultipartHttpServletRequest request, MultipartFile file, Member vo, Model model) throws Exception {


		ResponseEntity<String> entity = null;

		try {

			FileUpload fileupload = new FileUpload();

			String savedName = fileupload.uploadfile(file.getOriginalFilename(), file.getBytes(), uploadPath);
			vo.setFilePath("/resources/uploadFiles/" + savedName);
			vo.setFile(file.getOriginalFilename());

			OgChartService.officerInsert(vo);

			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);

		} catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>("FAIL", HttpStatus.OK);
		}


		return entity;
	}


	// 관리자 - 임직원 수정
	@ResponseBody
	@RequestMapping(value = "selectUpdateOfficer.up", method = { RequestMethod.GET, RequestMethod.POST})
	public Map<String, Object> selectUpdateOfficer(HttpServletRequest request, @RequestBody Map<String, Object> params) throws Exception {


		Map<String, Object> result = new HashMap<String, Object>();

		try {
			result = OgChartService.selectUpdateOfficer(params);
		} catch(Exception e) {
			e.printStackTrace();
		}


		return result;
	}

	// 관리 - 구성원 관리 - 구성원 추가 Ajax
	@ResponseBody
	@RequestMapping(value = "officerUpdate.up", method = { RequestMethod.GET, RequestMethod.POST})
	public ResponseEntity<String> officerUpdate(MultipartHttpServletRequest request, MultipartFile file, Member vo, Model model) throws Exception {


		ResponseEntity<String> entity = null;

		try {

			FileUpload fileupload = new FileUpload();

			System.out.println(vo.toString());

			String savedName = fileupload.uploadfile(file.getOriginalFilename(), file.getBytes(), uploadPath);
			vo.setFilePath("/resources/uploadFiles/" + savedName);
			vo.setFile(file.getOriginalFilename());

			OgChartService.officerUpdate(vo);

			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);

		} catch (NullPointerException npe) {

			int result = OgChartService.officerUpdate(vo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);				
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>("FAIL", HttpStatus.OK);
		}


		return entity;
	}

	@ResponseBody
	@RequestMapping(value = "deptInsert.in", method = { RequestMethod.GET, RequestMethod.POST})
	public int deptInsert(HttpServletRequest request, @RequestBody Map<String, Object> params) throws Exception {

		int result = 0;
		try {
			result = OgChartService.deptInsert(params);
		} catch(UncategorizedSQLException use) {
			use.printStackTrace();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	// 관리 - 구성원 관리 페이지
	@ResponseBody
	@RequestMapping(value = "selectDept.se", method = { RequestMethod.GET, RequestMethod.POST})
	public List selectDept(HttpServletRequest request) throws Exception {


		List selectDept = new ArrayList<HashMap<String, Object>>();

		try {

			selectDept = OgChartService.selectDept();

		} catch(Exception e) {
			e.printStackTrace();
		}


		return selectDept;
	}

	@ResponseBody
	@RequestMapping(value = "selectDeptName.se", method = { RequestMethod.GET, RequestMethod.POST})
	public int selectDeptName(HttpServletRequest request, @RequestBody Map<String, Object> params) throws Exception {


		int result = 0;

		try {
			result = OgChartService.selectDeptName(params);
		} catch(Exception e) {
			e.printStackTrace();
		}


		return result;
	}

	@ResponseBody
	@RequestMapping(value = "deptUpdate.up", method = { RequestMethod.GET, RequestMethod.POST})
	public int deptUpdate(HttpServletRequest request, @RequestBody Map<String, Object> params) throws Exception {


		int result = 0;

		try {
			result = OgChartService.deptUpdate(params);
		} catch(Exception e) {
			e.printStackTrace();
		}


		return result;
	}

	@ResponseBody
	@RequestMapping(value = "deptDelete.de", method = { RequestMethod.GET, RequestMethod.POST})
	public int deptDelete(HttpServletRequest request, @RequestBody Map<String, Object> params) throws Exception {


		int result = 0;

		try {
			result = OgChartService.deptDelete(params);
		} catch(DataIntegrityViolationException dive) {
			result = -1;
		} catch(Exception e) {
			e.printStackTrace();
		}


		return result;
	}
	
}
