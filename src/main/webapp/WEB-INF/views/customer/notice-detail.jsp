<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

         <main id="main">
      
            <h2 class="main-title">공지사항 등록</h2>
            
               <div class="breadcrumb">
                  <h3 class="hidden">현재경로</h3>
                  <ul>
                     <li>home</li>
                     <li>고객센터</li>
                     <li>공지사항</li>
                  </ul>
               </div>
                
               <table border="1">
                  <tbody>
                     <tr>
                        <th>제목</th>
                        <td>
                           ${n.title}
                        </td>
                     </tr>
                     <tr>
                       <th>작성자</th>
                       <td>
                          ${n.writer}
                  </td>
                     </tr>
                       <tr>
                        <th>작성일</th>
                        <td>
                          ${n.regDate}
                        </td>
                     </tr>
                     <tr>
                        <th>조회수</th>
                        <td>
                            ${n.hit}
                        </td>
                     </tr>              
                     <tr>
                        <th>첨부파일</th>
                  <td>
                     <%
                        
                     /* List ns = new ArrayList();
                        ns.add("헬로우");
                        ns.add("굿바이");
                        ns.add("그라탕");
                        ns.add("헬로우1");
                        ns.add("굿바이2");
                        ns.add("그라탕3");

                        pageContext.setAttribute("ns", ns); */
                        
                        String hbs = "롤,야구,코딩,먹기,자기";
                        pageContext.setAttribute("hbs", hbs);
                     %> 
                     <c:forTokens var="hb" items="${hbs}" delims=",">
                        ${hb }<br/>
                     </c:forTokens>
                     <%-- <c:forEach var="data" items="${ns}" begin="0" end="3" varStatus="st">                     
                                 맥보~이~~${data}${st.index}<br/> </c:forEach> --%>
                                 <!--st.current는 값 st.index는 인덱스번호-->
                     <c:forEach var="f" items="${list}">
                     <a href="upload/${f.src}" download>${f.src}</a>
                     <!-- download는 크롬에서만 지원함 -->
                     </c:forEach>
                  </td>
               </tr>
                     <tr>                  
                        <td colspan="2">
                           ${n.content }
                           <img src="upload/"/>
                        </td>
                     </tr>   
                  </tbody>
               </table>
               <div>      
                    <a href="notice">목록</a>
                  <a href="notice-edit?c=${n.code }">수정</a>
                  <a href="notice-del?c=${n.code }">삭제</a>
               </div>
            <div>
               <ul>
                  <li>
                     <span>다음글:</span>
                     <c:if test="${not empty next }">
                     <a href="?c=${next.code }">${next["title"] }</a>
                     <!-- 이렇게 두가지가 모두 가능함 -->
                     </c:if>
                     <c:if test="${empty next }">
                     <span>다음글이 존재하지 않습니다.</span>
                     </c:if>
                     
                     <%-- <%if(next==null){ %>
                     <span>다음글이 존재하지 않습니다.</span>
                     <%}else{ %>
                     <a href="?c=${next.code }">${next.title }</a>
                     <%} %> --%>
                  </li>
                  <li>
                     <span>이전글:</span> 
                     <a href="?c=${prev.code }">${prev.title }</a>
                  </li>               
               </ul>
            </div>
         </main>