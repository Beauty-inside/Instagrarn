package com.bis.instagrarn;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import common.Common;

/**
 * Handles requests for the application home page.
 */
@Controller
public class ProfileController {

	@RequestMapping(value = "/addpost", method = RequestMethod.GET)
	public String home() {

		return Common.Profile.VIEW_PATH + "addpost.jsp";
	}
	
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public String main(MultipartFile file, String content, String area, Model model) {
		
		String webPath = "/resources/upload/";
		String savePath = "c:/myupload";
		System.out.println("save : " + savePath);
		
		MultipartFile photo = file;
		
		System.out.println(file + " / " + photo.toString());
		
		String filename = "no_file";
		
		if(!photo.isEmpty()) {
			filename = photo.getOriginalFilename();
			
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
				System.out.println("잘됨");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		return Common.Profile.VIEW_PATH + "profile.jsp";
	}
}
