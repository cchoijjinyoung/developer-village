package com.devil.web;

import java.io.IOException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.devil.domain.Report;
import com.devil.domain.User;
import com.devil.service.ReportService;

@WebServlet("/report/reportArticle")
public class ReportArticleServlet extends HttpServlet {
  private static final long serialVersionUID = 1L;

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    ServletContext ctx = request.getServletContext();
    ReportService reportService =
        (ReportService) ctx.getAttribute("reportService");

    response.setContentType("text/html;charset=UTF-8");

    try {

      Report report = new Report();
      report.setReportTypeNo(Integer.parseInt(request.getParameter("reason")));

      User loginUser = (User) request.getSession().getAttribute("loginUser");
      report.setReporter(loginUser);
      reportService.report(report);
      response.sendRedirect("../article/list");

    } catch (Exception e) {
      request.setAttribute("exception", e);
      request.getRequestDispatcher("/error.jsp").forward(request, response);
      return;
    }
  }
}
