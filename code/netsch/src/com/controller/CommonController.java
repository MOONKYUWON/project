package com.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dao.CommonDAO;
import com.model.SchDetailModel;
import com.model.SchModel;
import com.model.UserModel;

@Controller
public class CommonController {
	CommonDAO dao;
	private static final Logger logger = Logger.getLogger(CommonController.class);
	public void setDao(CommonDAO dao) {
		this.dao = dao;
	}

	@RequestMapping(value = "/login.do")
	public ModelAndView login(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();

		HttpSession session = request.getSession();
		
		String session_id = (String)session.getAttribute("user_id");
        logger.info("user세션 아이디 = "+session_id);

		if(session_id != null){
			mav.setViewName("main");
			UserModel db_model = dao.getUserInfo(session_id);
			mav.addObject("db_model", db_model);
			return mav;
		}
		
		mav.setViewName("login");
		return mav;
	}
	
	@RequestMapping(value = "/login_ok.do")
	public ModelAndView login(UserModel model, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		String user_id = model.getUser_id();
		String user_pass = model.getUser_pass();
		
		UserModel db_model = dao.getUserInfo(user_id);
		if(db_model==null){
		
			mav.setViewName("loginFail");
			String message = "ID혹은 비밀번호가 맞지 않습니다.";
			mav.addObject("message", message);
			return mav;			
			
		}
		String db_userpass = db_model.getUser_pass();
	
		if(user_pass.equals(db_userpass)){
			//로그인 성공
			HttpSession session = request.getSession();
			logger.info("userlist.do로 옴");
			session.setAttribute("user_id", db_model.getUser_id());
			session.setAttribute("user_name", db_model.getUser_name());
			session.setAttribute("user_role", db_model.getUser_role());
			
		}else{
			mav.setViewName("loginFail");
			String message = "ID혹은 비밀번호가 맞지 않습니다.";
			mav.addObject("message", message);
			return mav;			
		}
		mav.setViewName("main");
		return mav;
	}
	
	@RequestMapping(value = "/main.do")
	public ModelAndView main(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		
		String session_id = (String)session.getAttribute("user_id");
        logger.info("user세션 아이디 = "+session_id);

        mav.setViewName("listNetschCounsel");
		UserModel db_model = dao.getUserInfo(session_id);
		mav.addObject("db_model", db_model);
		mav.setViewName("main");
		return mav;
	}
	
	@RequestMapping(value = "/prof_info.do")
	public ModelAndView prof_info(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		
		String session_id = (String)session.getAttribute("user_id");
        logger.info("user세션 아이디 = "+session_id);

        mav.setViewName("listNetschCounsel");
		UserModel db_model = dao.getUserInfo(session_id);
		mav.addObject("db_model", db_model);
		mav.setViewName("prof_info");
		return mav;
	}
	

	@RequestMapping(value = "/listNetschCounsel.do")
	public ModelAndView listNetschCounsel(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();

		HttpSession session = request.getSession();
		
		String session_id = (String)session.getAttribute("user_id");
        logger.info("user세션 아이디 = "+session_id);

        mav.setViewName("listNetschCounsel");
		UserModel db_model = dao.getUserInfo(session_id);
		mav.addObject("db_model", db_model);
		
		ArrayList<SchModel> schList = new ArrayList<>();
		schList = dao.getSchList();
		mav.addObject("schList", schList);
		mav.setViewName("listNetschCounsel");
		
		return mav;

	}

	@RequestMapping(value = "/logout.do")
	public ModelAndView logout(HttpServletRequest request) throws Exception {
		logger.info("logout.do 페이지");
		System.out.println("logout.do 페이지");
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		session.invalidate();
		mav.setViewName("login");
		return mav;
	}
	
	@RequestMapping(value = "/goRegister.do")
	public ModelAndView goRegister() throws Exception {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("register");
		return mav;
	}
	
	@RequestMapping(value = "/register_ok.do")
	public ModelAndView goRegister_ok(UserModel model) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		String user_id = model.getUser_id();
		int idCount = 0;
		idCount = dao.countSearchId(user_id);
		String message="";
		if(idCount > 0){
			message = "동일한 ID가 있습니다.";

		}else{
			dao.insertNetschUser(model);
			message = "가입이 완료 되었습니다";
		}
		mav.addObject("message", message);		
		mav.setViewName("register_ok");
		return mav;
	}
	@RequestMapping(value = "/popNetschCalendar.do")
	public ModelAndView popNetschCalendar(String user_id) throws Exception {
		ModelAndView mav = new ModelAndView();
		ArrayList<SchModel> list = new ArrayList<SchModel>();
//		list = dao.getSchDetailList(user_id);
		list = dao.getAvailDay(user_id);

		mav.addObject("list", list);
		mav.addObject("user_id", user_id);
		mav.setViewName("popNetschCalendar");
		return mav;
	}
	
	@RequestMapping(value = "/writeProfSch.do")
	public ModelAndView writeProfSch(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		HttpSession session = request.getSession();
		
		String user_id = (String)session.getAttribute("user_id");
		
		ArrayList<SchModel> list = dao.getProfSch(user_id);
		mav.addObject("list", list);
		mav.setViewName("writeProfSch");
		return mav;
	}
	
	@RequestMapping(value = "/insertProfSch.do")
	public ModelAndView insertProfSch(HttpServletRequest request, String avail_day, String start_time, String end_time, String rCnt) throws Exception {

		ModelAndView mav = new ModelAndView();
		String user_id = (String)request.getSession().getAttribute("user_id");
		dao.deleteProfSch(user_id);
		logger.info("insertProfSch.do로 옴");
		String[] array_avail_day = avail_day.split(",");
		String[] array_start_time = start_time.split(",");
		String[] array_end_time = end_time.split(",");
		
		if(Integer.parseInt(rCnt)!=0){
			for(int i  = 0 ; i < array_avail_day.length ; i++){
				SchModel model = new SchModel();
				model.setUser_id(user_id);
				model.setAvail_day(array_avail_day[i]);
				model.setStart_time(array_start_time[i]);
				model.setEnd_time(array_end_time[i]);
				dao.insertProfSch(model);
			}
		}
		mav.addObject("message", "저장되었습니다.");
		mav.setViewName("JsonView");
		return mav;
	}
	
	@RequestMapping(value = "/insertSchInfo.do")
	public ModelAndView insertSchInfo(SchModel model, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		dao.insertSchInfo(model);
		mav.setViewName("JsonView");
		return mav;
	}
	
	@RequestMapping(value = "/searchReserve.do")
	public ModelAndView searchReserve(SchDetailModel model,SchModel schModel, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		ArrayList<SchDetailModel> list = dao.searchReserve(model);
		ArrayList<SchModel> infoList = dao.getSchInfoByAvail(schModel);
		mav.addObject("list", list);
		mav.addObject("infoList", infoList);
		mav.setViewName("JsonView");
		return mav;
	}
	
	@RequestMapping(value = "/insertSchDetail.do")
	public ModelAndView insertSchDetail(SchDetailModel model, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		String apply_id = (String)request.getSession().getAttribute("user_id");
		model.setApply_id(apply_id);
		dao.insertSchDetail(model);
		String message = "상담 예약이 완료 되었습니다.";
		mav.addObject("message", message);
		mav.setViewName("JsonView");
		return mav;
	}
	
	@RequestMapping(value = "/reserv_info.do")
	public ModelAndView reserv_info(SchDetailModel model,SchModel schModel, HttpServletRequest request) throws Exception {

		ModelAndView mav = new ModelAndView();
		
		String user_id = (String)request.getSession().getAttribute("user_id");
		String user_role = (String)request.getSession().getAttribute("user_role");
		ArrayList<SchDetailModel> list = new ArrayList<SchDetailModel>();
		if("S".equals(user_role)){
			list = dao.listReservInfo(user_id);
		}else if("P".equals(user_role)){
			list = dao.checkReservInfo(user_id);			
		}
		mav.addObject("list", list);
		mav.setViewName("reserv_info");
		return mav;
	}
	
}
