package com.lumodiem.board.adminboard.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lumodiem.board.adminboard.service.ReportService;
import com.lumodiem.board.adminboard.vo.ReportKlass;

@WebServlet("/reportKlass")
public class ReportKlassServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ReportKlassServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String temp = request.getParameter("report_klass_no");
		int reportKlassNo = 0;
		if(temp!=null)reportKlassNo = Integer.parseInt(temp);
		
		System.out.println(temp);
		
		List<ReportKlass> resultList = new ReportService().selectReportKlassList(1);
		RequestDispatcher view = request.getRequestDispatcher("/views/admin/kalassReport.jsp");
		request.setAttribute("resultList", resultList);
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
