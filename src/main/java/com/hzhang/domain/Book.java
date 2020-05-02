package com.hzhang.domain;

import java.io.Serializable;

/**
 * @author ：Hzhang
 * @date ：Created in 2020/5/1 10:47
 * @description：
 * @modified By：
 * @version: $
 */
public class Book implements Serializable {
    private int bookId;
    private String bookName;
    private int bookCount;
    private String detail;
    private String bookImg;

    public String getBookImg() {
        return bookImg;
    }

    public void setBookImg(String bookImg) {
        this.bookImg = bookImg;
    }

    public int getBookId() {
        return bookId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public int getBookCount() {
        return bookCount;
    }

    public void setBookCount(int bookCount) {
        this.bookCount = bookCount;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    @Override
    public String toString() {
        return "Book{" +
                "bookId=" + bookId +
                ", bookName='" + bookName + '\'' +
                ", bookCount=" + bookCount +
                ", detail='" + detail + '\'' +
                ", imgUrl='" + bookImg + '\'' +
                '}';
    }
}
