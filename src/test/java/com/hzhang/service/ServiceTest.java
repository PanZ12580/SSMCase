package com.hzhang.service;

import com.hzhang.domain.Book;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

/**
 * @author ：Hzhang
 * @date ：Created in 2020/5/1 16:00
 * @description：
 * @modified By：
 * @version: $
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:applicationContext.xml")
public class ServiceTest {
    @Autowired
    private BookService bookService;

    @Test
    public void testFindAll() {
        List<Book> bookList = bookService.findAll();
        bookList.forEach(System.out::println);
    }
}
