package cn.ning3f1.wechat.message.req;

/**
 * ClassName:TextMessage.java
 * @Description:文本消息
 * @author Ning
 *
 * @time 2017年1月11日上午10:55:17
 *
 */
public class TextMessage extends BaseMessage {  
    // 消息内容   
    private String Content;  
   
    public String getContent() {  
        return Content;  
    }  
   
    public void setContent(String content) {  
        Content = content;  
    }  
}