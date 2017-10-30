package com.kf.util;

import com.kf.pojo.Advert;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class AdvertUtil {
    public static Map<String,Advert> conversionMap(List<Advert> advertList){
        Map<String,Advert> map = new HashMap<String, Advert>();
        for(Advert advert : advertList){
            map.put(advert.getAdvertPosition(),advert);
        }
        return map;
    }
}
