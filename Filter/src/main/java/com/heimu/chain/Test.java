package com.heimu.chain;

public class Test {

    /**
     * @param args
     */
    public static void main(String[] args) {
        String msg = "���ԣ�<script>������ҵ��������Ϣ";
        FilterChain fc = new FilterChain();
        fc.addFilter(new HTMLFilter()).addFilter(new SensitiveFilter());
        String request = msg;
        String response = "response";
        System.out.println("ԭʼ��"+request);
        fc.doFilter(request, response, fc);
        System.out.println("ԭʼ��"+response);
    }

}