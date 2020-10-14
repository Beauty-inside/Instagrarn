package com.bis.instagrarn;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import common.Common;
import service.ProfileService;
import service.UserService;
import vo.ProfileVO;
import vo.UserVO;

@Controller
public class ProfileController {
	
	@Autowired //Spring으로 부터 application정보를 자동으로 받는다
	ServletContext application;
	
	@Autowired
	ProfileService profileService;
	
	@Autowired
	UserService userService;
	
	@Autowired
	HttpServletRequest request;
	
	//프로필 페이지
	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public String profile(int user_idx, Model model, HttpSession session) {
		
		Cookie[] cookies = request.getCookies();
		int user_info_idx = 0;
		String user_info_id = "";
		String user_info_fullname="";
		
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
						user_info_idx = session_info.getIdx();
						user_info_id = session_info.getId();
						user_info_fullname = session_info.getFullname();
					}
				}
			}
		}
		
		model.addAttribute("user_info_id", user_info_id);
		model.addAttribute("user_info_fullname", user_info_fullname);
		model.addAttribute("user_info_idx", user_info_idx);
		
		System.out.println("user_idx : " + user_idx + "user_info_idx : " + user_info_idx);
		if(user_idx == user_info_idx) {
			List<ProfileVO> list = profileService.select(user_info_idx);
			
			model.addAttribute("post_num", list.size());
			model.addAttribute("list", list);
			
			return Common.Profile.VIEW_PATH + "my_profile.jsp";
		}else {
				List<ProfileVO> list_profile = profileService.select(user_idx);
				UserVO uservo = userService.select_id(user_idx);
		
				model.addAttribute("post_num", list_profile.size());
				model.addAttribute("list", list_profile);
				model.addAttribute("user_id", uservo.getId());
				model.addAttribute("user_full_name", uservo.getFullname());
				
			return Common.Profile.VIEW_PATH + "profile.jsp";
		}
	}
	
	//프로필 편집 페이지로 전환
	@RequestMapping(value = "/account", method = RequestMethod.GET)
	public String account_edit(HttpSession session, Model model) {
		Cookie[] cookies = request.getCookies();
		int user_info_idx = 0;
		
		if(cookies == null) {
			return Common.User.VIEW_PATH + "login.jsp";
		}else {
			for (Cookie cookie : cookies) {
				if("rememberSession".equals(cookie.getName())) {

					session = request.getSession();
					UserVO session_info = (UserVO)session.getAttribute(cookie.getValue());
					
					user_info_idx = session_info.getIdx();
				}
			}
		}
		model.addAttribute("user_info_idx", user_info_idx);
		
		return Common.Profile.VIEW_PATH + "edit.jsp";
	}
	
	//게시글 추가 페이지로 전환 
	@RequestMapping(value = "/addpost", method = RequestMethod.GET)
	public String home(HttpSession session, Model model) {
		Cookie[] cookies = request.getCookies();
		int user_info_idx = 0;
		
		if(cookies == null) {
			return Common.User.VIEW_PATH + "login.jsp";
		}else {
			for (Cookie cookie : cookies) {
				if("rememberSession".equals(cookie.getName())) {

					session = request.getSession();
					UserVO session_info = (UserVO)session.getAttribute(cookie.getValue());
					
					user_info_idx = session_info.getIdx();
				}
			}
		}
		model.addAttribute("user_info_idx", user_info_idx);

		return Common.Profile.VIEW_PATH + "addpost.jsp";
	}
	
	//업로드 정보 가지고 와서 기능
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public String main(ProfileVO vo, HttpSession session) throws IOException {

		Cookie[] cookies = request.getCookies();
		int user_info_idx = 0;

		if(cookies == null) {
			return Common.User.VIEW_PATH + "login.jsp";
		}else {
			for (Cookie cookie : cookies) {
				if("rememberSession".equals(cookie.getName())) {

					session = request.getSession();
					UserVO session_info = (UserVO)session.getAttribute(cookie.getValue());
					
					user_info_idx = session_info.getIdx();
					vo.setUser_idx(user_info_idx);
				}
			}
		}
		
		String webPath = "/resources/post/"; //절대경로
		String savePath = application.getRealPath(webPath);
		MultipartFile photo = vo.getFile();

		byte[] data = photo.getBytes();//여러개일경우 대비 아직 구현안함

		String filename = "no_file";

		if(!photo.isEmpty()) {
			filename = photo.getOriginalFilename(); //파일 이름 저장
			File saveFile = new File(savePath, filename);

			if(!saveFile.exists()) {
				saveFile.mkdirs(); 
			}else {
				long time = System.currentTimeMillis();
				filename = String.format("%d_%s", time, filename);
				saveFile = new File(savePath, filename);
			}

			try {

				photo.transferTo(saveFile);
				vo.setImg(filename);
				
				int result = profileService.upload(vo);
				System.out.println(result);

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return "redirect:profile?user_idx="+user_info_idx;
	}
	
	
}
