<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- jstl 코어 태그 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- context 경로 -->
<c:set var="path" value="${pageContext.request.contextPath}"/>


<main role="main">
  <!-- Section -->
  <section id="section1" class="section-top-padding full-width">
    <h2 class="text-size-50 text-center">MOM to MOM</h2>
    <hr class="break-small background-primary break-center">
    <div class="tabs">
        <div class="tab-item tab-active">
          <!-- <a class="tab-label active-btn">워킹맘</a> -->
          <div class="tab-content">
            <div class="s-12 m-6 l-3">
              <a class="image-with-hover-overlay image-hover-zoom" href="board.jsp">
                <div class="image-hover-overlay background-primary">
                  <div class="image-hover-overlay-content text-center padding-2x">
                    <h2 class="text-thin">복지맘</h2>
                    <p>복지 정보를 확인하고 공유!</p>
                  </div>
                </div>
                <img src="${path}/img/portfolio/thumb-02.jpg" alt="" title="Portfolio Image 1" />
              </a>
            </div>
            <!--
            <video tabindex="-1" class="video-stream html5-main-video" style="width: 963px; height: 542px; left: 0px; top: 50.6563px;" src="blob:https://www.youtube.com/d36bb143-3e20-488c-a797-ca3ab4353a64"></video>
            -->
            <div class="s-12 m-6 l-3">
              <a class="image-with-hover-overlay image-hover-zoom" href="${path}/user/getAllUser.do">
                <div class="image-hover-overlay background-primary">
                  <div class="image-hover-overlay-content text-center padding-2x">
                    <h2 class="text-thin">또래맘</h2>
                    <p>자녀 연령대별로 비슷한 경험을 공유!</p>
                  </div>
                </div>
                <img src="${path}/img/portfolio/thumb-09.jpg" alt="" title="Portfolio Image 2" />
              </a>
            </div>
            <div class="s-12 m-6 l-3">
              <a class="image-with-hover-overlay image-hover-zoom" href="board.jsp">
                <div class="image-hover-overlay background-primary">
                  <div class="image-hover-overlay-content text-center padding-2x">
                    <h2 class="text-thin">교육맘</h2>
                    <p>자녀의 교육 관련된 정보 공유 및 상담!</p>
                  </div>
                </div>
                <img src="${path}/img/portfolio/thumb-08.jpg" alt="" title="Portfolio Image 3" />
              </a>
            </div>
            <div class="s-12 m-6 l-3">
              <a class="image-with-hover-overlay image-hover-zoom" href="board.jsp">
                <div class="image-hover-overlay background-primary">
                  <div class="image-hover-overlay-content text-center padding-2x">
                    <h2 class="text-thin">경력맘 [익명]</h2>
                    <p>선배들의 경험담, 후배에게 조언!</p>
                  </div>
                </div>
                <img src="${path}/img/portfolio/thumb-05.jpg" alt="" title="Portfolio Image 4" />
              </a>
            </div>
            <div class="s-12 m-6 l-3">
              <a class="image-with-hover-overlay image-hover-zoom" href="board.jsp">
                <div class="image-hover-overlay background-primary">
                  <div class="image-hover-overlay-content text-center padding-2x">
                    <h2 class="text-thin">알뜰맘</h2>
                    <p>멀쩡한 물건은 버리지 말고 공유!</p>
                  </div>
                </div>
                <img src="${path}/img/portfolio/thumb-06.jpg" alt="" title="Portfolio Image 5" />
              </a>
            </div>
            <div class="s-12 m-6 l-3">
              <a class="image-with-hover-overlay image-hover-zoom" href="board.jsp">
                <div class="image-hover-overlay background-primary">
                  <div class="image-hover-overlay-content text-center padding-2x">
                    <h2 class="text-thin">성(姓) [익명]</h2>
                    <p>직장인으로서, 부모로서 다양한 고민거리 해소!</p>
                  </div>
                </div>
                <img src="${path}/img/portfolio/thumb-11.jpg" alt="" title="Portfolio Image 6" />
              </a>
            </div>
            <div class="s-12 m-6 l-3">
              <a class="image-with-hover-overlay image-hover-zoom" href="board.jsp">
                <div class="image-hover-overlay background-primary">
                  <div class="image-hover-overlay-content text-center padding-2x">
                    <h2 class="text-thin">자유맘</h2>
                    <p>자유롭게 매너롭게 이야기를 공유!</p>
                  </div>
                </div>
                <img src="${path}/img/portfolio/thumb-12.jpg" alt="" title="Portfolio Image 7" />
              </a>
            </div>
            <div class="s-12 m-6 l-3">
              <a class="image-with-hover-overlay image-hover-zoom" href="board.jsp">
                <div class="image-hover-overlay background-primary">
                  <div class="image-hover-overlay-content text-center padding-2x">
                    <h2 class="text-thin">QnA</h2>
                    <p>회사에, 관리자에게 문의사항을 거침없이! </p>
                  </div>
                </div>
                <img src="${path}/img/portfolio/thumb-07.jpg" alt="" title="Portfolio Image 8" />
              </a>
            </div>
          </div>
        </div>
        
     </div>
  </section>

</main>