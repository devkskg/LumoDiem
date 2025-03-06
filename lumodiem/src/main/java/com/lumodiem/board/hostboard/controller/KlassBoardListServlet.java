package com.lumodiem.board.hostboard.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lumodiem.board.hostboard.service.HostBoardService;
import com.lumodiem.board.hostboard.vo.Klass;
import com.lumodiem.board.hostboard.vo.KlassDate;

@WebServlet("/klassBoardList")
public class KlassBoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public KlassBoardListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String klassName = request.getParameter("klass_name");
		String accountNickname = request.getParameter("account_nickname");
		String klassTxt = request.getParameter("klass_txt");
		String searchType = request.getParameter("search_type");
		String searchTxt = request.getParameter("search_txt");
		String orderType = request.getParameter("order_type"); 
		String temp = request.getParameter("klass_no");
//		List<KlassDate> dateList = new HostBoardService().selectKlassDate(klassNo);
		
		Klass option = Klass.builder()
				.klassName(klassName)
				.accountNickname(accountNickname)
				.klassTxt(klassTxt)
				.searchType(searchType)
				.searchTxt(searchTxt)
				.orderType(orderType)
				.build();
		
		List<Klass> resultList = new HostBoardService().searchImgBoardList(option);
//		resultList = new HostBoardService().searchImgBoardList(option);
		for(Klass k : resultList) {
			int klassNo = k.getKlassNo();
			List<KlassDate> dateList = new HostBoardService().selectDateList(klassNo);
			k.setDateList(dateList);
		}
		
		
		System.out.println("게시판 result"+resultList);
		
		request.setAttribute("resultList", resultList);
//		request.setAttribute("dateList", dateList);
		System.out.println(resultList);
//		System.out.println("데이트리스트 : "+dateList);
		RequestDispatcher view = request.getRequestDispatcher("/views/klass/klassBoard.jsp");
		view.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
