package cn.ning3f1.wechat.message.resq;

/**
 * ClassName:MusicMessage.java
 * @Description: 音乐消息
 * @author Ning
 *
 * @time 2017年1月11日下午10:09:58
 *
 */
public class MusicMessage extends BaseMessage {  
    // 音乐   
    private Music Music;  
   
    public Music getMusic() {  
        return Music;  
    }  
   
    public void setMusic(Music music) {  
        Music = music;  
    }  
}