package com.peachmarket.opticyellow.qna.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.peachmarket.opticyellow.allcommu.model.AllCommuLikeVO;
import com.peachmarket.opticyellow.allcommu.model.AllCommuVO;
import com.peachmarket.opticyellow.allcommu.service.AllCommuService;
import com.peachmarket.opticyellow.pagination.PaginationVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class QnaRestController {
	
	@Autowired
	AllCommuService service;
	
	@Autowired
	ServletContext sContext;
	
	@Autowired
	HttpSession session;
	
	@RequestMapping(value = "/json_qna_imgUp.do", method = RequestMethod.POST)
	@ResponseBody
	public String json_commu_imgUp(@RequestParam("file") MultipartFile file) {
		log.info("/json_commu_imgUp.do...");
	    try {
	        // 업로드된 파일을 저장할 경로 설정
	        String realPath = sContext.getRealPath("resources/uploadimg");
	        
	        // 파일 저장
	        String fileName = file.getOriginalFilename();
	        String filePath = realPath + File.separator + fileName;
	        File f = new File(filePath);
	        file.transferTo(f);
	        
	        // 저장된 이미지의 URL 반환
	        String imageUrl = "resources/uploadimg/" + fileName; // 예시 URL
	        return imageUrl;
	    } catch (IOException e) {
	        e.printStackTrace();
	        return null;
	    }
	} // end json_commu_imgUp......
	
}
