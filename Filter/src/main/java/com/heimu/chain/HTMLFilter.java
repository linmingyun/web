package com.heimu.chain;

public class HTMLFilter implements Filter {

    public void doFilter(String request, String response, FilterChain chain) {
        request = request.replace("<", "[").replace(">", "]") + "--HTML--";
        System.out.println("HTMLFilter:"+request);
        chain.doFilter(request, response, chain);
        response += "--HTML--";
        System.out.println("HTMLFilter:"+response);
    }

}