package com.peachmarket.opticyellow.common;

import lombok.Data;

@Data
public class PaginationVO {
	private int listSize = 10; // 한 페이지에 보여질 게시물의 개수 = 초기값으로 목록개수를 10으로 셋팅
	private int rangeSize = 10; // 한 페이지 범위에 보여질 페이지의 개수 = 초기값으로 페이지범위를 10으로 셋팅
	private int page; // 현재 페이지 = 현재 목록의 페이지 번호
	private int range; // 현재 페이지 범위, 각 페이지 범위의 시작 번호
	private int listCnt; // 전체 게시물의 개수
	private int pageCnt; // 전체 페이지 범위의 개수
	private int startPage; // 각 페이지 범위 시작 번호
	private int startList; // 쿼리문 검색 시작 번호 ex) 1~ ~
	private int endList; // 쿼리문 검색 끝 번호 ex) 10
	private int endPage; // 각 페이지 범위 끝 번호
	private boolean prev; // 이전 페이지 여부
	private boolean next; // 다음 페이지 여부

	public void pageInfo(int page, int range, int listCnt) {

		this.page = page;
		this.range = range;
		this.listCnt = listCnt;

		// 전체 페이지수 ex) 실수타입을 얻기위해 형변환 (double)12/10 -> ceil(1.2) -> (Integer)2.0 -> 2
		this.pageCnt = (int) Math.ceil((double) listCnt / listSize);

		// 시작 페이지
		// 1 -> 1,10 -- 2 -> 11,20 -- 3 -> 21,30
		// startIndex: (1-1)*10 + 1 -> 1
		// startIndex: (2-1)*10 + 1 -> 11
		this.startPage = (range - 1) * rangeSize + 1;

		// 끝 페이지
		this.endPage = range * rangeSize;

		// 게시판 시작번호 ex) 1, 10, 20, 30 ...
		if (page == 1) {
			this.startList = 1;
			this.endList = this.startList + 9;
		} else {
			this.startList = (10 * (page - 1)) + 1;
			this.endList = this.startList + 9;
		}

		// 이전 버튼 상태
		this.prev = range == 1 ? false : true;

		// 다음 버튼 상태
		this.next = endPage > pageCnt ? false : true;

		if (this.endPage > this.pageCnt) {
			this.endPage = this.pageCnt;
			this.next = false;
		}
	}
}
