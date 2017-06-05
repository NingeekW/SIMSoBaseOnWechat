package cn.ning3f1.wechat.Dispatcher;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Objects;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import javax.ws.rs.GET;

import org.springframework.stereotype.Controller;

import com.mysql.fabric.xmlrpc.base.Value;

import cn.ning3f1.wechat.domain.Course;
import cn.ning3f1.wechat.domain.StuCourse;
import cn.ning3f1.wechat.domain.WechatBindAdmin;
import cn.ning3f1.wechat.domain.WechatBindStu;
import cn.ning3f1.wechat.domain.WechatBindTeachAdmin;
import cn.ning3f1.wechat.message.resp.Article;
import cn.ning3f1.wechat.message.resp.NewsMessage;
import cn.ning3f1.wechat.message.resp.TextMessage;
import cn.ning3f1.wechat.service.CourseService;
import cn.ning3f1.wechat.service.LoginService;
import cn.ning3f1.wechat.service.StuCourseService;
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
	@Resource
	private CourseService courseservice;
	@Resource
	private StuCourseService stuCourseservice;
	  
	private static MsgDispatcher service;  
	  
	@PostConstruct  
	public void init() {  
	service = this;  
	service.loginservice = this.loginservice; 
	service.courseservice = this.courseservice;
	service.stuCourseservice = this.stuCourseservice;
	}  
	private static Object getmsg(String openid,String mpid,String MsgType){
		if(MsgType.equals(MessageUtil.RESP_MESSAGE_TYPE_TEXT)){
			TextMessage msg = new TextMessage();
			msg.setToUserName(openid);
			msg.setFromUserName(mpid);
			msg.setCreateTime(new Date().getTime());
			msg.setMsgType(MsgType);
			return msg;
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
	
	public static String commonMessage(String openid,String mpid){
		/**
		 * 本模块用来返回通用的系统使用相关操作的信息
		 */
		TextMessage txtmsg= (TextMessage) MsgDispatcher.getmsg(openid, mpid,MessageUtil.RESP_MESSAGE_TYPE_TEXT);
        txtmsg.setContent("欢迎使用学生信息管理系统，发送关键字进行操作\n"
        				+ "[1]绑定\n"
        				+ "[2]取消绑定\n"
        				+ "[3]个人中心\n"
        				+ "[4]成绩查询\n"
        				+ "[5]学生信息维护\n"
        				+ "[6]教师信息维护\n"
        				+ "[7]学生成绩维护\n"
        				+ "[8]课程信息维护\n"
        				+ "[9]专业信息维护\n"
        				+ "[10]帮助\n"
        				+ "[11]建议请直接留言\n");
        return MessageUtil.textMessageToXml(txtmsg);
	}
	
	public static String courseScoreMessage(WechatBindStu wbStu,String openid,String mpid){
		List<StuCourse> stuCourse = service.stuCourseservice.courseAllScore(wbStu.getStuId());
		TextMessage txtmsg= (TextMessage) MsgDispatcher.getmsg(openid, mpid,MessageUtil.RESP_MESSAGE_TYPE_TEXT);
		String courseScore = null;
		int failNum = 0;
		int allcredit = 0;
		int uncredit  = 0;
		for (StuCourse stuCourse2 : stuCourse) {
			/**
			 * 对未通过的成绩进行标记
			 */
			if(stuCourse2.getStuGrade() >= 60){
					allcredit   += Integer.valueOf(stuCourse2.getCredit());
					courseScore += stuCourse2.getCourseName()+"成绩为"+stuCourse2.getStuGrade()+"分\n";
        	}else{
        		failNum += 1;
        		allcredit += Integer.valueOf(stuCourse2.getCredit());
        		uncredit  += Integer.valueOf(stuCourse2.getCredit());
        		courseScore += stuCourse2.getCourseName()+"成绩为"+stuCourse2.getStuGrade()+"分\n";
        	}
		}
		if(failNum > 0){
			courseScore += "你有"+failNum+"门课程未通过，继续努力吧！[难过]\n";
			courseScore += "总学分"+allcredit+"\n";
			courseScore += "未通过学分"+uncredit+"\n";
		}
		txtmsg.setContent(courseScore.substring(4));
		return MessageUtil.textMessageToXml(txtmsg);
	}
	
	
    public static String processMessage(Map<String, String> map) {
    	String openid=map.get("FromUserName"); //用户openid
    	String mpid=map.get("ToUserName");   //公众号原始ID
    	//System.out.println("openid"+openid);
    	//System.out.println("mpid"+mpid);

        /**
         * wbStu   用来获得学生是否已经绑定系统
         * WBTA    用来获得教师、管理员是否已绑定系统
         */
        WechatBindStu WBStu = service.loginservice.isBindstu(openid);
        WechatBindTeachAdmin WBTA = service.loginservice.isBindta(openid);
        WechatBindAdmin WBAdmin = service.loginservice.isBindAdmin(openid);
    	
        TextMessage txtmsg= (TextMessage) MsgDispatcher.getmsg(openid, mpid,MessageUtil.RESP_MESSAGE_TYPE_TEXT);
        if (map.get("MsgType").equals(MessageUtil.REQ_MESSAGE_TYPE_TEXT)) { // 文本消息
            System.out.println("==============REQ_MESSAGE_TYPE_TEXT这是文本消息！");
           /**
            * 通过获取用户发送的文本信息进行判断，进行不同内容的返回
            * 1、绑定|bd 返回绑定相关信息
            * 2、取消绑定|qxbd 返回取消绑定相关信息
            * 3、个人中心
            * 4、成绩查询
            */
    
            
            if(map.get("Content").equals("绑定") ||  map.get("Content").equalsIgnoreCase("bd") 
             ||map.get("Content").equals("1") ){
            	/**
            	 * 绑定模块(模块编号[1])：
            	 * 1、判断用户是否已经绑定该系统，若未绑定则继续
            	 * 2、若用户已经与本系统完成绑定,则返回"您已完成信息系统的绑定"
            	 */
            	//TextMessage txtmsg= (TextMessage) MsgDispatcher.getmsg(openid, mpid,MessageUtil.RESP_MESSAGE_TYPE_TEXT);
        		if(WBStu != null || WBTA != null || WBAdmin != null){
        	          //普通文本消息
                    txtmsg.setContent("您好，该微信已绑定，可发送'取消绑定'进行解绑\n");
                    return MessageUtil.textMessageToXml(txtmsg);
        		}        		
        		//图文消息
        		NewsMessage newmsg= (NewsMessage) MsgDispatcher.getmsg(openid, mpid,
						MessageUtil.RESP_MESSAGE_TYPE_NEWS);
        		Article articleBindStu= MsgDispatcher.getarticle("欢迎使用学生信息管理系统", 
        												"https://www.ning3f1.cn/StudentInfoMS/logo/login_logo.jpg",
        												"学生绑定", 
        												"https://www.ning3f1.cn/StudentInfoMS/stubind.htm?openid="+openid);
        		Article articleBindTA= MsgDispatcher.getarticle("欢迎使用学生信息管理系统", 
						"https://www.ning3f1.cn/StudentInfoMS/logo/login_logo.jpg",
						"教师绑定", 
						"https://www.ning3f1.cn/StudentInfoMS/tabind.htm?openid="+openid);
        		Article articleBindAdmin= MsgDispatcher.getarticle("欢迎使用学生信息管理系统", 
						"https://www.ning3f1.cn/StudentInfoMS/logo/login_logo.jpg",
						"管理员绑定", 
						"https://www.ning3f1.cn/StudentInfoMS/adminbind.htm?openid="+openid);
        		List<Article> list=new ArrayList<Article>();
        		list.add(articleBindStu);     //这里发送的是单图文，如果需要发送多图文则在这里list中加入多个Article即可！
        		list.add(articleBindTA);
        		list.add(articleBindAdmin);
        		newmsg.setArticleCount(list.size());
        		newmsg.setArticles(list);
        		return MessageUtil.newsMessageToXml(newmsg);
        		
            }else if(map.get("Content").equals("取消绑定") || map.get("Content").equalsIgnoreCase("qxbd")
            	  || map.get("Content").equals("2")){
            	/**
            	 * 取消绑定模块
            	 * 1、判断用户是否已经绑定该系统，若未绑定该系统则返回"该微信未绑定学生信息管理系统"的提示
            	 * 2、若用户已绑定该系统，则进行解除绑定操作
            	 */
            	//TextMessage txtmsg= (TextMessage) MsgDispatcher.getmsg(openid, mpid,MessageUtil.RESP_MESSAGE_TYPE_TEXT);
            	if(WBStu == null  && WBTA == null && WBAdmin == null){
      	          //普通文本消息 
                  txtmsg.setContent("您好，该微信未绑定学生信息管理系统，可发送'绑定'或'bd'进行绑定");
                  return MessageUtil.textMessageToXml(txtmsg);
            	}
            	
            	if(WBStu != null){
            		service.loginservice.unBindStu(openid);
            		txtmsg.setContent("同学你好，您已解绑学生管理系统，可发送'绑定'或'bd'进行绑定");
            	}else if(WBTA != null){
            		service.loginservice.unBindTA(openid);
            		txtmsg.setContent("老师您好，您已解绑学生管理系统，可发送'绑定'或'bd'进行绑定");
            	}else if(null != WBAdmin){
            		service.loginservice.unBindAdmin(openid);
            		txtmsg.setContent("管理员您好，您已解绑学生管理系统，可发送'绑定'或'bd'进行绑定");
            	}
            	return MessageUtil.textMessageToXml(txtmsg);
            
            } else if (map.get("Content").equals("个人中心") 
            		|| map.get("Content").equals("3")){
            	/**
            	 * 个人中心：
            	 * 1、首先判断用户是否绑定该系统，若绑定则继续。否则返回需要绑定系统信息
            	 * 2、返回用户的个人中心专属链接
            	 */
            	if(WBStu == null && WBTA == null && WBAdmin == null){
      	          //普通文本消息
            		//TextMessage txtmsg= (TextMessage) MsgDispatcher.getmsg(openid, mpid,MessageUtil.RESP_MESSAGE_TYPE_TEXT);
            		txtmsg.setContent("您好，该微信未绑定，可发送'绑定'或'bd'进行绑定");
            		return MessageUtil.textMessageToXml(txtmsg);
            	}
            	//初始化
            	NewsMessage newmsg= (NewsMessage) MsgDispatcher.getmsg(openid, mpid,
            													MessageUtil.RESP_MESSAGE_TYPE_NEWS);
                //System.out.println("==============这是图文消息！");
                Article article= MsgDispatcher.getarticle("欢迎使用学生信息管理系统", 
                		 "http://www.ning3f1.cn/StudentInfoMS/logo/login_logo.jpg",
                		 "个人中心", 
                		 "http://www.ning3f1.cn/StudentInfoMS/gopersonCenter.htm?openid="+openid);
                List<Article> list=new ArrayList<Article>();
                list.add(article);     //这里发送的是单图文，如果需要发送多图文则在这里list中加入多个Article即可！
                newmsg.setArticleCount(list.size());
                newmsg.setArticles(list);
                return MessageUtil.newsMessageToXml(newmsg);
            }else if(map.get("Content").length() >= 4 && map.get("Content").substring(0, 4).equals("成绩查询") || map.get("Content").equals("4")){
            	/**
            	 * 成绩查询功能(模块号：[4])：
            	 * 1、首先判断用户是否绑定该系统，若绑定则继续。否则返回需要绑定系统信息
            	 * 2、使用方法
            	 * 		【1】直接输入成绩查询，查询所有的课程信息
            	 * 		【2】输入成绩查询"所要查询的课程名称"，进行单一课程成绩的查询
            	 */
            	if( WBStu == null){
            		
            		if(WBTA !=null || WBAdmin != null ){
            			//TextMessage txtmsg= (TextMessage) MsgDispatcher.getmsg(openid, mpid,MessageUtil.RESP_MESSAGE_TYPE_TEXT);
            			txtmsg.setContent("您好，暂不支持教师、管理员使用此方式进行成绩的查询，\n请输入‘学生成绩维护’进行查询！");
            			return MessageUtil.textMessageToXml(txtmsg);
            		}
                  
            		NewsMessage newmsg= (NewsMessage) MsgDispatcher.getmsg(openid, mpid,
            				MessageUtil.RESP_MESSAGE_TYPE_NEWS);
            		Article articleBind= MsgDispatcher.getarticle("同学你好，请先完成学生信息管理系统绑定", 
            											"http://www.ning3f1.cn/StudentInfoMS/logo/login_logo.jpg",
            											"绑定", 
            											"http://www.ning3f1.cn/StudentInfoMS/bind.htm?openid="+openid);
            		List<Article> list=new ArrayList<Article>();
            		list.add(articleBind);     //这里发送的是单图文，如果需要发送多图文则在这里list中加入多个Article即可！
            		newmsg.setArticleCount(list.size());
            		newmsg.setArticles(list);
            		return MessageUtil.newsMessageToXml(newmsg);
            	}
            	/**
            	 * 若用户输入4，则返回所有课程的成绩
            	 */
      
            	if(map.get("Content").equals("4")){
            		return MsgDispatcher.courseScoreMessage(WBStu,openid,mpid);
            	}
            //	TextMessage txtmsg= (TextMessage) MsgDispatcher.getmsg(openid, mpid,MessageUtil.RESP_MESSAGE_TYPE_TEXT);
            	String courseName = map.get("Content").substring(4);
            	/**
            	 * 如果用户仅输入成绩查询，则返回所有课程的成绩信息
            	 */
            	if(courseName.isEmpty()){
            		return MsgDispatcher.courseScoreMessage(WBStu,openid,mpid);
            	}
            	/**
            	 * 判断是否有要查询的课程名称，如果有则进行查询并返回，
            	 * 否则返回错误信息，"没有该课程或成绩尚未登记"
            	 */
            	
            	Course course = service.courseservice.selectCourse(courseName);
            	if(course == null){
            		txtmsg.setContent("所查课程不存在！");
            		return MessageUtil.textMessageToXml(txtmsg);
            	}
            	String stuId = WBStu.getStuId();
            	StuCourse stuCourse = service.stuCourseservice.courseScore(stuId,course.getCourseId());
            	if(stuCourse == null){
            		txtmsg.setContent("所查课程无成绩,请稍后再试...");
            		return MessageUtil.textMessageToXml(txtmsg);
            	}
            	if(stuCourse.getStuGrade() >= 60){
            		txtmsg.setContent(courseName+"成绩为"+stuCourse.getStuGrade()+"分\n恭喜你及格了,继续保持！[愉快]");
            	}else{
            		txtmsg.setContent(courseName+"成绩为"+stuCourse.getStuGrade()+"分\n很抱歉，继续努力吧！[难过]");
            	}
            	return MessageUtil.textMessageToXml(txtmsg);
            	
            }else if(map.get("Content").equals("help") || map.get("Content").equals("帮助") || map.get("Content").equals("10")){
            	return MsgDispatcher.commonMessage(openid, mpid);
            	
            }else if(map.get("Content").equals("学生信息维护") || map.get("Content").equals("5")){
            	if(WBAdmin == null){
            		if(WBStu != null  || WBTA != null ){
            			txtmsg.setContent("您好，无权限进行此操作");
                        return MessageUtil.textMessageToXml(txtmsg);
            		}
      	          //普通文本消息 
                  txtmsg.setContent("您好，该微信未绑定学生信息管理系统，可发送'绑定'或'bd'进行绑定");
                  return MessageUtil.textMessageToXml(txtmsg);
            	}
            	NewsMessage newmsg= (NewsMessage) MsgDispatcher.getmsg(openid, mpid,
        				MessageUtil.RESP_MESSAGE_TYPE_NEWS);
        		Article articleBind= MsgDispatcher.getarticle("学生信息维护", 
        											"http://www.ning3f1.cn/StudentInfoMS/logo/login_logo.jpg",
        											"学生信息维护", 
        											"http://www.ning3f1.cn/StudentInfoMS/tostulist.htm?openid="+openid);
        		List<Article> list=new ArrayList<Article>();
        		list.add(articleBind);     //这里发送的是单图文，如果需要发送多图文则在这里list中加入多个Article即可！
        		newmsg.setArticleCount(list.size());
        		newmsg.setArticles(list);
        		return MessageUtil.newsMessageToXml(newmsg);
            	
            }else if(map.get("Content").equals("教师信息维护") || map.get("Content").equals("6")){
            	if(WBAdmin == null){
            		if(WBStu != null  || WBTA != null ){
            			txtmsg.setContent("您好，无权限进行此操作");
                        return MessageUtil.textMessageToXml(txtmsg);
            		}
      	          //普通文本消息 
                  txtmsg.setContent("您好，该微信未绑定学生信息管理系统，可发送'绑定'或'bd'进行绑定");
                  return MessageUtil.textMessageToXml(txtmsg);
            	}
            	NewsMessage newmsg= (NewsMessage) MsgDispatcher.getmsg(openid, mpid,
        				MessageUtil.RESP_MESSAGE_TYPE_NEWS);
        		Article articleBind= MsgDispatcher.getarticle("教师信息维护", 
        											"http://www.ning3f1.cn/StudentInfoMS/logo/login_logo.jpg",
        											"教师信息维护", 
        											"http://www.ning3f1.cn/StudentInfoMS/totalist.htm?openid="+openid);
        		List<Article> list=new ArrayList<Article>();
        		list.add(articleBind);     //这里发送的是单图文，如果需要发送多图文则在这里list中加入多个Article即可！
        		newmsg.setArticleCount(list.size());
        		newmsg.setArticles(list);
        		return MessageUtil.newsMessageToXml(newmsg);
            }else if(map.get("Content").equals("学生成绩维护")
            		|| map.get("Content").equals("7")){
            
            	if(WBAdmin == null && WBTA == null ){
            		if(WBStu != null){
            			txtmsg.setContent("您好，无权限进行此操作");
                        return MessageUtil.textMessageToXml(txtmsg);
            		}
      	          //普通文本消息 
                  txtmsg.setContent("您好，该微信未绑定学生信息管理系统，可发送'绑定'或'bd'进行绑定");
                  return MessageUtil.textMessageToXml(txtmsg);
            	}
            	NewsMessage newmsg= (NewsMessage) MsgDispatcher.getmsg(openid, mpid,
        				MessageUtil.RESP_MESSAGE_TYPE_NEWS);
        		Article articleBind= MsgDispatcher.getarticle("学生成绩维护", 
        											"http://www.ning3f1.cn/StudentInfoMS/logo/login_logo.jpg",
        											"学生成绩维护", 
        											"http://www.ning3f1.cn/StudentInfoMS/tostuscorelist.htm?openid="+openid);
        		List<Article> list=new ArrayList<Article>();
        		list.add(articleBind);     //这里发送的是单图文，如果需要发送多图文则在这里list中加入多个Article即可！
        		newmsg.setArticleCount(list.size());
        		newmsg.setArticles(list);
        		return MessageUtil.newsMessageToXml(newmsg);
            }else if(map.get("Content").equals("课程信息维护") 
            		|| map.get("Content").equals("8")){
           
            	if(WBAdmin == null){
            		if(WBStu != null  || WBTA != null ){
            			txtmsg.setContent("您好，无权限进行此操作");
                        return MessageUtil.textMessageToXml(txtmsg);
            		}
      	          //普通文本消息 
                  txtmsg.setContent("您好，该微信未绑定学生信息管理系统，可发送'绑定'或'bd'进行绑定");
                  return MessageUtil.textMessageToXml(txtmsg);
            	}
            	NewsMessage newmsg= (NewsMessage) MsgDispatcher.getmsg(openid, mpid,
        				MessageUtil.RESP_MESSAGE_TYPE_NEWS);
        		Article articleBind= MsgDispatcher.getarticle("课程信息维护", 
        											"http://www.ning3f1.cn/StudentInfoMS/logo/login_logo.jpg",
        											"课程信息维护", 
        											"http://www.ning3f1.cn/StudentInfoMS/tocourselist.htm?openid="+openid);
        		List<Article> list=new ArrayList<Article>();
        		list.add(articleBind);     //这里发送的是单图文，如果需要发送多图文则在这里list中加入多个Article即可！
        		newmsg.setArticleCount(list.size());
        		newmsg.setArticles(list);
        		return MessageUtil.newsMessageToXml(newmsg);
            }else if(map.get("Content").equals("专业信息维护") || map.get("Content").equals("9")){
            	
            	if(WBAdmin == null){
            		if(WBStu != null  || WBTA != null ){
            			txtmsg.setContent("您好，无权限进行此操作");
                        return MessageUtil.textMessageToXml(txtmsg);
            		}
      	          //普通文本消息 
                  txtmsg.setContent("您好，该微信未绑定学生信息管理系统，可发送'绑定'或'bd'进行绑定");
                  return MessageUtil.textMessageToXml(txtmsg);
            	}
            	NewsMessage newmsg= (NewsMessage) MsgDispatcher.getmsg(openid, mpid,
        				MessageUtil.RESP_MESSAGE_TYPE_NEWS);
        		Article articleBind= MsgDispatcher.getarticle("专业信息维护", 
        											"http://www.ning3f1.cn/StudentInfoMS/logo/login_logo.jpg",
        											"专业信息维护", 
        											"http://www.ning3f1.cn/StudentInfoMS/tospeclist.htm?openid="+openid);
        		List<Article> list=new ArrayList<Article>();
        		list.add(articleBind);     //这里发送的是单图文，如果需要发送多图文则在这里list中加入多个Article即可！
        		newmsg.setArticleCount(list.size());
        		newmsg.setArticles(list);
        		return MessageUtil.newsMessageToXml(newmsg);
            }else{
            	/**
            	 * 其他信息不做返回信息处理，
            	 * 可接入聊天机器人功能
            	 */
            	return "";
            }
       }

        
        if (map.get("MsgType").equals(MessageUtil.REQ_MESSAGE_TYPE_IMAGE)) { // 图片消息
            //System.out.println("==============REQ_MESSAGE_TYPE_IMAGE这是图片消息！");
            //对图文消息
            NewsMessage newmsg=(NewsMessage) MsgDispatcher.getmsg(openid, mpid, MessageUtil.RESP_MESSAGE_TYPE_NEWS);
    
            //System.out.println("==============这是图片消息！");
            Article articleBindStu= MsgDispatcher.getarticle("欢迎使用学生信息管理系统", 
					"https://www.ning3f1.cn/StudentInfoMS/logo/login_logo.jpg",
					"学生绑定", 
					"https://www.ning3f1.cn/StudentInfoMS/stubind.htm?openid="+openid);
			Article articleBindTA= MsgDispatcher.getarticle("欢迎使用学生信息管理系统", 
					"https://www.ning3f1.cn/StudentInfoMS/logo/login_logo.jpg",
					"教师绑定", 
					"https://www.ning3f1.cn/StudentInfoMS/tabind.htm?openid="+openid);
			Article articleBindAdmin= MsgDispatcher.getarticle("欢迎使用学生信息管理系统", 
					"https://www.ning3f1.cn/StudentInfoMS/logo/login_logo.jpg",
					"管理员绑定", 
					"https://www.ning3f1.cn/StudentInfoMS/adminbind.htm?openid="+openid);
			List<Article> list=new ArrayList<Article>();
			list.add(articleBindStu);     //这里发送的是单图文，如果需要发送多图文则在这里list中加入多个Article即可！
			list.add(articleBindTA);
			list.add(articleBindAdmin);
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
 
        //return "";
        
		txtmsg.setContent("感谢您使用学生信息管理系统。");
		return MessageUtil.textMessageToXml(txtmsg);
    }
}