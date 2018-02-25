package com.heimu.chain;

public interface Filter {
    public void doFilter(String request, String response, FilterChain chain);
}
