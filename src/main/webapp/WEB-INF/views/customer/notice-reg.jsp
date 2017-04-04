<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%>
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
      
   <form method="post" enctype="multipart/form-data">
      <table border="1">
         <tbody>
            <tr>
               <th>제목</th>
               <td><input type="text"  name="title"/></td>
            </tr>
            <tr>
               <th>파일선택</th>
               <td><input type="file" name="files"/></td>
            </tr>
            <tr>
               <th>파일선택</th>
               <td><input type="file" name="files"/></td>
            </tr>
            <tr>                  
               <td colspan="2">       
                  <textarea rows="20" cols="80" name="content"></textarea>
               </td>
            </tr>   
         </tbody>
      </table>
      <div>      
         <input type="submit" value="등록" />         
         <a href="notice">취소</a>
      </div>
   </form>            
</main>
 