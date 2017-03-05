package cn.ning3f1.wechat.message.resq;

/**
 * ClassName:Video.java
 * @Description: 视频消息体
 * @author Ning
 *
 * @time 2017年1月11日下午10:10:36
 *
 */
public class Video {
	 
    private String MediaId;
    private String Title;
    private String Description;
 
    public String getTitle() {
        return Title;
    }
 
    public void setTitle(String title) {
        Title = title;
    }
 
    public String getDescription() {
        return Description;
    }
 
    public void setDescription(String description) {
        Description = description;
    }
 
    public String getMediaId() {
        return MediaId;
    }
 
    public void setMediaId(String mediaId) {
        MediaId = mediaId;
    }
 
}