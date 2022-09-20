package com.gogangdo.vo;

public class PaggingVO {
	//전체 게시글 개수
		private int count;
		//현재 페이지 번호
		private int currentPageNo;
		//한페이지당 출력할 게시글 개수
		private int pageOfContentCount;
		//게시판 하단에 나타낼 페이지 번호 개수
		private int pageGroupOfCount;

		public PaggingVO(int count, int currentPageNo, int pageOfContentCount, int pageGroupOfCount) {
			super();
			this.count = count;
			this.currentPageNo = currentPageNo;
			this.pageOfContentCount = pageOfContentCount;
			this.pageGroupOfCount = pageGroupOfCount;
		}
		//현재 페이지 번호
		public int getCurrentPageNo() {
			return currentPageNo;
		}
		//전체 페이지 개수 : 전체 게시글 개수 / 한페이지당 출력할 게시글 개수 + (나머지가 0이 아니면 1)
		public int getTotalPage() {
			return count / pageOfContentCount + (count % pageOfContentCount == 0 ? 0 : 1);
		}
		//전체 페이지 그룹 개수 : 전체 페이지 개수 / 게시판 하단에 나타낼 페이지 번호 개수 + (나머지가 0이 아니면 1)
		public int getTotalPageGroup() {
			return getTotalPage() / pageGroupOfCount + (getTotalPage() % pageGroupOfCount == 0 ? 0:1);
		}
		//현재 페이지 그룹 번호 : 현재 페이지 번호 / 게시판 하단에 나타낼 페이지 번호 개수 + (나머지가 0이 아니면 1)
		public int getNowPageGroupNo() {
			return currentPageNo / pageGroupOfCount + (currentPageNo % pageGroupOfCount == 0 ? 0:1);
		}
		//현재 페이지 그룹 시작 페이지 번호 : (현재 페이지 그룹번호 - 1) * 게시판 하단에 나타낼 페이지 번호 개수 + 1
		public int getStartPageOfPageGroup() {
			return (getNowPageGroupNo() - 1) * pageGroupOfCount + 1;
		}
		//현재 페이지 그룹 마지막 페이지 번호 : 현재 페이지 그룹번호 * 게시판 하단에 나타낼 페이지 번호 개수
		public int getEndPageOfPageGroup() {
			if(getNowPageGroupNo() * pageGroupOfCount > getTotalPage())
				return getTotalPage();
			return getNowPageGroupNo() * pageGroupOfCount;
		}
		//이전 페이지 그룹이 있냐?
		public boolean isPreviousPageGroup() {
			return getNowPageGroupNo() > 1;
		}
		//다음 페이지 그룹이 있냐?
		public boolean isNextPageGroup() {
			return getNowPageGroupNo() < getTotalPageGroup();
		}
		@Override
		public String toString() {
			return "PaggingVO [count=" + count + ", currentPageNo=" + currentPageNo + ", pageOfContentCount="
					+ pageOfContentCount + ", pageGroupOfCount=" + pageGroupOfCount + ", getCurrentPageNo()="
					+ getCurrentPageNo() + ", getTotalPage()=" + getTotalPage() + ", getTotalPageGroup()="
					+ getTotalPageGroup() + ", getNowPageGroupNo()=" + getNowPageGroupNo() + ", getStartPageOfPageGroup()="
					+ getStartPageOfPageGroup() + ", getEndPageOfPageGroup()=" + getEndPageOfPageGroup()
					+ ", isPreviousPageGroup()=" + isPreviousPageGroup() + ", isNextPageGroup()=" + isNextPageGroup() + "]";
		}
}
