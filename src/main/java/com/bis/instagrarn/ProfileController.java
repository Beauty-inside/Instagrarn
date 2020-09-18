package com.bis.instagrarn;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import common.Common;
import service.ProfileService;
import vo.ProfileVO;
import vo.UploadVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class ProfileController {
	
	@Autowired //Spring으로 부터 application정보를 자동으로 받는다
	ServletContext application;
	
	@Autowired
	ProfileService profileService;
	
	@RequestMapping(value = "/addpost", method = RequestMethod.GET)
	public String home() {

		return Common.Profile.VIEW_PATH + "addpost.jsp";
	}
	
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public String main(ProfileVO vo) throws IOException {

		String webPath = "/resources/post/"; //절대경로
		String savePath = application.getRealPath(webPath);
		System.out.println(vo.getArea() + vo.getContent());
		System.out.println(vo.getFile().toString());
		MultipartFile photo = vo.getFile();

		byte[] data = photo.getBytes();//여러개일경우 대비 아직 구현안함

		String filename = "no_file";

		if(!photo.isEmpty()) {//업로드 된 파일이 존재한다면....=>비어있지 않으니까
			filename = photo.getOriginalFilename(); //파일 이름 저장

			//파일 저장할 경로
			File saveFile = new File(savePath, filename); //savePath 경로에 filename저장

			if(!saveFile.exists()) {//처음 저장해서 경로 없을 때
				saveFile.mkdirs(); 
			}else {
				//동일명일때 시간넣어서 해줘,,,,
				long time = System.currentTimeMillis();//이 메시지가 나올때의 시간
				filename = String.format("%d_%s", time, filename);
				saveFile = new File(savePath, filename);
			}

			try {
				//임시저장소는 곧 사라져서 저장해둬야해
				photo.transferTo(saveFile);
				vo.setImg(filename);
				
				int result = profileService.upload(vo);
				System.out.println(result);

			} catch (Exception e) {
				e.printStackTrace();
			}
		}//if

		

		return "redirect:profile";
	}
	
	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public String profile(Model model) {
		int user_idx = 1;
		List<ProfileVO> list = profileService.select(user_idx);
		
		
		model.addAttribute("list", list);
		

		return Common.Profile.VIEW_PATH + "profile.jsp";
	}
	
}
