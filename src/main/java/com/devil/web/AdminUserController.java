package com.devil.web;

import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.devil.domain.User;
import com.devil.service.FollowService;
import com.devil.service.UserService;

@Controller
@RequestMapping("/admin")
public class AdminUserController {
  @Autowired UserService userService;
  @Autowired ServletContext servletContext;
  @Autowired FollowService followService;

  @RequestMapping("/userDelete")
  public String delete(int no) throws Exception {

    if (userService.delete(no) == 0) {
      throw new Exception("해당 번호의 회원이 없습니다.");
    }
    return "redirect:userList";
  }

  @RequestMapping("/userDetail")
  public ModelAndView detail(int no, HttpSession session, HttpServletRequest request) throws Exception {

    User user = userService.get(no);
    if (user == null) {
      throw new Exception("해당 번호의 유저가 없습니다!");
    }

    ModelAndView mv = new ModelAndView();
    mv.addObject("user", user);

    Map<String, Object> map = new HashMap<>();
    map.put("userNo", ((User)session.getAttribute("loginUser")).getNo());
    map.put("followeeNo", no);
    if (followService.getUser(map) != null) {
      session.setAttribute("followed", true);
    } else {
      session.setAttribute("followed", false);
    }

    mv.setViewName("/admin/userDetail.jsp");
    return mv;
  }

  @RequestMapping("/userList")
  public ModelAndView list(String keyword, HttpSession session) throws Exception {

    ModelAndView mv = new ModelAndView();

    mv.addObject("list", userService.list(keyword));

    mv.addObject("followingUsers", userService.list((User)session.getAttribute("loginUser")));
    mv.setViewName("/admin/userList.jsp");

    return mv;
  }
}