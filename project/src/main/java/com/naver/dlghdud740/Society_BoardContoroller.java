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
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import com.naver.dlghdud740.entities.Reply;
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
import com.naver.dlghdud740.service.Society_BoardDao;
/**
 * Handles requests for the application home page.
 */
@Controller
public class Society_BoardContoroller{
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
	
	private static final Logger logger = LoggerFactory.getLogger(Society_BoardContoroller.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */

	
	//Society Board 입력폼 이동	
	@RequestMapping(value = "/society_board_detail", method = RequestMethod.GET)
	public ModelAndView society_board_detail(@RequestParam String s_hobby,@RequestParam int s_dept) {		
		System.out.println(this.selectbox);
		System.out.println(this.find);
		ModelAndView mav = new ModelAndView("society_board/society_board_detail");
		mav.addObject("s_hobby",s_hobby);
		mav.addObject("s_dept",s_dept);
		return mav;
	}			
	
	
	//Society Board Insert 부분
		@RequestMapping(value = "/society_board_insert", method = RequestMethod.POST)
		@ResponseBody public ModelAndView society_board_insert(@ModelAttribute("Society_Board") Society_Board board,HttpServletRequest request,
				@RequestParam CommonsMultipartFile file,HttpSession session) {
			String path="D:/KFMT/itschool/src/main/webapp/resources/uploadFolder/";
			String filename=file.getOriginalFilename();
			Society_BoardDao dao = sqlSession.getMapper(Society_BoardDao.class);
			String b_ip = request.getRemoteAddr();
			SimpleDateFormat simple = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss", Locale.KOREA);
			Date currentdate = new Date();
			String b_date = simple.format(currentdate);
			System.out.println(board.getB_QAtype());
			board.setB_QAtype("동호회");
			board.setB_ip(b_ip);
			board.setB_date(b_date);
			board.setB_step(0);
			board.setB_hit(0);
			board.setB_level(0);
			board.setB_dept1(board.getB_dept1());
			board.setB_dept2(board.getB_dept2());
			System.out.println(filename);
			if(filename.equals("")){
				board.setB_attach(filename);
			} else {
				board.setB_attach(path+filename);
				try {
					byte barr[]=file.getBytes();
					
					BufferedOutputStream bout = new BufferedOutputStream(
							new FileOutputStream(path+filename));
					bout.write(barr);
					bout.flush();
					bout.close();
					} catch (Exception e) {
						System.out.println(e);
					}
			}
			String msg = "";
			int result = dao.insertcontent(board);
			if(result==1){
				msg="success! Insert your Info.";
			} else {
				msg="fail! yout Info.";
			}
			ModelAndView mav = new ModelAndView("society_board/society_boardresult");
			mav.addObject("s_hobby",board.getB_dept1());
			mav.addObject("s_dept",board.getB_dept2());
			
			return mav;
		}
		// society list 부분 구현
		@RequestMapping(value = "/society_board_list", method = RequestMethod.GET)
		public ModelAndView society_board_list(@ModelAttribute("Society_Board") Society_Board board,HttpServletRequest request,@ModelAttribute("boardpaging") BoardPaging boardpaging,
											   @RequestParam String s_hobby,@RequestParam int s_dept) {
			Society_BoardDao dao = sqlSession.getMapper(Society_BoardDao.class);
			this.selectbox="b_title";
			this.find="";
			Map params = new HashMap();
	        params.put("b_dept1",s_hobby);
	        params.put("b_dept2",s_dept);
	        int rowcount = dao.selectCountAll(params);
			//오류부분  
			int pageSize = 10;
			int absPage = 0;
			if(rowcount>0 && rowcount%pageSize != 0)
				absPage = 1;
			int pageCount = rowcount / pageSize + absPage;
			int pages[] = new int[pageCount];
			for(int i = 0 ; i< pageCount; i++){
				pages[i] = i+1;
			}
			HttpSession session=request.getSession();
			String result = (String) session.getAttribute("sessionid");
			ModelAndView mav = new ModelAndView("society_board/society_board_list");
			ArrayList<Society_Board> boards = dao.selectAll(params);
			mav.addObject("s_hobby",s_hobby);
			mav.addObject("s_dept",s_dept);
			mav.addObject("boardpaging",boardpaging);
			mav.addObject("boards",boards);
			mav.addObject("pages",pages);
			return mav;
		}				
		@RequestMapping(value = "/society_boardPageList", method = {RequestMethod.GET, RequestMethod.POST})
		public ModelAndView society_boardPageList(@ModelAttribute("boardpaging") BoardPaging boardpaging,
												  @RequestParam String s_hobby,@RequestParam int s_dept) {
			Society_BoardDao dao = sqlSession.getMapper(Society_BoardDao.class);
			ModelAndView mav = new ModelAndView("society_board/society_board_list");
			this.selectbox = boardpaging.getSelectbox();
			this.find = boardpaging.getFind();
			boardpaging.setB_dept1(s_hobby);
			boardpaging.setB_dept2(s_dept);
			int rowcount = dao.selectCount(boardpaging);
			int pageSize = 10;
			int pageCount = 0;
			int absPage = 0;
			if(selectedPage == 0)
				selectedPage =1;
			int startrow = (selectedPage - 1) *pageSize;
			int endrow = startrow + 10;
			boardpaging.setStartrow(startrow);
			boardpaging.setEndrow(endrow);
			ArrayList<Society_Board> boards = dao.selectPageList2(boardpaging);
			if(rowcount>0 && rowcount%pageSize != 0)
				absPage = 1;
			pageCount = rowcount / pageSize + absPage;
			int pages [] =new int[pageCount];
			for(int i = 0 ; i< pageCount; i++){
				pages[i] = i+1;
			}
			mav.addObject("boardpaging",boardpaging);
			mav.addObject("boards",boards);
			mav.addObject("pages",pages);
			return mav;
		}	
		@RequestMapping(value = "/society_boardpageselect", method = RequestMethod.GET)
		public ModelAndView society_boardpageselect(@RequestParam int page,@ModelAttribute("boardpaging") BoardPaging boardpaging,
													@RequestParam String s_hobby,@RequestParam int s_dept) {
			Society_BoardDao dao = sqlSession.getMapper(Society_BoardDao.class);
			ModelAndView mav = new ModelAndView("society_board/society_board_list");
			boardpaging.setSelectbox(this.selectbox);
			boardpaging.setFind(this.find);
			boardpaging.setB_dept1(s_hobby);
			boardpaging.setB_dept2(s_dept);
			int rowcount = dao.selectCount(boardpaging);
			int pageSize = 10;
			int absPage = 0;
			int startrow = (page - 1) * pageSize;
			int endrow = startrow + 10;
			boardpaging.setStartrow(startrow);
			boardpaging.setEndrow(endrow);
			ArrayList<Society_Board> boards = dao.selectPageList2(boardpaging);
			if(rowcount>0 && rowcount%pageSize != 0)
				absPage = 1;
			int pageCount = rowcount / pageSize + absPage;
			int pages [] =new int[pageCount];
			for(int i = 0 ; i< pageCount; i++){
				pages[i] = i+1;
			}
			mav.addObject("boardpaging",boardpaging);
			mav.addObject("boards",boards);
			mav.addObject("pages",pages);
			
			return mav;
		}				
		@RequestMapping(value = "/societyboardreadform", method = RequestMethod.GET)
		public ModelAndView societyboardreadform(@RequestParam("b_seq") int b_seq,
												 @RequestParam("s_hobby") String s_hobby,@RequestParam("s_dept") int s_dept) {
			Society_BoardDao dao = sqlSession.getMapper(Society_BoardDao.class);
			dao.updateHit(b_seq);		
			Society_Board board = dao.selectOne(b_seq);
			Map params = new HashMap();
	        params.put("b_seq",b_seq);
	        params.put("s_hobby",s_hobby);
	        params.put("s_dept",s_dept);
			ArrayList<Society_Reply> replys = dao.replySelectAll(params);
			int reply_countall = dao.select_replycount(params);
			ModelAndView mav = new ModelAndView("society_board/society_board_read_form");
			mav.addObject("count",reply_countall);
			mav.addObject("board",board);
			mav.addObject("replys",replys);
			mav.addObject("s_hobby",s_hobby);
			mav.addObject("s_dept",s_dept);
			
			return mav;
		}				
		@RequestMapping(value = "/society_board_update_form", method = RequestMethod.GET)
		public ModelAndView society_boardupdateform(@RequestParam("b_seq") int b_seq ) {
			Society_BoardDao dao = sqlSession.getMapper(Society_BoardDao.class);
			Society_Board board = dao.selectOne(b_seq);
			dao.updateHit(b_seq);
			ModelAndView mav = new ModelAndView("society_board/society_board_update_form");
			mav.addObject("board",board);
			mav.addObject("b_seq",board.getB_seq());
			mav.addObject("s_hobby",board.getB_dept1());
			mav.addObject("s_dept",board.getB_dept2());
			return mav;
		}
		
		//게시글 수정 부분
		@RequestMapping(value = "/society_boardupdate", method = RequestMethod.POST)
		public ModelAndView society_boardupdate(@ModelAttribute("Society_Board") Society_Board board,HttpServletRequest request,
												@RequestParam("b_seq") int b_seq, @RequestParam CommonsMultipartFile file,
												@RequestParam("s_hobby") String s_hobby,
												@RequestParam("s_dept") int s_dept) {
			Society_BoardDao dao = sqlSession.getMapper(Society_BoardDao.class);
			String b_ip = request.getRemoteAddr();
			SimpleDateFormat simple = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss", Locale.KOREA);
			Date currentdate = new Date();
			String b_date = simple.format(currentdate);
			board.setB_QAtype("1");
			board.setB_ip(b_ip);
			board.setB_date(b_date);
			board.setB_step(0);
			board.setB_hit(0);
			board.setB_level(0);
			board.setB_dept1(s_hobby);
			board.setB_dept2(s_dept);
			String path="D:/KFMT/itschool/src/main/webapp/resources/uploadFolder/";
			String filename=file.getOriginalFilename();
			if(filename.equals("")){
				board.setB_attach(filename);
			} else {
				board.setB_attach(path+filename);
				try {
					byte barr[]=file.getBytes();
					
					BufferedOutputStream bout = new BufferedOutputStream(
							new FileOutputStream(path+filename));
					bout.write(barr);
					bout.flush();
					bout.close();
					} catch (Exception e) {
						System.out.println(e);
					}
			}
			String msg = "";
			int result = dao.updateRow(board);
			if(result==1){
				msg="수정 완료";
			} else {
				msg="수정 실패";
			}
			ModelAndView mav = new ModelAndView("society_board/boardupdatepage");
			mav.addObject("b_seq",b_seq);
			mav.addObject("s_hobby",s_hobby);
			mav.addObject("s_dept",s_dept);
			mav.addObject("msg",msg);
			mav.addObject("result","ok");
			
			return mav;
		}
		
		@RequestMapping(value = "/society_boarddeleterow", method = RequestMethod.GET)
		public String society_boarddeleterow(@RequestParam int b_seq,
											 @RequestParam("s_hobby") String s_hobby,
											 @RequestParam("s_dept") int s_dept
											 ){
			Society_BoardDao dao = sqlSession.getMapper(Society_BoardDao.class);
			//게시글 삭제
			int result = dao.deleteRow(b_seq);
			
			return "redirect:society_board_list?b_seq="+b_seq+"&s_hobby="+s_hobby+"&s_dept="+s_dept;
		}
		
		@RequestMapping(value = "/society_boardreply", method = RequestMethod.GET)
		public ModelAndView society_boardreply(@RequestParam int b_seq ) {
			Society_BoardDao dao = sqlSession.getMapper(Society_BoardDao.class);
			Society_Board board = dao.selectOne(b_seq);
			dao.updateHit(b_seq);
			ModelAndView mav = new ModelAndView("society_board/society_board_read_form");
			mav.addObject("board",board);
			return mav;
		}

		@RequestMapping(value = "/society_boardreadform", method = RequestMethod.GET)
		public ModelAndView society_boardreadform(@RequestParam("b_seq") int b_seq, 
												  @RequestParam("s_hobby") String s_hobby,@RequestParam("s_dept") int s_dept) {
			Society_BoardDao dao = sqlSession.getMapper(Society_BoardDao.class);
			dao.updateHit(b_seq);
			Society_Board board = dao.selectOne(b_seq);
			Map params = new HashMap();
	        params.put("b_seq",b_seq);
	        params.put("s_hobby",s_hobby);
	        params.put("s_dept",s_dept);
			ArrayList<Society_Reply> replys = dao.replySelectAll(params);
			ModelAndView mav = new ModelAndView("society_board/society_board_read_form");
			mav.addObject("board",board);
			mav.addObject("replys",replys);
			return mav;
		}
		
		@RequestMapping(value = "/society_boardSelectDelete", method = RequestMethod.GET)
		public ModelAndView society_boardSelectDelete(@RequestParam int saveseq[],
													  @RequestParam String s_hobby,
													  @RequestParam int s_dept) {
			Society_BoardDao dao = sqlSession.getMapper(Society_BoardDao.class);
			for(int seqs: saveseq){
			}
			ModelAndView mav = new ModelAndView("redirect:society_board_list?&s_hobby="+s_hobby+"&s_dept="+s_dept);
			for(int seqs: saveseq){
				dao.deleteRow(seqs);
			}
			return mav;
			
		}
		
		@RequestMapping(value = "/society_replyInsert", method = RequestMethod.GET)
		public ModelAndView society_replyInsert(@RequestParam int b_seq, @ModelAttribute("Society_reply") Society_Reply reply,HttpServletRequest request,
										  @RequestParam String s_hobby,@RequestParam int s_dept) {
			HttpSession session = request.getSession();
			String id = (String) session.getAttribute("sessionid");
			String name = (String) session.getAttribute("sessionname");
			SimpleDateFormat simple = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss", Locale.KOREA);
			Date currentdate = new Date();
			String date = simple.format(currentdate);
			reply.setR_seq(b_seq);
			reply.setR_date(date);
			reply.setR_id(id);
			reply.setR_name(name);
			reply.setR_content(reply.getR_content());
			reply.setR_dept(s_hobby);
			Society_BoardDao dao = sqlSession.getMapper(Society_BoardDao.class);
			int result = dao.insertReply(reply);
			ModelAndView mav = new ModelAndView("redirect:societyboardreadform");
			mav.addObject("b_seq",b_seq);
			mav.addObject("s_hobby",s_hobby);
			mav.addObject("s_dept",s_dept);
			return mav;
		}			

		@RequestMapping(value = "/delete_replyRow", method = RequestMethod.GET)
		public String delete_replyRow(@RequestParam int b_seq,
									  @RequestParam int r_no,@RequestParam String s_hobby,
									  @RequestParam int s_dept,
									  HttpServletRequest request) {
			Society_BoardDao dao = sqlSession.getMapper(Society_BoardDao.class);
	        int result = dao.delete_replyRow(r_no);
			return "redirect:societyboardreadform?b_seq="+b_seq+"&s_hobby="+s_hobby+"&s_dept="+s_dept;
		}	
		
		//게시글삭제
		@RequestMapping(value = "/societyBoardDelete", method = RequestMethod.GET)
		public ModelAndView society_BoardDelete(@RequestParam int b_seq,@RequestParam String s_hobby,@RequestParam int s_dept) {
			Society_BoardDao dao = sqlSession.getMapper(Society_BoardDao.class);
			ModelAndView mav = new ModelAndView("society_board/society_delete_message?b_seq="+b_seq+"&s_hobby="+s_hobby+"&s_dept="+s_dept);
			mav.addObject("b_seq",b_seq);
			mav.addObject("s_hobby",s_hobby);
			mav.addObject("s_dept",s_dept);
			return mav;
		}
		
		@RequestMapping(value = "/society_Board_Delete", method = RequestMethod.GET)
		public ModelAndView society_Board_Delete(@RequestParam int b_seq,@RequestParam String s_hobby,@RequestParam int s_dept) {
			Society_BoardDao dao = sqlSession.getMapper(Society_BoardDao.class);
			//게시글삭제 부분
			Map params = new HashMap();
	        params.put("b_seq",b_seq);
	        params.put("s_hobby",s_hobby);
	        params.put("s_dept",s_dept);
	        dao.society_deleteRow(params);
	        //댓글삭제 부분 수정
			ModelAndView mav = new ModelAndView("redirect:society_board_list");
			mav.addObject("s_hobby",s_hobby);
			mav.addObject("s_dept",s_dept);
			return mav;
		}
		
}
