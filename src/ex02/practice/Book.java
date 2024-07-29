package ex02.practice;

import lombok.Data;

@Data
public class Book {
    private String title;
    private int price;
    private double discoundRate;
    private String author;

    public void setTitle(String title) {
        this.title = title;
    }

    public String getTitle() {
        return title;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getPrice() {
        return price;
    }

    public void setDiscoundRate(double discoundRate) {
        this.discoundRate = discoundRate;
    }

    public double getDiscoundRate() {
        return discoundRate;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getAuthor() {
        return author;
    }

    public Book() {
    }

    public Book(String title, int price, double discountRate, String author) {
        // 초기화
        this.title = title;
        this.price = price;
        this.discoundRate = discountRate;
        this.author = author;
    }

    public String information() {
        return title + "\t" + price + "\t" + discoundRate + "\t" + author;
    }

    // 가격을 출력하는 메서드를 생성
    public void printPrice() {
        System.out.println("도서명 = " + getTitle());
        int price = getPrice() - (int) (getPrice() * getDiscoundRate());
        System.out.println("할인된 가격 = " + price + "원");
    }

}
