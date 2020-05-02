package com.hzhang.dao;

import com.hzhang.domain.Book;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import java.util.List;

/**
 * @author ：Hzhang
 * @date ：Created in 2020/5/1 11:12
 * @description：
 * @modified By：
 * @version: $
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:applicationContext.xml")
public class BookDaotest {
    @Autowired
    private BookDao bookDao;

    @Test
    public void testFindAll() {
        List<Book> bookList = bookDao.findAll(null, 1, 5);
        bookList.forEach(System.out::println);
    }

    @Test
    public void testSave() {
        Book book = new Book();
        book.setBookName("Spring");
        book.setBookCount(3);
        book.setDetail("从入门到入土");
        bookDao.saveBook(book);
    }

    @Test
    public void testDelete() {
        bookDao.deleteBook(4);
    }
}
