package com.bis.instagrarn;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import common.Common;
import service.ProfileService;
import service.UserService;
import vo.ProfileVO;
import vo.UserVO;

@Controller
public class HomeController {
	
	@Autowired //Spring으로 부터 application정보를 자동으로 받는다
	ServletContext application;
	
	@Autowired
	UserService userService;
	
	@Autowired
	ProfileService profileService;

	@Autowired
	HttpServletRequest request;
	
	//메인페이지, 로그인 후 첫 페이지
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main(Model model, HttpSession session) {
		int user_idx = 0;
		//------------------------------------
		int user_info_idx = 0;
		String user_info_id = "";
		String user_info_fullname = "";
		Cookie[] cookies = request.getCookies();
		if(cookies == null) {
			return Common.User.VIEW_PATH + "login.jsp";
		}else {
			for (Cookie cookie : cookies) {
				if("rememberSession".equals(cookie.getName())) {

					session = request.getSession();
					UserVO session_info = (UserVO)session.getAttribute(cookie.getValue());
					if(session_info == null) {//세션이 없을때 오류 방지  == > 가입하면 바로 로그인 될 때 세션없음 가입에 세션 추가기능 넣어주면 될 듯
						return Common.User.VIEW_PATH + "login.jsp";
					}else {
						user_info_id = session_info.getId();
						user_info_fullname = session_info.getFullname();
						user_info_idx = session_info.getIdx();
						user_idx = user_info_idx;
					}
				}
			}
		}
		//------------------------------------
		List<ProfileVO> list = profileService.select_post(user_idx, 0);
		List<Integer> likelist = profileService.select_like(user_idx);
		List<UserVO> recommend_list = profileService.select_recommend(user_idx);

		for(int i = 0; i<list.size(); i++) {	
			List<UserVO> userlist = new ArrayList<UserVO>();
			UserVO uservo = userService.select_id(list.get(i).getUser_idx());
			userlist.add(uservo);

			if(likelist.contains(list.get(i).getBoard_idx())) {
				list.get(i).setIsLike(true);
			} else {
				list.get(i).setIsLike(false);
			}
			List<List<String>> replylist = profileService.select_reply(list.get(i).getBoard_idx());
			list.get(i).setReplys(replylist);
		}

		model.addAttribute("user_info_id", user_info_id);
		model.addAttribute("user_info_fullname", user_info_fullname);
		model.addAttribute("user_info_idx", user_info_idx);
		model.addAttribute("loadlist", list);
		model.addAttribute("likelist", likelist);
		model.addAttribute("recommendlist", recommend_list);

		return Common.Board.VIEW_PATH + "main.jsp";
	}
	
	//게시글 불러오기
	@RequestMapping(value = "/loadpost", method = RequestMethod.GET)
	@ResponseBody
	public List<ProfileVO> loadpost(Model model, @RequestParam(value="page", defaultValue="1")int page) {
		int user_idx = 0;
		//-------------------
		Cookie[] cookies = request.getCookies();
		String user_id_info = "";
		if(cookies == null) {
			
		}else {
			for (Cookie cookie : cookies) {
				if("rememberSession".equals(cookie.getName())) {
					HttpSession session = request.getSession();
					UserVO session_info = (UserVO)session.getAttribute(cookie.getValue());
					if(session_info == null) {
		               
		            }else {
		            	user_id_info = session_info.getId();
		            	user_idx = session_info.getIdx();
		            }
				}
			}
		}
		//-------------------
		List<ProfileVO> list = profileService.select_post(user_idx, page);
		List<Integer> likelist = profileService.select_like(user_idx);
		for(int i = 0; i<list.size(); i++) {
			if(likelist.contains(list.get(i).getBoard_idx())) {
				list.get(i).setIsLike(true);
			} else {
				list.get(i).setIsLike(false);
			}
			List<List<String>> replylist = profileService.select_reply(list.get(i).getBoard_idx());
			list.get(i).setReplys(replylist);
		}
		return list;
	}
	
	//알람 불러오기
	@RequestMapping(value = "/loadalert", method = RequestMethod.GET)
	@ResponseBody
	public List<List<String>> loadalert(Model model, int user_idx) {
		List<List<String>> loadAlertList = profileService.loadalert(user_idx);
		return loadAlertList;
	}
	
	//댓글달기
	@RequestMapping(value = "/add_reply", method = RequestMethod.GET)
	@ResponseBody
	public int add_reply(Model model, int board_idx, String reply) {
		int user_idx = 0;
		//------------------------
		Cookie[] cookies = request.getCookies();
		if(cookies == null) {
			
		}else {
			for (Cookie cookie : cookies) {
				if("rememberSession".equals(cookie.getName())) {
					HttpSession session = request.getSession();
					UserVO session_info = (UserVO)session.getAttribute(cookie.getValue());
					if(session_info == null) {
		               
		            }else {
		            	user_idx = session_info.getIdx();
		            }
				}
			}
		}
		//------------------------
		int from_user_idx = user_idx;
		int to_user_idx = 1;
		String alert_type = "reply";
		profileService.add_reply(board_idx, user_idx, reply);
		profileService.add_alert(from_user_idx, to_user_idx, alert_type);
		return board_idx;
	}
	
	//좋아요
	@RequestMapping(value = "/clickLike", method = RequestMethod.GET)
	@ResponseBody
	public int clickLike(Model model, int board_idx) {
		int user_idx = 0;
		//------------------------
		Cookie[] cookies = request.getCookies();
		if(cookies == null) {
			
		}else {
			for (Cookie cookie : cookies) {
				if("rememberSession".equals(cookie.getName())) {
					HttpSession session = request.getSession();
					UserVO session_info = (UserVO)session.getAttribute(cookie.getValue());
					if(session_info == null) {
		               
		            }else {
		            	user_idx = session_info.getIdx();
		            }
				}
			}
		}
		//------------------------
		int from_user_idx = user_idx;
		int to_user_idx = 1;
		String alert_type = "like";
		profileService.clicked_like(board_idx, user_idx);
		profileService.add_alert(from_user_idx, to_user_idx, alert_type);
		return board_idx;
	}
	
	//좋아요 취소
	@RequestMapping(value = "/clickUnLike", method = RequestMethod.GET)
	@ResponseBody
	public int clickUnLike(Model model, int board_idx) {
		int user_idx = 0;
		//------------------------
		Cookie[] cookies = request.getCookies();
		if(cookies == null) {
			
		}else {
			for (Cookie cookie : cookies) {
				if("rememberSession".equals(cookie.getName())) {
					HttpSession session = request.getSession();
					UserVO session_info = (UserVO)session.getAttribute(cookie.getValue());
					if(session_info == null) {
		               
		            }else {
		            	user_idx = session_info.getIdx();
		            }
				}
			}
		}
		//------------------------
		int res = profileService.unclicked_like(board_idx, user_idx);
		return board_idx;
	}
	
	//로그인 페이지, 첫 페이지
	@RequestMapping(value = {"/", "/loginpage"})
	public String loginpage() {
		return Common.User.VIEW_PATH + "login.jsp";
	}
	
	//쿠키 확인
	@RequestMapping("/cookie_check")
	@ResponseBody
	public String first() {
		Cookie[] cookies = request.getCookies();
		String user_id_info = "";
		if(cookies == null) {
			return Common.User.VIEW_PATH + "login.jsp";
		}else {
			for (Cookie cookie : cookies) {
				if("rememberSession".equals(cookie.getName())) {

					HttpSession session = request.getSession();
					UserVO session_info = (UserVO)session.getAttribute(cookie.getValue());
					if(session_info == null) {//세션이 없을때 오류 방지  == > 가입하면 바로 로그인 될 때 세션없음 가입에 세션 추가기능 넣어주면 될 듯
		               return "";
		            }else {
		            	user_id_info = session_info.getId();
		            }
				}
			}
		}
		return user_id_info;
	}
	
	//로그인
	@RequestMapping(value = "/login")
	public String login(UserVO vo, HttpServletResponse response) {
		UserVO login_vo;
		//비밀번호 없으면 구글 로그인
		try {
			vo.getPwd();
		} catch (Exception e) {
			login_vo = userService.signinGoogle(vo);
		}
		
		//일반 로그인
		login_vo = userService.signin(vo);
		if( login_vo != null ) {
			
			//로그인 성공할때만 전에 저장해둔 정보들 지우기
			Cookie[] cookies = request.getCookies();
			String user_id_info = "";
			if(cookies == null) {
				return Common.User.VIEW_PATH + "login.jsp";
			}else {
				for (Cookie cookie : cookies) {
					if("rememberSession".equals(cookie.getName())) {
						HttpSession session = request.getSession();
						session.removeAttribute(cookie.getValue());
						cookie.setValue(null);
					}
				}
			}
			
			int idx = login_vo.getIdx();
			String fullname = login_vo.getFullname();
			String id = login_vo.getId();
			System.out.println(fullname+"님 로그인 성공");
			
			//그러고 나서 새로운 로그인 정보 세션저장
			HttpSession session = request.getSession();
			
			Common com = new Common();
			
			String sessionKey = com.sessonKey();

			session.setAttribute(sessionKey, login_vo);
			
			Cookie cookie= new Cookie("rememberSession", sessionKey);
			cookie.setPath("/");
			cookie.setMaxAge(60*60*24*7);//일주일간 가게
			response.addCookie(cookie);
			
		} else {
			System.out.println("로그인 실패");
		}
		return "redirect:main";
	}

	//회원가입 페이지 이동
	@RequestMapping(value =  "/signuppage")
	public String signuppage() {
		return Common.User.VIEW_PATH + "signup.jsp";
	}
	
	//회원가입
	@RequestMapping(value = "/signup")
	public String signup(UserVO vo) {
		int res = userService.signup(vo);
		return Common.User.VIEW_PATH + "login.jsp";
	}
	
	//아이디 중복 체크
	@RequestMapping("/id_check.do")
	@ResponseBody
	public String id_check(String phone, String id) {
		int res = userService.signup_check_EorP(phone);
		int res2 = userService.signup_check_id(id);
		String result = "";
		if(res != 1) {
			result = "no";
			return result;
		}
		if(res2 != 1) {
			result = "duple id";
			return result;
		}
		result = "yes";
		return result;
	}
	
	@RequestMapping("/follow")
	public String following(int follow_idx) {
		Cookie[] cookies = request.getCookies();
		int user_idx = 0;
		if(cookies == null) {
			
		}else {
			for (Cookie cookie : cookies) {
				if("rememberSession".equals(cookie.getName())) {
					HttpSession session = request.getSession();
					UserVO session_info = (UserVO)session.getAttribute(cookie.getValue());
					if(session_info == null) {
		               
		            }else {
		            	user_idx = session_info.getIdx();
		            }
				}
			}
		}
		userService.follow(user_idx, follow_idx);
		return "redirect:main";
	}
	
	//팔로우 리스트 모두 보기
	@RequestMapping(value =  "/seeallfollow")
	public String SeeAllFollow(Model model) {
		int user_idx = 0;
		//-------------------
		Cookie[] cookies = request.getCookies();
		if(cookies == null) {
			
		}else {
			for (Cookie cookie : cookies) {
				if("rememberSession".equals(cookie.getName())) {
					HttpSession session = request.getSession();
					UserVO session_info = (UserVO)session.getAttribute(cookie.getValue());
					if(session_info == null) {
		               
		            }else {
		            	user_idx = session_info.getIdx();
		            }
				}
			}
		}
		List<UserVO> follow_list = profileService.select_recommend(user_idx);
		model.addAttribute("followlist", follow_list);
		return Common.User.VIEW_PATH + "seeallfollow.jsp";
	}
	
}
