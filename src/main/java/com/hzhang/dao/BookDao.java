package com.hzhang.dao;

import com.hzhang.domain.Book;
import com.hzhang.domain.PageBean;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BookDao {
    /**
     * 查询所有书籍
     * @return
     */
    List<Book> findAll(@Param("query") String query, @Param("start") int start, @Param("offset") int offset);

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

    /**
     * 统计总共多少本书
     * @return
     */
    int count(PageBean pb);
}
