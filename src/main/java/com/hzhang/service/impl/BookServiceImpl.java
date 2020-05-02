package com.hzhang.service.impl;

import com.hzhang.dao.BookDao;
import com.hzhang.domain.Book;
import com.hzhang.domain.PageBean;
import com.hzhang.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

/**
 * @author ：Hzhang
 * @date ：Created in 2020/5/1 15:58
 * @description：
 * @modified By：
 * @version: $
 */
@Service
public class BookServiceImpl implements BookService {
    @Autowired
    @Qualifier("bookDao")
    private BookDao bookDao;

    @Override
    public PageBean findAll(PageBean pb) {
        int count = bookDao.count(pb);
        pb.setCount(count);
        int start = (pb.getCurrentPage()-1)*pb.getPage();
        int totalPage = (int)Math.ceil(((double) count)/pb.getPage());
        pb.setTotalPage(totalPage);
        pb.setBookList(bookDao.findAll(pb.getQuery(), start, pb.getPage()));
        return pb;
    }

    @Override
    public Book findById(int bookId) {
        return bookDao.findById(bookId);
    }

    @Override
    public int saveBook(Book book) {
        return bookDao.saveBook(book);
    }

    @Override
    public void deleteBook(int bookId) {
        bookDao.deleteBook(bookId);
    }

    @Override
    public void updateBook(Book book) {
        bookDao.updateBook(book);
    }
}
