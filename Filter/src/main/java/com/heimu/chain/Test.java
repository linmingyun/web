package com.heimu.chain;

public class Test {

    /**
     * @param args
     */
    public static void main(String[] args) {
        String msg = "测试，<script>，被就业，敏感信息";
        FilterChain fc = new FilterChain();
        fc.addFilter(new HTMLFilter()).addFilter(new SensitiveFilter());
        String request = msg;
        String response = "response";
        System.out.println("原始："+request);
        fc.doFilter(request, response, fc);
        System.out.println("原始："+response);
    }

}