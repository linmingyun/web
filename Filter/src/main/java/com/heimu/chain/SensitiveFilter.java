package com.heimu.chain;

public class SensitiveFilter implements Filter {

    public void doFilter(String request, String response,FilterChain chain) {
        request = request.replace("被就业", "就业").replace("敏感", "**") + "--Sensitive--";
        System.out.println("SensitiveFilter:"+request);
        chain.doFilter(request, response, chain);
        response += "--Sensitive--";
        System.out.println("SensitiveFilter:"+response);
    }

}