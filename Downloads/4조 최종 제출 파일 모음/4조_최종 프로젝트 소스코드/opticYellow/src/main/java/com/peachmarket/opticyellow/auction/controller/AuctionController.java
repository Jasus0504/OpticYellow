package com.peachmarket.opticyellow.auction.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.peachmarket.opticyellow.auction.model.AuctionVO;
import com.peachmarket.opticyellow.auction.service.AuctionService;
import com.peachmarket.opticyellow.interceptor.MySecured;
import com.peachmarket.opticyellow.interceptor.Role;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AuctionController {

	@Autowired
	AuctionService service;

	@Autowired
	HttpSession session;

	@MySecured(secured_role = Role.USER)
	@RequestMapping(value = "/auction_buy_list.do", method = RequestMethod.GET)
	public String auction_buy_list(Model model, AuctionVO vo) {
		log.info("/auction_buy_list.do...{}", vo);

		String buyer = (String) session.getAttribute("user_id");

		// 해당 사용자의 거래 내역을 조회합니다.
		List<AuctionVO> vos = service.auctionBuyList(vo);

		model.addAttribute("vos", vos);

		return "member/auction_List";

	}

}
