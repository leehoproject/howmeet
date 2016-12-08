package com.naver.dlghdud740;

import java.io.IOException;
import java.util.HashMap;
import java.util.Locale;
import java.util.TimeZone;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.naver.dlghdud740.entities.Calendar;
import com.naver.dlghdud740.entities.Member;
import com.naver.dlghdud740.service.MemberDao;

/**
 * Handles requests for the application home page.
 */


@Controller
public class CalendarController {
	
	@Autowired
	private Calendar calendar;
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final Logger logger = LoggerFactory.getLogger(CalendarController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */

//	@RequestMapping(value="/shows/calendarDetailAjax.do")
//	public ModelAndView calendarDetailAjax(HttpServletRequest request,
//												ModelMap modelMap,
//												@ModelAttribute ShowsVo vo) throws Exeption{
//		
//		HashMap resultMap = new HashMap();
//		ModelAndView mav = new ModelAndView();
//		ShowsVO result = showsDAO.selectShowsInfo(vo);
//		Calendar c = Calendar.getInstance(TimeZone.getTimeZone("Asia/seoul"));
//		String saveFilePath = "SHOWS/"+c.get(c.YEAR)+"/"+(c.get(c.MONTH)+1 );
//		try{
//			if(result != null){
//				resultMap.put(arg0, arg1)
//				resultMap.put(arg0, arg1)
//				resultMap.put(arg0, arg1)
//				resultMap.put(arg0, arg1)
//				resultMap.put("start", result.getStartdate());
//				resultMap.put("end", result.getEnddate());
//				
//				mav.addObject("data",resultMap);
//				mav.setViewName("jsonView");
//			}
//		
//		}
//		
//	}
}
