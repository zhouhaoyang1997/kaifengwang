package com.kf.util;

import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

/**
 * Created by 18236 on 2017/10/19.
 */
public class FileUtil {

    public static String addPic(MultipartFile[] pics,String filePathPri,String savePath) throws IOException{
        String sb="";
        for (MultipartFile pic : pics) {
            if(!pic.isEmpty()){
                String originalName = pic.getOriginalFilename();
                String suffix = originalName.substring(originalName.lastIndexOf(".") + 1);
                String filePath = filePathPri+ UUID.randomUUID().toString() + "." + suffix;
                File file = new File(savePath + filePath);
                if(!file.getParentFile().exists()){
                    file.getParentFile().mkdirs();
                }
                pic.transferTo(file);
                sb=sb+filePath+"#";
            }
        }
        return sb;
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
}
