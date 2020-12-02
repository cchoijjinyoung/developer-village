package com.devil.web;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.devil.service.UserService;

@MultipartConfig(maxFileSize = 1024 * 1024 * 10)
@WebServlet("/user/followTag")
public class UserFollowTagServlet extends HttpServlet {
  private static final long serialVersionUID = 1L;

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    ServletContext ctx = request.getServletContext();
    UserService userService =
        (UserService) ctx.getAttribute("userService");

    //    User user = new User();
    //    user.setNo(c));
    //    user.setNo()
    //
    //
    //    if (loginUser != null) {
    //      .setWriter(loginUser);
    //      articleService.add(article);
    //      out.println("게시글을 등록했습니다.");
    //    } else {
    //      out.println("로그인을 해주세요!");
    //    }

    response.setContentType("text/html;charset=UTF-8");
    PrintWriter out = response.getWriter();

    out.println("<!DOCTYPE html>");
    out.println("<html>");
    out.println("<head>");
    out.printf("<meta http-equiv='Refresh' content='1;url=detail?no=%d'>",
        user.getNo());
    out.println("<title>회원사진수정</title></head>");
    out.println("<body>");

    try {
      out.println("<h1>회원 사진 수정</h1>");

      if (user.getPhoto() != null) {
        userService.update(user);
        out.println("<p>회원 사진을 수정하였습니다.</p>");
      } else {
        out.println("<p>사진을 선택하지 않았습니다.</p>");
      }

    } catch (Exception e) {
      request.setAttribute("exception", e);
      request.getRequestDispatcher("/error").forward(request, response);
      return;
    }
    out.println("</body>");
    out.println("</html>");
  }
}