package com.ans_list.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ans_list.model.Ans_list_Service;
import com.ans_list.model.Ans_list_VO;

@WebServlet("/front-end/act/ans_list.do")
public class Ans_list_Servlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		HttpSession session = req.getSession();
//		if ("getOne_For_Display".equals(action)) { // 來自select_page.jsp的請求
//
//			List<String> errorMsgs = new LinkedList<String>();
//			// Store this set in the request scope, in case we need to
//			// send the ErrorPage view.
//			req.setAttribute("errorMsgs", errorMsgs);
//
//			/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
//			String str = req.getParameter("sign_up_no");
//			if (str == null || (str.trim()).length() == 0) {
//				errorMsgs.add("請輸入報名編號");
//			}
//			// Send the use back to the form, if there were errors
//			if (!errorMsgs.isEmpty()) {
//				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/act_sign_up/select_page.jsp");
//				failureView.forward(req, res);
//				return;// 程式中斷
//			}
//
//			Integer sign_up_no = null;
//			try {
//				sign_up_no = Integer.valueOf(str);
//			} catch (Exception e) {
//				errorMsgs.add("報名編號格式不正確");
//			}
//			// Send the use back to the form, if there were errors
//			if (!errorMsgs.isEmpty()) {
//				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/act_sign_up/select_page.jsp");
//				failureView.forward(req, res);
//				return;// 程式中斷
//			}
//
//			/*************************** 2.開始查詢資料 *****************************************/
//			Act_sign_up_Service act_sign_upSvc = new Act_sign_up_Service();
//			Act_sign_up_VO act_sign_upVO = act_sign_upSvc.getOneAct_sign_up(sign_up_no);
//			if (act_sign_upVO == null) {
//				errorMsgs.add("查無資料");
//			}
//			// Send the use back to the form, if there were errors
//			if (!errorMsgs.isEmpty()) {
//				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/act_sign_up/select_page.jsp");
//				failureView.forward(req, res);
//				return;// 程式中斷
//			}
//
//			/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
//			req.setAttribute("act_sign_upVO", act_sign_upVO); // 資料庫取出的empVO物件,存入req
//			String url = "/back-end/act_sign_up/listOneAct_sign_up.jsp";
//			RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
//			successView.forward(req, res);
//		}
//
//		if ("getOne_For_Update".equals(action)) { // 來自listAllEmp.jsp的請求
//
//			List<String> errorMsgs = new LinkedList<String>();
//			// Store this set in the request scope, in case we need to
//			// send the ErrorPage view.
//			req.setAttribute("errorMsgs", errorMsgs);
//
//			/*************************** 1.接收請求參數 ****************************************/
//			Integer sign_up_no = Integer.valueOf(req.getParameter("sign_up_no"));
//
//			/*************************** 2.開始查詢資料 ****************************************/
//			Act_sign_up_Service act_sign_upSvc = new Act_sign_up_Service();
//			Act_sign_up_VO act_sign_upVO = act_sign_upSvc.getOneAct_sign_up(sign_up_no);
//
//			/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
//			req.setAttribute("act_sign_upVO", act_sign_upVO); // 資料庫取出的empVO物件,存入req
//			String url = "/back-end/act_sign_up/update_act_sign_up_input.jsp";
//			RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_emp_input.jsp
//			successView.forward(req, res);
//		}
//
//		if ("update".equals(action)) { // 來自update_emp_input.jsp的請求
//
//			List<String> errorMsgs = new LinkedList<String>();
//			// Store this set in the request scope, in case we need to
//			// send the ErrorPage view.
//			req.setAttribute("errorMsgs", errorMsgs);
//
//			/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
//			Integer sign_up_no = Integer.valueOf(req.getParameter("sign_up_no").trim());
//
//			Integer act_no = null;
//			try {
//				act_no = Integer.valueOf(req.getParameter("act_no").trim());
//			} catch (NumberFormatException e) {
//				act_no = 0;
//				errorMsgs.add("活動編號請填數字");
//			}
//
//			Integer mem_no = null;
//			try {
//				mem_no = Integer.valueOf(req.getParameter("mem_no").trim());
//			} catch (NumberFormatException e) {
//				mem_no = 0;
//				errorMsgs.add("會員編號請填數字");
//			}
//
//			Integer accompany_count = null;
//			try {
//				accompany_count = Integer.valueOf(req.getParameter("accompany_count").trim());
//			} catch (NumberFormatException e) {
//				accompany_count = 0;
//				errorMsgs.add("攜伴人數請填數字");
//			}
//
//			
//
//			Act_sign_up_VO act_sign_upVO = new Act_sign_up_VO();
//			act_sign_upVO.setSign_up_no(sign_up_no);
//			act_sign_upVO.setAct_no(act_no);
//			act_sign_upVO.setMem_no(mem_no);
//			act_sign_upVO.setAccompany_count(accompany_count);
//
//
//			// Send the use back to the form, if there were errors
//			if (!errorMsgs.isEmpty()) {
//				req.setAttribute("act_sign_upVO", act_sign_upVO); // 含有輸入格式錯誤的empVO物件,也存入req
//				RequestDispatcher failureView = req
//						.getRequestDispatcher("/back-end/act_sign_up/update_act_sign_up_input.jsp");
//				failureView.forward(req, res);
//				return; // 程式中斷
//			}
//
//			/*************************** 2.開始修改資料 *****************************************/
//			Act_sign_up_Service act_sign_upSvc = new Act_sign_up_Service();
//			act_sign_upVO = act_sign_upSvc.updateAct_sign_up(act_no, mem_no, accompany_count, 
//					sign_up_no);
//
//			/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
//			req.setAttribute("act_sign_upVO", act_sign_upVO); // 資料庫update成功後,正確的的empVO物件,存入req
//			String url = "/back-end/act_sign_up/listOneAct_sign_up.jsp";
//			RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
//			successView.forward(req, res);
//		}

		if ("insert".equals(action)) { // 來自addEmp.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/

			int question_amount = (int) Integer.valueOf(req.getParameter("question_amount").trim());

			int[] question_nolist = new int[question_amount];
			String[] anslist = new String[question_amount];

			for (int i = 0; i < question_amount; i++) {
				question_nolist[i] = Integer.valueOf(req.getParameter("question_no" + (i + 1)).trim());

				if (req.getParameter("ans" + (i + 1)) == null
						|| req.getParameter("ans" + (i + 1)).trim().length() == 0) {
					anslist[i] = "未填";
				} else {
					anslist[i] = req.getParameter("ans" + (i + 1)).trim();
				}
			}

			Integer firm_survey_no = null;
			try {
				firm_survey_no = Integer.valueOf(req.getParameter("firm_survey_no").trim());
			} catch (NumberFormatException e) {
				firm_survey_no = 0;
				errorMsgs.add("會員編號請填數字");
			}

			Integer mem_no = null;
			try {
				mem_no = Integer.valueOf(req.getParameter("mem_no").trim());
			} catch (NumberFormatException e) {
				mem_no = 0;
				errorMsgs.add("攜伴人數請填數字");
			}

			Ans_list_VO ans_list_VO = new Ans_list_VO();
//			ans_list_VO.setQuestion_no(question_no);
//			ans_list_VO.setFirm_survey_no(firm_survey_no);
//			ans_list_VO.setMem_no(mem_no);
//			ans_list_VO.setAns(ans);

			// Send the use back to the form, if there were errors
//			if (!errorMsgs.isEmpty()) {
//				req.setAttribute("ans_list_VO", ans_list_VO); // 含有輸入格式錯誤的empVO物件,也存入req
//				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/act_sign_up/addAct_sign_up.jsp");
//				failureView.forward(req, res);
//				return;
//			}

			/*************************** 2.開始新增資料 ***************************************/
			Ans_list_Service ans_listSvc = new Ans_list_Service();

			for (int i = 0; i < question_amount; i++) {
				ans_list_VO = ans_listSvc.addAns_list(question_nolist[i], firm_survey_no, mem_no, anslist[i]);

			}

			/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
			String url = (String) session.getAttribute("surveyUrl");
//			RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
//			successView.forward(req, res);			
			res.sendRedirect(url);
		}

//		if ("delete".equals(action)) { // 來自listAllEmp.jsp
//
//			List<String> errorMsgs = new LinkedList<String>();
//			// Store this set in the request scope, in case we need to
//			// send the ErrorPage view.
//			req.setAttribute("errorMsgs", errorMsgs);
//
//			/*************************** 1.接收請求參數 ***************************************/
//			Integer sign_up_no = Integer.valueOf(req.getParameter("sign_up_no"));
//
//			/*************************** 2.開始刪除資料 ***************************************/
//			Act_sign_up_Service act_sign_upSvc = new Act_sign_up_Service();
//			act_sign_upSvc.deleteAct_sign_up(sign_up_no);
//
//			/*************************** 3.刪除完成,準備轉交(Send the Success view) ***********/
//			String url = "/back-end/act_sign_up/listAllAct_sign_up.jsp";
//			RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
//			successView.forward(req, res);
//		}
	}

}
