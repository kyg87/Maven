package com.newlecture.web.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.ServletContext;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cglib.proxy.Dispatcher;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.newlecture.web.data.dao.NoticeDao;
import com.newlecture.web.data.dao.NoticeFileDao;
import com.newlecture.web.data.entity.Notice;
import com.newlecture.web.data.entity.NoticeFile;
import com.newlecture.web.data.mysql.MySQLNoticeFileDao;
import com.newlecture.web.data.view.NoticeView;

@Controller
//내가 컨트롤러야 하는 작업
@RequestMapping("/customer/*")
public class CustomerController {
   
   @Autowired
   private ServletContext context; 

   @Autowired
   private NoticeDao noticeDao;
   
   @Autowired
   private NoticeFileDao noticeFileDao;
   
   @Autowired
   private SqlSession sqlSession;
   
   
   @RequestMapping("notice")
   //@ResponseBody
   public String notice(
      @RequestParam(value="p", defaultValue="1") Integer page,
      @RequestParam(value="f", defaultValue="Title") String field, 
      @RequestParam(value="q", defaultValue="") String query, 
      Model model){
      
      //return String.format("page:%s, field:%s, query:%s\n", page,field,query);
      int size = noticeDao.getSize(field, query);
      
      int last = 0;      
      
      if(size%10==0)
         last = size/10;
      else if(size%10!=0)
         last = (size/10)+1;   
      
      //List<NoticeView> list = noticeDao.getList();
      List<NoticeView> list = sqlSession.getMapper(NoticeDao.class).getList(page,field,query);
      
      model.addAttribute("list",list);      
      model.addAttribute("last", last);
      model.addAttribute("size", size);
      
      //return "/WEB-INF/views/customer/notice.jsp";
      //뷰에 대한 정보를 반환해줘야함
      return "customer.notice";
   }
   
   @RequestMapping("notice-detail")
   public String noticeDetail(
      @RequestParam(value="c", defaultValue="") String code, Model model){
      
      /*NoticeView n = noticeDao.get(code);
      NoticeView next = noticeDao.next(code);
      NoticeView prev = noticeDao.prev(code);

      List<NoticeFile> list = noticeFileDao.getList(n.getCode());
      
      model.addAttribute("list", list);
      model.addAttribute("prev", prev);
      model.addAttribute("next", next);
      model.addAttribute("n", n);   */
      
	   model.addAttribute("n", 
			   sqlSession.getMapper(NoticeDao.class).get(code));
	   
      return "customer.notice-detail";
   }
   
   @RequestMapping(value="notice-reg", method=RequestMethod.GET)
   public String noticeReg(){
      
      return "customer.notice-reg";
   }
   
   @RequestMapping(value="notice-reg", method=RequestMethod.POST, produces="text/txt; charset=UTF-8")
   //@ResponseBody
   public String noticeReg(
         Notice notice, 
         @RequestParam(value="files")List<MultipartFile> files         
         ) throws IOException{
      //MultipartFile[] files처럼 배열로 받아도 됨
      //System.out.println(notice.getTitle());
         
         String path = context.getRealPath("/resource/upload");
         
         File d = new File(path);
         // 파일 업로드할 경로가 만들어지지 않는다면 만들어야함
         if (!d.exists())// 파일을 업로드할 경로가 존재하지 않는다면
            d.mkdir();
      
         byte[] buf = new byte[1024];
         
         for(MultipartFile file : files){
            if(!file.isEmpty()){
               String fileName = file.getOriginalFilename();
               InputStream fis = file.getInputStream();
               OutputStream fos = new FileOutputStream(path+File.separator+fileName);
               
               int len = 0;
               
               while((len=fis.read(buf))>0)               
                  fos.write(buf, 0, len);            
               
               fis.close();
               fos.close();
            }
         }
      
      //return sb.toString();
      
      notice.setWriter("Koo");
      noticeDao.add(notice);
      
      for(MultipartFile file : files){
         if(!file.isEmpty()){
            String fileName = file.getOriginalFilename();
            NoticeFile f = new NoticeFile();
            f.setNoticeCode(noticeDao.lastCode());
            f.setSrc(fileName);
            
            noticeFileDao.add(f);
         }
      }
      
      return "redirect:notice";
      //return notice.getTitle();
         
      //return path;
   }
   
   @RequestMapping(value="notice-del", method=RequestMethod.GET)
   public String noticeDel(@RequestParam("c") String code){      
      //파일 정보를 얻기
      File f = new File("file");
      f.delete();
      //외래키 제약 조건에 on delete CASCADE가 되어 있는 경우
      //notice 정보만 지우면 됨
      //그렇지 않은 경우 notice file을 먼저 지워야 함 - 외래키 제약조건 오류 발생
      
      noticeDao.delete(code);
      
      return "redirect:notice";
   }
   
   //문서를 달랄때 쓰는 것
   @RequestMapping(value="notice-edit", method=RequestMethod.GET, produces="text/txt; charset=UTF-8")
   public String noticeEdit(Model model,
         @RequestParam("c") String code){
      
      NoticeView n = noticeDao.get(code);
      
      model.addAttribute("n", n);   
      
      return "customer.notice-edit";
   }
   
   //문서를 전달할때 쓰는 것
   @RequestMapping(value="notice-edit", method=RequestMethod.POST, produces="text/txt; charset=UTF-8")
   public String noticeEdit(Notice notice){
      
      noticeDao.update(notice);
      
      return "redirect:notice-detail?c="+notice.getCode();
   }

}