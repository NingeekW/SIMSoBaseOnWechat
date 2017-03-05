package cn.ning3f1.wechat.message.resp;

/**
 * ClassName:TextMessage.java
 * @Description: 文本消息消息体
 * @author Ning
 *
 * @time 2017年1月11日上午11:48:07
 *
 */
public class TextMessage extends BaseMessage {  
    // 回复的消息内容   
    private String Content;  
   
    public String getContent() {  
        return Content;  
    }  
   
    public void setContent(String content) {  
        Content = content;  
    }  
}
