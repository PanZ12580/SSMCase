package com.hzhang.domain;

import java.util.List;

/**
 * @author ：Hzhang
 * @date ：Created in 2020/5/1 19:12
 * @description：分页所需信息
 * @modified By：
 * @version: $
 */
public class PageBean {
//    当前页数
    private int currentPage;
//    每页多少条数据
    private int page;
//    总共多少条数据
    private int count;
//    总共多少页
    private int totalPage;
//    当前页面展示的数据
    private List<Book> bookList;
//    模糊查询条件
    private String query;

    public String getQuery() {
        return query;
    }

    public void setQuery(String query) {
        this.query = query;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public List<Book> getBookList() {
        return bookList;
    }

    public void setBookList(List<Book> bookList) {
        this.bookList = bookList;
    }

    @Override
    public String toString() {
        return "PageBean{" +
                "currentPage=" + currentPage +
                ", page=" + page +
                ", count=" + count +
                ", totalPage=" + totalPage +
                ", bookList=" + bookList +
                ", query='" + query + '\'' +
                '}';
    }
}
