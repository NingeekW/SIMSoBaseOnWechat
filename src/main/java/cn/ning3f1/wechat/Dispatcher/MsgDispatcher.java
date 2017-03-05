package cn.ning3f1.wechat.Dispatcher;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import cn.ning3f1.wechat.message.req.TextMessage;
import cn.ning3f1.wechat.message.resq.Article;
import cn.ning3f1.wechat.message.resq.NewsMessage;
import cn.ning3f1.wechat.service.LoginService;
import cn.ning3f1.wechat.util.MessageUtil;

/**
 * ClassName: MsgDispatcher.java
 * @Description: 消息业务处理分发器
 * @author Ning
 *
 * @time 2017年1月11日上午11:38:04
 *
 */

@Controller
public class MsgDispatcher {
	@Resource 
	private LoginService loginservice;
	
	private static Object getmsg(String openid,String mpid,String MsgType){
		if(MsgType.equals(MessageUtil.REQ_MESSAGE_TYPE_TEXT)){
			TextMessage msg = new TextMessage();
			msg.setToUserName(openid);
			msg.setFromUserName(mpid);
			msg.setCreateTime(new Date().getTime());
			msg.setMsgType(MsgType);
		}else if(MsgType.equals(MessageUtil.RESP_MESSAGE_TYPE_NEWS)){
			NewsMessage msg=new NewsMessage();
			msg.setToUserName(openid);
			msg.setFromUserName(mpid);
			msg.setCreateTime(new Date().getTime());
			msg.setMsgType(MsgType);
			return msg;
		}
		return "";
	}
	
	private static Article getarticle(String Description,String PicUrl,String Title,String Url){
        Article article=new Article();
        article.setDescription(Description); //图文消息的描述
        article.setPicUrl(PicUrl); //图文消息图片地址
        article.setTitle(Title);  //图文消息标题
        article.setUrl(Url);  //图文url链接
		return article;
	}
	
	
    public static String processMessage(Map<String, String> map) {
    	String openid=map.get("FromUserName"); //用户openid
    	String mpid=map.get("ToUserName");   //公众号原始ID
    	System.out.println("openid"+openid);
    	System.out.println("mpid"+mpid);

        if (map.get("MsgType").equals(MessageUtil.REQ_MESSAGE_TYPE_TEXT)) { // 文本消息
            System.out.println("==============REQ_MESSAGE_TYPE_TEXT这是文本消息！");
            if(map.get("Content").equals("绑定") || map.get("Content").equals("取消绑定") || map.get("Content").equals("bd")){
        		NewsMessage newmsg= (NewsMessage) MsgDispatcher.getmsg(openid, mpid,
						MessageUtil.RESP_MESSAGE_TYPE_NEWS);
        		//System.out.println("==============这是图片消息！");

        		Article articleBind= MsgDispatcher.getarticle("欢迎使用学生信息管理系统", 
        												"http://www.ning3f1.cn/StudentInfoMS/logo/login_logo.jpg",
        												"绑定", 
        												"http://www.ning3f1.cn/StudentInfoMS/bind.htm?openid="+openid);
        		Article articleUnBind= MsgDispatcher.getarticle("欢迎使用学生信息管理系统", 
						"http://www.ning3f1.cn/StudentInfoMS/logo/login_logo.jpg",
						"取消绑定", 
						"http://www.ning3f1.cn/StudentInfoMS/unbind.htm?openid="+openid);
        		List<Article> list=new ArrayList<Article>();
        		list.add(articleBind);     //这里发送的是单图文，如果需要发送多图文则在这里list中加入多个Article即可！
        		list.add(articleUnBind); 
        		newmsg.setArticleCount(list.size());
        		newmsg.setArticles(list);
        		return MessageUtil.newsMessageToXml(newmsg);
        		
            } else if (map.get("Content").equals("个人中心")){
            	//初始化
            	NewsMessage newmsg= (NewsMessage) MsgDispatcher.getmsg(openid, mpid,
            													MessageUtil.RESP_MESSAGE_TYPE_NEWS);
                System.out.println("==============这是图片消息！");
                
                Article article= MsgDispatcher.getarticle("欢迎使用学生信息管理系统", 
                		 "http://www.ning3f1.cn/StudentInfoMS/logo/login_logo.jpg",
                		 "个人中心", 
                		 "http://www.ning3f1.cn/StudentInfoMS/gopersonCenter.htm?openid="+openid);
                List<Article> list=new ArrayList<Article>();
                list.add(article);     //这里发送的是单图文，如果需要发送多图文则在这里list中加入多个Article即可！
                newmsg.setArticleCount(list.size());
                newmsg.setArticles(list);
                return MessageUtil.newsMessageToXml(newmsg);
            }
          //普通文本消息
        	TextMessage txtmsg= (TextMessage) MsgDispatcher.getmsg(openid, mpid,MessageUtil.RESP_MESSAGE_TYPE_TEXT);
            txtmsg.setContent("欢迎使用学生信息管理系统！"+new Date().getTime());
            return MessageUtil.textMessageToXml(txtmsg);
        }


        
        if (map.get("MsgType").equals(MessageUtil.REQ_MESSAGE_TYPE_IMAGE)) { // 图片消息
            System.out.println("==============REQ_MESSAGE_TYPE_IMAGE这是图片消息！");
            //对图文消息
            NewsMessage newmsg=(NewsMessage) MsgDispatcher.getmsg(openid, mpid, MessageUtil.RESP_MESSAGE_TYPE_NEWS);
    
            System.out.println("==============这是图片消息！");
            Article article= MsgDispatcher.getarticle("绑定学生信息管理系统", 
           		 "http://ydxxxt.witpt.edu.cn/Public/logo/login_logo.jpg",
           		 "与微信号绑定快速查询个人消息", 
           		 "http://www.ning3f1.cn/StudentInfoMS/bind.htm?openid="+openid);
            List<Article> list=new ArrayList<Article>();
            list.add(article);     //这里发送的是单图文，如果需要发送多图文则在这里list中加入多个Article即可！
            newmsg.setArticleCount(list.size());
            newmsg.setArticles(list);
            return MessageUtil.newsMessageToXml(newmsg);
        }
         
         
        if (map.get("MsgType").equals(MessageUtil.REQ_MESSAGE_TYPE_LINK)) { // 链接消息
            System.out.println("==============这是链接消息！");
        }
         
         
        if (map.get("MsgType").equals(MessageUtil.REQ_MESSAGE_TYPE_LOCATION)) { // 位置消息
            System.out.println("==============这是位置消息！");
        }
         
         
        if (map.get("MsgType").equals(MessageUtil.REQ_MESSAGE_TYPE_VIDEO)) { // 视频消息
            System.out.println("==============这是视频消息！");
        }
         
         
        if (map.get("MsgType").equals(MessageUtil.REQ_MESSAGE_TYPE_VOICE)) { // 语音消息
            System.out.println("==============这是语音消息！");
        }
 
        return "";
    }
}