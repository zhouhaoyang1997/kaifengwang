package com.kf.xss;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializerProvider;
import org.springframework.web.util.HtmlUtils;

import java.io.IOException;

/**
 * 过滤json  应用于responseBody和requestBody
 * Created by 18236 on 2017/10/28.
 */
public class XssStringJsonSerializer extends JsonSerializer<String>{
    @Override
    public void serialize(String s, JsonGenerator jsonGenerator, SerializerProvider serializerProvider) throws IOException, JsonProcessingException {
        if(s!=null){
            String escapeS = HtmlUtils.htmlEscape(s);
            jsonGenerator.writeString(escapeS);
        }
    }


    @Override
    public Class<String> handledType() {
        return String.class;
    }
}
