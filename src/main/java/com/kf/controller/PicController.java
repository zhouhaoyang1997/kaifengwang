package com.kf.controller;

import com.kf.util.BasePath;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import java.nio.file.Paths;

/**
 * Created by 18236 on 2017/11/5.
 */
@Controller
public class PicController {



    @Autowired
    private ResourceLoader resourceLoader;

    @Autowired
    private BasePath basePath;

    @GetMapping("/img/pushimg/{filename:.+}")
    @ResponseBody
    public ResponseEntity<?> getFile(@PathVariable String filename) {
        try {
            return ResponseEntity.ok(resourceLoader.getResource("file:" + Paths.get(basePath.getPathValue()+"/img/pushimg/",filename).toString()));
        } catch (Exception e) {
            return ResponseEntity.notFound().build();
        }
    }

    @GetMapping("/img/resume/{filename:.+}")
    @ResponseBody
    public ResponseEntity<?> getResume(@PathVariable String filename) {
        try {
            return ResponseEntity.ok(resourceLoader.getResource("file:" + Paths.get(basePath.getPathValue()+"/img/resume/",filename).toString()));
        } catch (Exception e) {
            return ResponseEntity.notFound().build();
        }
    }
    @GetMapping("/img/advert/{filename:.+}")
    @ResponseBody
    public ResponseEntity<?> getAdvert(@PathVariable String filename) {
        try {
            return ResponseEntity.ok(resourceLoader.getResource("file:" + Paths.get(basePath.getPathValue()+"/img/advert/",filename).toString()));
        } catch (Exception e) {
            return ResponseEntity.notFound().build();
        }
    }

    @GetMapping("/img/headimg/{filename:.+}")
    @ResponseBody
    public ResponseEntity<?> getHeadImg(@PathVariable String filename) {
        try {
            return ResponseEntity.ok(resourceLoader.getResource("file:" + Paths.get(basePath.getPathValue()+"/img/headimg/",filename).toString()));
        } catch (Exception e) {
            return ResponseEntity.notFound().build();
        }
    }

}
