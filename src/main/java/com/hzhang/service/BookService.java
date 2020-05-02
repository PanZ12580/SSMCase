package com.hzhang.service;

import com.hzhang.domain.Book;
import com.hzhang.domain.PageBean;

import java.util.List;

/**
 * @author ：Hzhang
 * @date ：Created in 2020/5/1 15:57
 * @description：
 * @modified By：
 * @version: $
 */
public interface BookService {
    /**
     * 分页查询书籍
     * @return
     */
    PageBean findAll(PageBean pb);

    /**
     * 根据ID查询一本书
     * @param bookId
     * @return
     */
    Book findById(int bookId);

    /**
     * 保存一本书
     * @param book
     * @return
     */
    int saveBook(Book book);

    /**
     * 根据id删除一本书
     * @param bookId
     * @return
     */
    void deleteBook(int bookId);

    /**
     * 修改一本书
     * @param book
     * @return
     */
    void updateBook(Book book);
}
