package cn.ning3f1.cms.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cn.ning3f1.common.SignUtil;

@Controller
@RequestMapping("/Wechat")
public class WechatSecurity {
	private Logger logger = Logger.getLogger(WechatSecurity.class);
	
    @RequestMapping(value = "security.htm", method = RequestMethod.GET)
    public void doGet(
            HttpServletRequest request,
            HttpServletResponse response,
            String signature,
            String timestamp,
            String nonce,
            String echostr) {
        try {
            if (SignUtil.checkSignature(signature, timestamp, nonce)) {
                PrintWriter out = response.getWriter();
                out.print(echostr);
                out.close();
            } else {
                logger.info("这里存在非法请求�?");
            }
        } catch (Exception e) {
            logger.error(e, e);
        }
    }
 
    @RequestMapping(value = "security", method = RequestMethod.POST)
    // post方法用于接收微信服务端消息
    public void DoPost() {
        System.out.println("这是post方法�?");
    }
}
