package cn.ning3f1.wechat.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.log4j.net.SyslogAppender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import cn.ning3f1.wechat.Dispatcher.EventDispatcher;
import cn.ning3f1.wechat.Dispatcher.MsgDispatcher;
import cn.ning3f1.wechat.util.MessageUtil;
import cn.ning3f1.wechat.util.SignUtil;

/*
 * 验证服务器有效性代码
 */

@Controller
@RequestMapping("/Wechat")
public class WechatSecurity {
	private Logger logger = Logger.getLogger(WechatSecurity.class);
	/*
	 * @Description: 用于接收get参数，返回验证参数
	 * 
	 */
    @RequestMapping(value = "security.htm", method = RequestMethod.GET)
    public void doGet(
            HttpServletRequest request,
            HttpServletResponse response,
            @RequestParam(value = "signature", required = true) String signature,
            @RequestParam(value = "timestamp", required = true) String timestamp,
            @RequestParam(value = "nonce", required = true) String nonce,
            @RequestParam(value = "echostr", required = true) String echostr) {
        try {
            if (SignUtil.checkSignature(signature, timestamp, nonce)) {
                PrintWriter out = response.getWriter();
                out.print(echostr);
                out.close();
            } else {
                logger.info("这里存在非法请求！");
               // System.out.println("fail");
            }
        } catch (Exception e) {
            logger.error(e, e);
        }
    }
 
    @RequestMapping(value = "security.htm", method = RequestMethod.POST)
    // post方法用于接收微信服务端消息
    public void DoPost(HttpServletRequest request,HttpServletResponse response) throws IOException {
        System.out.println("这是post方法！");
        request.setCharacterEncoding("UTF-8");  
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        try{
            Map<String, String> map=MessageUtil.parseXml(request);
            String msgtype=map.get("MsgType");
            if(MessageUtil.REQ_MESSAGE_TYPE_EVENT.equals(msgtype)){
            	System.out.println("REQ_MESSAGE_TYPE_EVENT");
            	String Msgxml = EventDispatcher.processEvent(map); //进入事件处理
                out.print(Msgxml);
                out.close();
            }else{
            	System.out.println("MsgDispatcher.processMessage");
                String Msgxml = MsgDispatcher.processMessage(map); //进入消息处理
                //将xml信息返回给微信服务器
                System.out.println("finshed");
                System.out.println(Msgxml);
                out.print(Msgxml);
                out.close();
            }
        }catch(Exception e){
            logger.error(e,e);
        }
    }
}

