package cn.ning3f1.wechat.message.req;

/**
 * ClassName:ImageMessage
 * @author Ning
 * @Description: 图片消息
 * @time 2017年1月11日上午10:50:10
 *
 */
public class ImageMessage extends BaseMessage {
    // 图片链接
    private String PicUrl;
 
    public String getPicUrl() {
        return PicUrl;
    }
 
    public void setPicUrl(String picUrl) {
        PicUrl = picUrl;
    }
}
