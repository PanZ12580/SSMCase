package com.hzhang.controller;

import com.hzhang.domain.Book;
import com.hzhang.domain.PageBean;
import com.hzhang.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

/**
 * @author ：Hzhang
 * @date ：Created in 2020/5/1 12:37
 * @description：
 * @modified By：
 * @version: $
 */
@Controller
@RequestMapping("/book")
public class BookController {
    @Autowired
    private BookService bookService;

    @RequestMapping("/allBook")
    public @ResponseBody PageBean allBook(@RequestBody PageBean pb){
        if("null".equals(pb.getQuery())){
            pb.setQuery(null);
        }
        bookService.findAll(pb);
        return pb;
    }

    @RequestMapping(value = "/saveBook", method = RequestMethod.POST, consumes = {"multipart/form-data"})
    public @ResponseBody Map<String, Integer> saveBook(@RequestPart("items") Book book,
                                                       @RequestPart("file") MultipartFile mf,
                                                       HttpServletRequest request){
        String path = request.getSession().getServletContext().getRealPath("/Images/");
        System.out.println(request.getContextPath());
        File file = new File(path);
        if(!file.exists()){
            file.mkdirs();
        }

        String filename = mf.getOriginalFilename();
        filename = UUID.randomUUID().toString().replace("-", "") + "_" + filename;
        try {
            mf.transferTo(new File(path, filename));
        } catch (Exception e) {
            e.printStackTrace();
        }
        book.setBookImg("images" + "\\" + filename);
        Map<String, Integer> map = new HashMap<>();
        int id = bookService.saveBook(book);
        map.put("id", id);
        return map;
    }

    @RequestMapping("/findBook")
    public @ResponseBody Book findBook(@RequestParam("bookId") int bookId){
        return bookService.findById(bookId);
    }

    @RequestMapping(value = "/updateBook", method = RequestMethod.POST)
    public @ResponseBody Map<String, Boolean> updateBook(@RequestPart("items") Book book,
                                                       @RequestPart(name = "file", required = false) MultipartFile mf,
                                                       HttpServletRequest request){
        Map<String, Boolean> map = new HashMap<>();
        if(mf != null && !mf.isEmpty()){
            String path = request.getSession().getServletContext().getRealPath("/Images/");
            System.out.println(request.getContextPath());
            File file = new File(path);
            if(!file.exists()){
                file.mkdirs();
            }

            String filename = mf.getOriginalFilename();
            filename = UUID.randomUUID().toString().replace("-", "") + "_" + filename;
            try {
                mf.transferTo(new File(path, filename));
            } catch (Exception e) {
                map.put("flag", false);
                e.printStackTrace();
            }
            book.setBookImg("images" + "\\" + filename);
        }
        bookService.updateBook(book);
        map.put("flag", true);
        return map;
    }

    @RequestMapping("/deleteBook")
    public @ResponseBody Map<String, Boolean> deleteBook(@RequestParam("bookId") int bookId){
        Map<String, Boolean> map = new HashMap<>();
        try {
            bookService.deleteBook(bookId);
        }catch (Exception e){
            map.put("flag", false);
        }
        map.put("flag", true);
        return map;
    }
}
