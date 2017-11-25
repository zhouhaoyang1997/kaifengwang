package com.kf.util;

import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

/**
 * Created by 18236 on 2017/10/19.
 */
public class FileUtil {

    public static boolean picIsError(MultipartFile[] pics){
        boolean access = true;
        //监测是否有图片大小超过1m
        if(null != pics && pics.length > 0){
            for(MultipartFile pic:pics){
                if(null != pic){
                    if(pic.getSize()>1024*1024){
                        access = false;
                    }
                }
            }
        }
        return access;
    }



    public static String addPic(MultipartFile[] pics,String filePathPri,String savePath) throws IOException{
        String sb="";
        for (MultipartFile pic : pics) {
            if(!pic.isEmpty()){
                String path = getFilePath(pic,filePathPri);
                File file = new File(savePath+path);
                if(!file.getParentFile().exists()){
                    file.getParentFile().mkdirs();
                }
                pic.transferTo(file);
                sb=sb+path+"#";
            }
        }
        return sb;
    }

    public static String getFilePath(MultipartFile file,String filePathPri){
        String originalName = file.getOriginalFilename();
        String suffix = originalName.substring(originalName.lastIndexOf(".") + 1);

        return filePathPri+ UUID.randomUUID().toString() + "." + suffix;
    }


    /**
     * 删除图片
     * @param fileName
     * @return
     */
    public static boolean deleteImg(String fileName){
        File file = new File(fileName);
//        System.out.println("删除图片"+fileName);
        return file.exists()&&file.isFile()&&file.delete();
    }

    public static String getDeleteImg(String baseImgUrl,Integer key,BasePath basePath){
        StringBuffer stringBuffer = new StringBuffer();
        if(baseImgUrl!=null){
            String[] imgUrl = baseImgUrl.split("#");
            for(int i=0;i<imgUrl.length;i++){
                if(i!=key){
                    stringBuffer.append(imgUrl[i]);
                    stringBuffer.append("#");
                }else{
                    FileUtil.deleteImg(basePath.getPathValue()+imgUrl[i]);
                }
            }
            //更改图片url
            return getUrl(stringBuffer);
        }
        return null;
    }

    private static String getUrl(StringBuffer stringBuffer){
        if(stringBuffer.length()>0){
            String sb = stringBuffer.toString();
            return sb.substring(0,sb.length()-1);
        }else{
            return null;
        }
    }
}
