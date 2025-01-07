package com.peachmarket.opticyellow.auction.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.peachmarket.opticyellow.auction.model.AuctionVO;
import com.peachmarket.opticyellow.auction.service.AuctionService;
import com.peachmarket.opticyellow.bid.model.BidVO;
import com.peachmarket.opticyellow.bid.service.BidService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AuctionRestController {

	@Autowired
	AuctionService service;

	@Autowired
	BidService Bservice;

	@Autowired
	HttpSession session;

	@RequestMapping(value = "/json_auction_buy_list.do", method = RequestMethod.GET)
	@ResponseBody
	public List<AuctionVO> json_auction_buy_list(Model model, AuctionVO vo) {
		log.info("/json_auction_buy_list.do... {}", vo);

		List<AuctionVO> vos = service.auctionBuyList(vo);
		log.info("{}", vos);

		return vos;
	}

	@ResponseBody
	@RequestMapping(value = "/json_auction_sold_list.do", method = RequestMethod.GET)
	public List<AuctionVO> json_auction_sold_list(AuctionVO vo) {

		List<AuctionVO> vos = service.auctionBuyList(vo);
		log.info("{}", vos);
		return vos;
	}


}
