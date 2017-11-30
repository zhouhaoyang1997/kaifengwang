package com.kf;

import com.aliyuncs.dysmsapi.model.v20170525.SendSmsResponse;
import com.aliyuncs.exceptions.ClientException;
import com.kf.util.AliyunMessageUtil;
import org.junit.Test;

import java.util.HashMap;
import java.util.Map;
/**
 * @author zhy
 * @create 2017-11-30 17:30
 **/
public class TestMessage {
    final static String msgSign = "麦芒网络科技";
    final static String templateCode = "SMS_114385489";
    final static String jsonContent = "{\"code\":\"123\"}";

    @Test
    public void getMessage() throws ClientException {
        String phoneNum = "15937427189";
        SendSmsResponse res = AliyunMessageUtil.sendSms(getParamMap(phoneNum));
        System.out.println(res.getMessage()+res.getCode());
    }
    Map<String, String> getParamMap(String phoneNum){
        Map<String, String> map = new HashMap<>();
        map.put("phoneNumber",phoneNum);
        map.put("msgSign",msgSign);
        map.put("templateCode",templateCode);
        map.put("jsonContent",jsonContent);
        return map;
    }
}
