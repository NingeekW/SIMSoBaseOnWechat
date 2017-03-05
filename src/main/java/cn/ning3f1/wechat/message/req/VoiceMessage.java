package cn.ning3f1.wechat.message.req;

/**
 * ClassName:VoiceMessage.java
 * @Description: 语音消息
 * @author Ning
 *
 * @time 2017年1月11日上午10:56:41
 *
 */
public class VoiceMessage extends BaseMessage {  
    // 媒体ID   
    private String MediaId;  
    // 语音格式   
    private String Format;  
   
    public String getMediaId() {  
        return MediaId;  
    }  
   
    public void setMediaId(String mediaId) {  
        MediaId = mediaId;  
    }  
   
    public String getFormat() {  
        return Format;  
    }  
   
    public void setFormat(String format) {  
        Format = format;  
    }  
}