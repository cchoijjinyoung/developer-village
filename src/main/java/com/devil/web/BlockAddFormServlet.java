package com.devil.web;

import java.io.IOException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.devil.service.ReportService;
import com.devil.service.UserService;

@WebServlet("/block/form")
public class BlockAddFormServlet extends HttpServlet {
  private static final long serialVersionUID = 1L;

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    ServletContext ctx = request.getServletContext();
    ReportService reportService = (ReportService) ctx.getAttribute("reportService");
    UserService userService = (UserService) ctx.getAttribute("userService");
    response.setContentType("text/html;charset=UTF-8");

    try {
      int no = Integer.parseInt(request.getParameter("reportNo"));
      request.setAttribute("report", reportService.get(no));

      // 현재 여기서 넘어가는 reportedUser가 시간이널널임 여길 고쳐야함
      //      User reportedUser = userService.get(
      //          Integer.parseInt(request.getParameter("reportedUser")));

      //Report report = reportService.get(no);
      //System.out.println(report.getReportedArticle().getWriter().getNickname());

      //      Report report = reportService.get(
      //          Integer.parseInt(request.getParameter("reportedUser")));
      //      User reportedUser = report.getReportedUser();

      //      System.out.println(report.getNo());
      //      request.setAttribute("reportedUser", reportedUser);

      request.getRequestDispatcher("/block/form.jsp").include(request, response);

    } catch (Exception e) {
      request.setAttribute("exception", e);
      request.getRequestDispatcher("/error.jsp").forward(request, response);
      return;
    }
  }
}
