<%@page import="com.devil.domain.Article"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.devil.domain.Tag"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!-- 커뮤니티 -->
 <div style="margin-left: 70px; font-weight: bold; font-size: 26px;">커뮤니티
  <span style="position: relative; font-weight: normal; font-size: 16px;  left: 480px;">최신글</span>
 </div>
 
<div id ="recentFeed" class="d-grid gap-3"/>
<c:forEach items="${articleList}" var="a" begin="0" end="5">
 <div class="card">
    <div class="row g-0">
      <div class="col-sm-2">
        <div class="text-center mr-2 mt-4">
          <a href='../user/detail?no=${a.writer.no}'><img
            class="card-img-top rounded-circle"
            src='../upload/user/${a.writer.photo}_60x60.jpg'
            alt='[${a.writer.nickname}]' /></a><br> <small>${a.writer.nickname}</small>
        </div>
      </div>
      <div class="col-sm-10">
        <div class="card-body">
          <div style="height: 40px;">
            <c:forEach items="${a.tags}" var="tag">
              <span class="badge"
                style="background-color: ${tag.tagColor}; color: ${tag.fontColor}">${tag.name}</span>
            </c:forEach>
          </div>
          <div class="float-start">
          <h5 class='card-title'>
            <a href='article/${a.no}'>${a.title}</a>
          </h5>
          <p class="card-text">
            <small class="text-muted"><fmt:formatDate
                value="${a.createdDate}" pattern="yyyy.MM.dd" /></small></p>
          </div>
          <div class="position-absolute bottom-0 end-0 mx-3">
            <ul class="list-inline mb-0">
              <li class="list-inline-item"><i class="far fa-comment mr-2"></i></li>
              <li class="list-inline-item">${a.commentCount}</li>
              <li class="list-inline-item"><i class="fas fa-eye mr-2"></i></li>
              <li class="list-inline-item">${a.viewCount}</li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>
</c:forEach>
  <div class="d-grid gap-2">
     <button onclick="location.href='article/list'" class="btn btn-primary" type="button">더보기</button>
  </div>


<!-- 질문 -->
<div id="QAtitle">QnA
  <button onclick="location.href='article/list?categoryNo=2'" 
  class="btn btn-primary" style="margin: 0px; position: absolute;
    right: 0px;" type="button">더보기</button>
 </div>
<table id="QATable">
<c:forEach items="${qnaList}" var="article" begin="0" end="3">
<%--       <c:if
        test="${article.categoryNo == 2 && article.state == 1}">
        <tr>
          <td style="border-radius: 6px 0px 0px 6px;">${article.no}</td>
          <td id='title'>
            <ul id='tags'>
              <c:forEach items="${article.tags}" var="tag">
                <li id='color'
                  style="background-color: ${tag.tagColor}; color: ${tag.fontColor};">${tag.name}</li>
              </c:forEach>
            </ul> <a href='${article.no}'>${article.title}</a><span
            style="color: #6C5DDF;"></span>
          </td>
          <td><i class="fas fa-comment"></i> ${article.commentCount}</td>
          <td>${article.writer.nickname}</td>
          <td style="border-radius: 0px 6px 6px 0px;">${article.viewCount}</td>
        </tr>
      </c:if> --%>
      <c:if test="${param.categoryNo == null && article.categoryNo == 2 && article.state == 1}">
        <tr class="articleRow">
          <td style="border-radius: 6px 0px 0px 6px;">${article.no}</td>
          <td id='title'>
            <ul id='tags'>
              <c:forEach items="${article.tags}" var="tag">
                <li id='color'
                  style="background-color: ${tag.tagColor}; color: ${tag.fontColor};">${tag.name}</li>
              </c:forEach>
            </ul> <a href='${article.no}'>${article.title}</a>
          </td>
          <td><i class="fas fa-comment"></i>${article.commentCount}</td>
          <td>${article.writer.nickname}</td>
          <td style="border-radius: 0px 6px 6px 0px;">${article.viewCount}</td>
        </tr>
      </c:if>
    </c:forEach>
  </table>  
</div>