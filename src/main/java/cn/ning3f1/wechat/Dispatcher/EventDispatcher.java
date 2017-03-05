package cn.ning3f1.wechat.Dispatcher;

import java.util.Date;
import java.util.Map;

import cn.ning3f1.wechat.message.resp.TextMessage;
import cn.ning3f1.wechat.util.MessageUtil;
import cn.ning3f1.wechat.Dispatcher.MsgDispatcher;

/**
 * ClassName: EventDispatcher.java
 * @Description: 事件消息业务分发器
 * @author Ning
 *
 * @time 2017年1月11日上午11:45:56
 *
 */
public class EventDispatcher {

    public static String processEvent(Map<String, String> map) {
    	String openid=map.get("FromUserName"); //用户openid
    	String mpid=map.get("ToUserName");   //公众号原始ID
        if (map.get("Event").equals(MessageUtil.EVENT_TYPE_SUBSCRIBE)) { //关注事件
            System.out.println("==============这是关注事件！");
          //普通文本消息
            /*
        	TextMessage txtmsg=new TextMessage();
        	txtmsg.setToUserName(openid);
        	txtmsg.setFromUserName(mpid);
        	txtmsg.setCreateTime(new Date().getTime());
        	txtmsg.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_TEXT);
            txtmsg.setContent("你好，欢迎关注学生信息管理系统！");
            return MessageUtil.textMessageToXml(txtmsg);
            */
            /**
             * 返回学生信息管理系统使用相关操作的信息
             */
            return MsgDispatcher.commonMessage(openid, mpid);
        }
         
        if (map.get("Event").equals(MessageUtil.EVENT_TYPE_UNSUBSCRIBE)) { //取消关注事件
            System.out.println("==============这是取消关注事件！");
        }
         /*
        if (map.get("Event").equals(MessageUtil.EVENT_TYPE_SCAN)) { //扫描二维码事件
            System.out.println("==============这是扫描二维码事件！");
        }
         
        if (map.get("Event").equals(MessageUtil.EVENT_TYPE_LOCATION)) { //位置上报事件
            System.out.println("==============这是位置上报事件！");
        }
         */
        if (map.get("Event").equals(MessageUtil.EVENT_TYPE_CLICK)) { //自定义菜单点击事件
            System.out.println("==============这是自定义菜单点击事件！");
        }
        /* 
        if (map.get("Event").equals(MessageUtil.EVENT_TYPE_VIEW)) { //自定义菜单View事件
            System.out.println("==============这是自定义菜单View事件！");
        }
         */
         
        return null;
    }
}
