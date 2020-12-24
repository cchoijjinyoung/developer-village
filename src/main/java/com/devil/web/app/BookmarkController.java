package com.devil.web.app;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.devil.domain.Bookmark;
import com.devil.domain.User;
import com.devil.service.ArticleService;
import com.devil.service.BookmarkService;

@Controller
@RequestMapping("/bookmark")
public class BookmarkController {

  @Autowired
  BookmarkService bookmarkService;
  @Autowired
  ArticleService articleService;

  @RequestMapping("add")
  public String add(Bookmark bookmark, HttpSession httpSession, HttpServletRequest request) throws Exception {
    bookmark.setUserNo(((User) httpSession.getAttribute("loginUser")).getNo());
    bookmarkService.add(bookmark);
    return "redirect:" + request.getHeader("Referer");
  }

  @RequestMapping("delete")
  public String delete(Bookmark bookmark, HttpSession httpSession, HttpServletRequest request) throws Exception {
    bookmark.setUserNo(((User) httpSession.getAttribute("loginUser")).getNo());
    bookmarkService.delete(bookmark);
    return "redirect:" + request.getHeader("Referer");
  }

  @RequestMapping("list")
  public void list(HttpSession httpSession, Model model) throws Exception {
    model.addAttribute("bookmarkList", articleService.bookmarkList((User) httpSession.getAttribute("loginUser")));
  }
}
