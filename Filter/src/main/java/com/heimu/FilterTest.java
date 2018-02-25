package com.heimu;

import java.io.IOException;
import java.util.Enumeration;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
public class FilterTest implements Filter {

    /* 过滤器初始化
     * @see javax.servlet.Filter#init(javax.servlet.FilterConfig)
     */
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("----过滤器初始化----");
        /*
         <filter>
         <filter-name>FilterTest</filter-name>
         <filter-class>com.heimu.FilterTest</filter-class>
         <!--配置FilterTest过滤器的初始化参数-->
         <init-param>
         <description>FilterTest</description>
         <param-name>name</param-name>
         <param-value>gacl</param-value>
         </init-param>
         <init-param>
         <description>配置FilterTest过滤器的初始化参数</description>
         <param-name>like</param-name>
         <param-value>java</param-value>
         </init-param>
         </filter>

         <filter-mapping>
         <filter-name>FilterDemo02</filter-name>
         <!--“/*”表示拦截所有的请求 -->
         <url-pattern>/*</url-pattern>
         </filter-mapping>
        */
        //得到过滤器的名字
        String filterName = filterConfig.getFilterName();
        //得到在web.xml文件中配置的初始化参数
        String initParam1 = filterConfig.getInitParameter("name");
        String initParam2 = filterConfig.getInitParameter("like");
        //返回过滤器的所有初始化参数的名字的枚举集合。
        Enumeration<String> initParameterNames = filterConfig.getInitParameterNames();

        System.out.println(filterName);
        System.out.println(initParam1);
        System.out.println(initParam2);
        while (initParameterNames.hasMoreElements()) {
            String paramName = (String) initParameterNames.nextElement();
            System.out.println(paramName);
        }
    }

    public void doFilter(ServletRequest request, ServletResponse response,
                         FilterChain chain) throws IOException, ServletException {
        System.out.println("FilterDemo02执行前！！！");
        chain.doFilter(request, response);  //让目标资源执行，放行
        System.out.println("FilterDemo02执行后！！！");
    }

    public void destroy() {
        System.out.println("----过滤器销毁----");
    }
}