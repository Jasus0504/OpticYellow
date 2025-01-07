package com.peachmarket.opticyellow.game.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.peachmarket.opticyellow.game.model.GameVO;
import com.peachmarket.opticyellow.game.service.GameService;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
public class GameRestController {
	
	@Autowired
	GameService service;
	
	// 민서님 코드
	@RequestMapping(value = "/json_game_list.do", method = RequestMethod.GET)
	@ResponseBody
	public List<GameVO> json_game_list(GameVO vo) {
		log.info("/json_game_list.do... {}",vo);

		List<GameVO> vos = service.gamelist(vo);
		log.info("{}", vos);

		return vos;
	}
	
}
