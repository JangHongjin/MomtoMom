<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- jstl 코어 태그 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- context 경로 -->
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!-- Section -->
      <section id="section1" class="section-top-padding full-width text-center">
        <h2 class="text-size-50 text-center">MOM to MOM</h2>
        <hr class="break-small background-primary break-center">
        
	        <div class="tab-content">
	        	<div class="centerdivm">
                <div class="centerdiv s-3 m-1 l-1">
                  <a class="image-with-hover-overlay image-hover-zoom" href="board.jsp">
                    <div class="image-hover-overlay background-primary">
                      <div class="image-hover-overlay-content text-center">
                        <h2 class="text-thin">복지맘</h2>
                      </div>
                    </div>
                    <img src="${path}/img/portfolio/thumb-02.jpg" alt="" title="Portfolio Image 1" />
                  </a>
                </div>
                <!--
                <video tabindex="-1" class="video-stream html5-main-video" style="width: 963px; height: 542px; left: 0px; top: 50.6563px;" src="blob:https://www.youtube.com/d36bb143-3e20-488c-a797-ca3ab4353a64"></video>
                -->
                <div class="centerdiv s-3 m-1 l-1">
                  <a class="image-with-hover-overlay image-hover-zoom" href="${path}/user/getAllUser.do">
                    <div class="image-hover-overlay background-primary">
                      <div class="image-hover-overlay-content text-center">
                        <h2 class="text-thin">또래맘</h2>
                      </div>
                    </div>
                    <img src="${path}/img/portfolio/thumb-09.jpg" alt="" title="Portfolio Image 2" />
                  </a>
                </div>
                <div class="centerdiv s-3 m-1 l-1">
                  <a class="image-with-hover-overlay image-hover-zoom" href="board.jsp">
                    <div class="image-hover-overlay background-primary">
                      <div class="image-hover-overlay-content text-center">
                        <h2 class="text-thin">교육맘</h2>
                      </div>
                    </div>
                    <img src="${path}/img/portfolio/thumb-08.jpg" alt="" title="Portfolio Image 3" />
                  </a>
                </div>
                <div class="centerdiv s-3 m-1 l-1">
                  <a class="image-with-hover-overlay image-hover-zoom" href="board.jsp">
                    <div class="image-hover-overlay background-primary">
                      <div class="image-hover-overlay-content text-center">
                        <h2 class="text-thin">경력맘<br>[익명]</h2>
                      </div>
                    </div>
                    <img src="${path}/img/portfolio/thumb-05.jpg" alt="" title="Portfolio Image 4" />
                  </a>
                </div>
                <div class="centerdiv s-3 m-1 l-1">
                  <a class="image-with-hover-overlay image-hover-zoom" href="board.jsp">
                    <div class="image-hover-overlay background-primary">
                      <div class="image-hover-overlay-content text-center">
                        <h2 class="text-thin">알뜰맘</h2>
                      </div>
                    </div>
                    <img src="${path}/img/portfolio/thumb-06.jpg" alt="" title="Portfolio Image 5" />
                  </a>
                </div>
                <div class="centerdiv s-3 m-1 l-1">
                  <a class="image-with-hover-overlay image-hover-zoom" href="board.jsp">
                    <div class="image-hover-overlay background-primary">
                      <div class="image-hover-overlay-content text-center">
                        <h2 class="text-thin">성(姓)<br>[익명]</h2>
                      </div>
                    </div>
                    <img src="${path}/img/portfolio/thumb-11.jpg" alt="" title="Portfolio Image 6" />
                  </a>
                </div>
                <div class="centerdiv s-3 m-1 l-1">
                  <a class="image-with-hover-overlay image-hover-zoom" href="board.jsp">
                    <div class="image-hover-overlay background-primary">
                      <div class="image-hover-overlay-content text-center">
                        <h2 class="text-thin">자유맘</h2>
                      </div>
                    </div>
                    <img src="${path}/img/portfolio/thumb-12.jpg" alt="" title="Portfolio Image 7" />
                  </a>
                </div>
                <div class="centerdiv s-3 m-1 l-1">
                  <a class="image-with-hover-overlay image-hover-zoom" href="board.jsp">
                    <div class="image-hover-overlay background-primary">
                      <div class="image-hover-overlay-content text-center">
                        <h2 class="text-thin">QnA</h2>
                      </div>
                    </div>
                    <img src="${path}/img/portfolio/thumb-07.jpg" alt="" title="Portfolio Image 8" />
                  </a>
                </div>
              </div>
      		</div>      	
        
      </section>
