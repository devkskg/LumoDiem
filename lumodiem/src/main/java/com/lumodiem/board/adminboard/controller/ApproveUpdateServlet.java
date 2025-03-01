package com.lumodiem.board.adminboard.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.lumodiem.board.adminboard.service.ApproveSerview;
import com.lumodiem.board.adminboard.vo.Approve;

@WebServlet("/approveUpdate")
public class ApproveUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ApproveUpdateServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String temp = request.getParameter("klass_no");
		String approveCode = request.getParameter("approve_code");
		String approveFd = request.getParameter("approve_fd");
		int klassNo=0;
		if(temp!=null) klassNo= Integer.parseInt(temp);
		System.out.println(klassNo+" "+approveCode+" "+approveFd);
		Approve approve = Approve.builder()
				.klassNo(klassNo)
				.approveCode(approveCode)
				.approveFd(approveFd)
				.build();
		System.out.println(approve);
		int result = new ApproveSerview().updateApprove(approve);
		
		
		JSONObject obj = new JSONObject();
		obj.put("res_code", "500");
		obj.put("res_msg", "승인 처리중 오류가 발생하였습니다.");
		
		if(result > 0) {
		obj.put("res_code", "200");
		obj.put("res_msg", "승인되었습니다.");
		}
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().print(obj);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
