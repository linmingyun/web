package com.heimu;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class onLineCount implements HttpSessionListener {

    public int count=0;//��¼session������
    public void sessionCreated(HttpSessionEvent arg0) {//����session�Ĵ���
        count++;
        arg0.getSession().setAttribute("Count", count);
        System.out.println(count);
    }

    public void sessionDestroyed(HttpSessionEvent arg0) {//����session�ĳ���
        count--;
        arg0.getSession().setAttribute("Count", count);
        System.out.println(count);
    }

}