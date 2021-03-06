package com.naver.dlghdud740;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.ObjectOutputStream.PutField;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

import com.naver.dlghdud740.entities.Board;
import com.naver.dlghdud740.entities.BoardPaging;
import com.naver.dlghdud740.entities.Calendar;
import com.naver.dlghdud740.entities.ItemBean;
import com.naver.dlghdud740.entities.Member;
import com.naver.dlghdud740.entities.Memberlist;
import com.naver.dlghdud740.entities.Photo;
import com.naver.dlghdud740.entities.Society;
import com.naver.dlghdud740.entities.Society_Board;
import com.naver.dlghdud740.entities.Society_Reply;
import com.naver.dlghdud740.entities.Societyphoto;
import com.naver.dlghdud740.entities.deletelist;
import com.naver.dlghdud740.entities.ids;
import com.naver.dlghdud740.entities.societylist;
import com.naver.dlghdud740.service.BoardDao;
import com.naver.dlghdud740.service.CalendarDao;
import com.naver.dlghdud740.service.MemberDao;
import com.naver.dlghdud740.service.MemberlistDao;
import com.naver.dlghdud740.service.PhotoDao;
import com.naver.dlghdud740.service.SocietyDao;

/**
 * Handles requests for the application home page.
 */


@Controller
public class SocietyContoroller{
	
	@Autowired
	private Society society;
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private Society_Board board;
	
	@Autowired
	private BoardPaging boardpaging;
	
	@Autowired
	private Society_Reply reply;
	
	@Autowired
	private WebApplicationContext context =null;
	private int selectedPage;
	public static String selectbox;
	public static String find;
	
	private static final Logger logger = LoggerFactory.getLogger(SocietyContoroller.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	//동호회만들기
	@RequestMapping(value = "/createmeeting", method = RequestMethod.GET)
	public String creategr(Locale locale, Model model) {	
		return "society/society_create";
	}
	//동호회메인
	@RequestMapping(value = "/societymain", method = RequestMethod.GET)
	public ModelAndView societymain(@RequestParam("check") String check,@RequestParam("societyname") String societyname,
									@RequestParam("sessionid") String sessionid,
									@RequestParam("s_hobby") String s_hobby,
									@RequestParam("s_dept") int s_dept) {	
		String msg ="";
		MemberlistDao mldao = sqlSession.getMapper(MemberlistDao.class);
		PhotoDao pdao = sqlSession.getMapper(PhotoDao.class);
		SocietyDao sdao = sqlSession.getMapper(SocietyDao.class);
		CalendarDao cdao = sqlSession.getMapper(CalendarDao.class);
		societylist list = new societylist();
		list.setSessionid(sessionid);
		list.setSocietyname(societyname);
		int count= mldao.selectMember(list);
		String masterid= mldao.selectmasterid(societyname);
		ArrayList<Memberlist> memberlists= mldao.selectAll(societyname);
		String mastername= mldao.selectMaster(societyname);
		ArrayList<Photo> photos= pdao.selectPhoto(societyname);
		Society society =sdao.selectSociety(societyname);
		ArrayList<Calendar> upcommings= cdao.upcomming(societyname);
		if(photos.size()==0){
			msg = "0" ;
		}
		ModelAndView mav = new ModelAndView("society/society_main");
		mav.addObject("memberlists",memberlists);
		mav.addObject("photos",photos);		
		mav.addObject("msg",msg);
		mav.addObject("check",check);
		mav.addObject("societyname",societyname);
		mav.addObject("count",count);
		mav.addObject("society",society);
		mav.addObject("mastername",mastername);
		mav.addObject("upcommings",upcommings);
		mav.addObject("masterid",masterid);
		mav.addObject("s_hobby",s_hobby);
		mav.addObject("s_dept",s_dept);
		return mav;
	}
	//동호회모임 Insert
	@RequestMapping(value = "/SocietyCreate", method = RequestMethod.GET)
	public ModelAndView SocietyCreate(@ModelAttribute("society") Society society,HttpSession session) {	
		SocietyDao dao = sqlSession.getMapper(SocietyDao.class);
		MemberlistDao mldao = sqlSession.getMapper(MemberlistDao.class);
		int result = dao.insertRow(society);
		String societyname =society.getS_name();
		String sessionid = (String) session.getAttribute("sessionid");
		String msg = "";
		if(result==1){
			msg=society.getS_name()+" 동호회를 설립하였습니다.";
			societylist list = new societylist();
			list.setSessionid(sessionid);
			list.setSocietyname(societyname);
			mldao.joinMaster(list);
			mldao.memberCount(societyname);
		} else {
			msg="동호회 설립 실패";
		}
		ModelAndView mav = new ModelAndView("society/society_resultpage");
		mav.addObject("msg",msg);
		mav.addObject("result","ok");
		
		return mav;
	}
	//모임리스트
	@RequestMapping(value = "/societyFind", method = RequestMethod.GET)
	public ModelAndView searchgr(@RequestParam("category") String category) {
		SocietyDao dao =sqlSession.getMapper(SocietyDao.class);
		ArrayList<Society>societys= dao.selectAll(category);
		ModelAndView mav = new ModelAndView("society/society_find");
		mav.addObject("societys",societys);
		mav.addObject("category",category);
		return mav;
	}
	
	//모임리스트
	@RequestMapping(value = "/findGroup", method = RequestMethod.GET)
	public ModelAndView findGroup(@RequestParam("namefind") String namefind) {
		SocietyDao dao =sqlSession.getMapper(SocietyDao.class);
		ArrayList<Society>societys= dao.findGroup(namefind);
		ModelAndView mav = new ModelAndView("society/society_find");
		mav.addObject("societys",societys);
		return mav;
	}
	
	//사진입력
	@RequestMapping(value = "/insertPhoto", method = RequestMethod.POST)
	public ModelAndView insertPhoto(@ModelAttribute("photo") Photo photo,HttpServletRequest request,
            @RequestParam CommonsMultipartFile file,HttpSession session,@RequestParam String s_dept,@RequestParam String s_hobby) {	
		PhotoDao dao = sqlSession.getMapper(PhotoDao.class);
		String path = "C:/Users/IT/git/howmeet/project/src/main/webapp/resources/photogallery/";
		String filename = file.getOriginalFilename();
		String subname = UUID.randomUUID().toString().replaceAll("-","");
		try{
			byte fileData[] = file.getBytes();
			BufferedOutputStream fos = new BufferedOutputStream(
					new FileOutputStream(path+subname+filename));
			fos.write(fileData);
			fos.flush();
			fos.close();
		}
		catch(Exception e){
			e.printStackTrace();
		}
		if(filename.equals("")){
			photo.setP_photo(filename);
		} else {
			photo.setP_photo(subname+filename);
		}
		int result = dao.insertPhoto(photo);
		if(result==1){
			System.out.println("yyyyyyes");
		} else {
			System.out.println("nooooooooo");
		}
		System.out.println(s_dept);
		System.out.println(s_hobby);
		ModelAndView mav = new ModelAndView("redirect:/societymain");
		mav.addObject("check","1");
		mav.addObject("societyname",photo.getP_name());
		mav.addObject("sessionid",photo.getP_id());
		mav.addObject("s_dept",s_dept);
		mav.addObject("s_hobby",s_hobby);
		return mav;
		}
	
	//멤버확인
	@RequestMapping(value = "selectMember", method = RequestMethod.GET)
	public ModelAndView selectMember(@RequestParam("sessionid") String sessionid,
									 @RequestParam("societyname") String societyname,
									 @RequestParam("s_hobby") String s_hobby,
									 @RequestParam("s_dept") int s_dept) {
		MemberlistDao dao =sqlSession.getMapper(MemberlistDao.class);
		societylist list = new societylist();
		list.setSessionid(sessionid);
		list.setSocietyname(societyname);
		int count= dao.selectMember(list);
		if(count==0){
			ModelAndView mav = new ModelAndView("redirect:/societyJoin");
			mav.addObject("sessionid",sessionid);
			mav.addObject("societyname",societyname);
			mav.addObject("s_hobby",s_hobby);
			mav.addObject("s_dept",s_dept);
			return mav;
		} else {
			ModelAndView mav = new ModelAndView("redirect:/societymain");
			mav.addObject("check","0");
			mav.addObject("societyname",societyname);
			mav.addObject("sessionid",sessionid);
			mav.addObject("s_hobby",s_hobby);
			mav.addObject("s_dept",s_dept);
			return mav;
		}
	}
	
	//모임가입
	@RequestMapping(value = "/societyJoin", method = RequestMethod.GET)
	public ModelAndView societyJoin(@RequestParam("sessionid") String sessionid,@RequestParam("societyname") String societyname,
									@RequestParam("s_hobby") String s_hobby,@RequestParam("s_dept") int s_dept) {
		MemberlistDao dao =sqlSession.getMapper(MemberlistDao.class);
		societylist list = new societylist();
		list.setSessionid(sessionid);
		list.setSocietyname(societyname);
		int result= dao.joinMember(list);
		dao.memberCount(societyname);
		if(result==1){
			System.out.println("yyyyyyes");
		} else {
			System.out.println("nooooooooo");
		}
		ModelAndView mav = new ModelAndView("redirect:/societymain");
		mav.addObject("check","1");
		mav.addObject("societyname",societyname);
		mav.addObject("sessionid",sessionid);
		mav.addObject("s_hobby",s_hobby);
		mav.addObject("s_dept",s_dept);
		return mav;
	}
	
	//모임간리페이지
	@RequestMapping(value = "/societyadmin", method = RequestMethod.GET)
	public ModelAndView societyadmin(@RequestParam("societyname") String societyname) {	
		SocietyDao dao =sqlSession.getMapper(SocietyDao.class);
		Society society= dao.selectSociety(societyname);
		ModelAndView mav = new ModelAndView("society/society_admin");
		mav.addObject("society",society);
		return mav;
	}
	
	//사진삭제
	@RequestMapping(value = "/photodelete", method = RequestMethod.GET)
	public ModelAndView photodelete(@RequestParam("p_seq") String p_seq,@RequestParam("societyname") String societyname,@RequestParam("sessionid") String sessionid) {
		PhotoDao dao =sqlSession.getMapper(PhotoDao.class);
		deletelist list = new deletelist();
		list.setP_seq(p_seq);
		list.setSocietyname(societyname);
		int result= dao.deletePhoto(list);
		if(result==1){
			System.out.println("yyyyyyes");
		} else {
			System.out.println("nooooooooo");
		}
		ModelAndView mav = new ModelAndView("redirect:/societymain");
		mav.addObject("check","1");
		mav.addObject("societyname",societyname);
		mav.addObject("sessionid",sessionid);
		return mav;
	}
	
	//모임수정
	@RequestMapping(value = "/SocietyUpdate", method = RequestMethod.POST)
	public ModelAndView memberUpdate(@ModelAttribute("society") Society society) {	
		SocietyDao dao = sqlSession.getMapper(SocietyDao.class);
		int result = dao.updatesociety(society);
		
		String msg = "";
		if(result == 1){
			msg += "성공적으로 수정되었습니다.";
		} else {
			msg += "수정에 실패했습니다.";
		}
		ModelAndView mav = new ModelAndView("member/member_result");
		mav.addObject("msg",msg);
		return mav;		
	}
	
	//모임멤버간리페이지
	@RequestMapping(value = "/membermanage", method = RequestMethod.GET)
	public ModelAndView membermanage(@RequestParam("societyname") String societyname) {	
		MemberlistDao dao =sqlSession.getMapper(MemberlistDao.class);
		ArrayList<Memberlist> memberlists= dao.selectAll(societyname);
		ModelAndView mav = new ModelAndView("society/society_admin_membermanage");
		mav.addObject("memberlists",memberlists);
		mav.addObject("societyname",societyname);
		return mav;
	}
	
	//멤버 강제탈퇴
	@RequestMapping(value = "/memberselectdelete", method = RequestMethod.GET)
	public ModelAndView memberselectdelete(@RequestParam String saveids[],@RequestParam("societyname") String societyname) {
		
		MemberlistDao dao = sqlSession.getMapper(MemberlistDao.class);
		for (String ids:saveids){
			ids list = new ids();
			list.setIds(ids);
			list.setSocietyname(societyname);
			dao.deleteRow(list);
			dao.memberDown(societyname);
		}
		ModelAndView mav = new ModelAndView("redirect:/membermanage");
		mav.addObject("societyname",societyname);
		return mav;
	}
	//멤버 레벨상승
		@RequestMapping(value = "/memberlevelup", method = RequestMethod.GET)
		public ModelAndView memberlevelup(@RequestParam String saveids[],@RequestParam("societyname") String societyname) {
			
			MemberlistDao dao = sqlSession.getMapper(MemberlistDao.class);
			for (String ids:saveids){
				ids list = new ids();
				list.setIds(ids);
				list.setSocietyname(societyname);
				dao.memberlevelup(list);
			}
			ModelAndView mav = new ModelAndView("redirect:/membermanage");
			mav.addObject("societyname",societyname);
			return mav;
		}	
		//멤버 레벨감소
		@RequestMapping(value = "/memberleveldown", method = RequestMethod.GET)
		public ModelAndView memberleveldown(@RequestParam String saveids[],@RequestParam("societyname") String societyname) {
			
			MemberlistDao dao = sqlSession.getMapper(MemberlistDao.class);
			for (String ids:saveids){
				ids list = new ids();
				list.setIds(ids);
				list.setSocietyname(societyname);
				dao.memberleveldown(list);
			}
			ModelAndView mav = new ModelAndView("redirect:/membermanage");
			mav.addObject("societyname",societyname);
			return mav;
		}	
		//모임삭제
		@RequestMapping(value = "/deletesociety", method = RequestMethod.GET)
		public ModelAndView deletesociety(@RequestParam("societyname") String societyname) {
			
			SocietyDao dao= sqlSession.getMapper(SocietyDao.class);
			dao.deletesociety(societyname);
			ModelAndView mav = new ModelAndView("layout/body");
			return mav;
		}
		
		//모임공지페이지
		@RequestMapping(value = "/noticemanage", method = RequestMethod.GET)
		public ModelAndView noticemanage(@RequestParam("societyname") String societyname) {	
			ModelAndView mav = new ModelAndView("society/society_admin_notice");
			mav.addObject("societyname",societyname);
			return mav;
		}
		
		//모임사진관리페이지
		@RequestMapping(value = "/photomanage", method = RequestMethod.GET)
		public ModelAndView photomanage(@RequestParam("societyname") String societyname) {	
			PhotoDao dao =sqlSession.getMapper(PhotoDao.class);
			ArrayList<Photo> photolists= dao.selectPhoto(societyname);
			ModelAndView mav = new ModelAndView("society/society_admin_photomanage");
			mav.addObject("photolists",photolists);
			mav.addObject("societyname",societyname);
			return mav;
		}
		
		//사진 삭제
		@RequestMapping(value = "/photoselectdelete", method = RequestMethod.GET)
		public ModelAndView photoselectdelete(@RequestParam String saveids[],@RequestParam("societyname") String societyname) {
			PhotoDao dao = sqlSession.getMapper(PhotoDao.class);
			for (String ids:saveids){
				deletelist list = new deletelist();
				list.setP_seq(ids);
				list.setSocietyname(societyname);
				dao.deletePhoto(list);
			}
			ModelAndView mav = new ModelAndView("redirect:/photomanage");
			mav.addObject("societyname",societyname);
			return mav;
		}
		
		//모임사진관리페이지
		@RequestMapping(value = "/photodeco", method = RequestMethod.GET)
		public ModelAndView photodeco(@RequestParam("societyname") String societyname) {	
			ModelAndView mav = new ModelAndView("society/society_admin_photodeco");
			mav.addObject("societyname",societyname);
			return mav;
		}
		
		//대문사진바꾸기
		@RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
		public ModelAndView uploadFile(HttpServletRequest request,@RequestParam("societyname") String societyname,
		                            @RequestParam CommonsMultipartFile file,HttpSession session) {
			String path = "C:/Users/IT/git/howmeet/project/src/main/webapp/resources/uploadFolder/";
			String filename = file.getOriginalFilename();
			String subname = UUID.randomUUID().toString().replaceAll("-","");
			try{
				byte fileData[] = file.getBytes();
				BufferedOutputStream fos = new BufferedOutputStream(
						new FileOutputStream(path+subname+filename));
				fos.write(fileData);
				fos.flush();
				fos.close();
			}
			catch(Exception e){
				e.printStackTrace();
			}
			
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("societyname", societyname);
			if(filename.equals("")){
				map.put("path", filename);
			} else {
				map.put("path", subname+filename);
			}
			map.put("name", filename);
			
			SocietyDao dao = sqlSession.getMapper(SocietyDao.class);
			int result= dao.updatecontent(map);
			if(result==1){
				System.out.println("yyyyyyes");
			} else {
				System.out.println("nooooooooo");
			}
			ModelAndView mav = new ModelAndView("society/society_result");
			return mav;
		
		}
		
		//일정관리페이지
		@RequestMapping(value = "/schedulemanage", method = RequestMethod.GET)
		public ModelAndView schedulemanage(@RequestParam("societyname") String societyname) {	
			ModelAndView mav = new ModelAndView("society/society_admin_schedulemanage");
			CalendarDao dao =sqlSession.getMapper(CalendarDao.class);
			ArrayList<Calendar> calendarlists= dao.selectSchedule(societyname);
			mav.addObject("calendarlists",calendarlists);
			mav.addObject("societyname",societyname);
			return mav;
		}
		
		//일정입력
		@RequestMapping(value = "/insertschedule", method = RequestMethod.POST)
		public ModelAndView insertschedule(@ModelAttribute("Calendar") Calendar calendar,HttpServletRequest request,
	            @RequestParam CommonsMultipartFile file,HttpSession session) {	

			
			CalendarDao dao = sqlSession.getMapper(CalendarDao.class);
			String path = "C:/Users/IT/git/howmeet/project/src/main/webapp/resources/schedulegallery/";
			String filename = file.getOriginalFilename();
			String subname = UUID.randomUUID().toString().replaceAll("-","");
			try{
				byte fileData[] = file.getBytes();
				BufferedOutputStream fos = new BufferedOutputStream(
						new FileOutputStream(path+subname+filename));
				fos.write(fileData);
				fos.flush();
				fos.close();
			}
			catch(Exception e){
				e.printStackTrace();
			}
			calendar.setC_date(calendar.getC_date1()+"-"+calendar.getC_date2()+"-"+calendar.getC_date3());
			if(filename.equals("")){
				calendar.setC_photo(filename);
			} else {
				calendar.setC_photo(subname+filename);
			}
			int result = dao.insertSchedule(calendar);
			if(result==1){
				System.out.println("yyyyyyes");
			} else {
				System.out.println("nooooooooo");
			}
			System.out.println(calendar.getC_societyname());
			ModelAndView mav = new ModelAndView("redirect:/schedulemanage");
			mav.addObject("societyname", calendar.getC_societyname());
			return mav;
			}
		
			//사진 삭제
				@RequestMapping(value = "/scheduleselectdelete", method = RequestMethod.GET)
				public ModelAndView scheduleselectdelete(@RequestParam String saveids[],@RequestParam("societyname") String societyname) {
					CalendarDao dao = sqlSession.getMapper(CalendarDao.class);
					for (String ids:saveids){
						HashMap<String, String> map = new HashMap<String, String>();
						map.put("societyname", societyname);
						map.put("c_name", ids);
						dao.deleteSchedule(map);
					}
					ModelAndView mav = new ModelAndView("redirect:/schedulemanage");
					mav.addObject("societyname",societyname);
					return mav;
				}
				
				
				
				//모임리스트
				@RequestMapping(value = "/society_board", method = RequestMethod.GET)
				public ModelAndView society_board(@RequestParam("category") String category) {
					SocietyDao dao =sqlSession.getMapper(SocietyDao.class);
					ArrayList<Society>societys= dao.selectAll(category);
					ModelAndView mav = new ModelAndView("society/test");
					mav.addObject("societys",societys);
					mav.addObject("category",category);
					return mav;
				}	
				
		
}
