package com.hd.util;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

/**
 * 文件工具类
 */
@Component
public class FileUtil {
	@Autowired
	Sequence sequence;
	
	public String fileUpload(HttpServletRequest request)
			throws IllegalStateException, IOException {
		// 创建一个通用的多部分解析器
		String path = "";
		String filePath = "";
		String realPath = request.getRealPath("").replace(request.getContextPath().replace("/", ""), "");
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
				request.getSession().getServletContext());
		// 判断 request 是否有文件上传,即多部分请求
		if (multipartResolver.isMultipart(request)) {
			// 转换成多部分request
			MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
			// 取得request中的所有文件名
			Iterator<String> iter = multiRequest.getFileNames();
			while (iter.hasNext()) {
				// 取得上传文件
				MultipartFile file = multiRequest.getFile(iter.next());
				System.out.println(file.getName().toString());
				if (file != null) {
					// 取得当前上传文件的文件名称
					String myFileName = file.getOriginalFilename();
					// 如果名称不为"",说明该文件存在，否则说明该文件不存在
					if (myFileName.trim() != "") {
						// 重命名上传后的文件名
						String fileName = file.getOriginalFilename();			 
						// 获取到文件的后缀名
						String extensionName = fileName.substring(fileName.lastIndexOf(".") + 1);
				
						// 定义上传路径
						filePath =  File.separator+"files" + File.separator + "images" + File.separator + sequence.getCommonID()  + "." + extensionName;
						path = realPath + filePath;
						String filePathString=realPath+File.separator+"files" + File.separator + "images" + File.separator;
						File fileString = new File(filePathString);
						if(!fileString.exists()){
							fileString.mkdirs();
						}
						File localFile = new File(path);
						file.transferTo(localFile);
						System.out.println(path);
					}
				}
			}
		}
        return filePath;  
	}
}
