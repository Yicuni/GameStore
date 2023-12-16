package com.massz.util;

import com.massz.bean.Game;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;
import java.sql.Date;
import java.util.List;
import java.util.UUID;

public class FileUtils {
    //定义上传文件的路径 存储到服务器的路径
    private static final String FILE_PATH = "/file/";

    //临时路径
    private static final String FILE_TEMP_PATH = "/temp/";

    /**
     * 文件上传
     *
     * @param req
     * @param resp
     * @return
     */
    public static Game uploadFile(HttpServletRequest req, HttpServletResponse resp) {
        Game result = new Game();
        try {
            //把相对路径转为绝对路径
            String realPath = req.getServletContext().getRealPath(FILE_PATH);
            System.out.println("realPath = " + realPath);
            File file = new File(realPath);
            //文件目录是否存在，不存在就创建该目录
            if (!file.exists()) {
                //创建目录
                file.mkdir();
            }
            DiskFileItemFactory dfif = new DiskFileItemFactory();
            dfif.setRepository(file);
            //上传文件 解析表单的参数
            ServletFileUpload sfu = new ServletFileUpload(dfif);
            //表单字段数据
            List<FileItem> fileItems = sfu.parseRequest(req);
            for (FileItem fileItem : fileItems) {
                if (!fileItem.isFormField()) {
                    //当前是文件
                    //防止同个目录下 文件名重复 这里对文件进行重命名
                    String uuid = UUID.randomUUID().toString();
                    //获取文件的原文件名
                    /*
                    fileItem.getName() : java基础.pdf

                    newFileName : 32234234234adsdads_java基础.pdf
                     */
                    String newFileName = uuid + "_" + fileItem.getName();
                    //保存到本地服务器的路径 + 文件名称
                    String filePath = FILE_PATH + newFileName;
                    //保存文件名和文件路径
                    result.setFilename(newFileName);
                    result.setFilepath(FILE_PATH);
                    //本地服务器的绝对路径
                    filePath = req.getServletContext().getRealPath(filePath);
                    //本地服务器的绝对路径 如果文件路径不存在就创建父级路径
                    File f = new File(filePath);
                    f.getParentFile().mkdir();
                    //在服务器上创建一个空文件
                    f.createNewFile();
                    //向文件中写入数据
                    InputStream is = fileItem.getInputStream();
                    FileOutputStream fos = new FileOutputStream(f);
                    byte[] bytes = new byte[1024];
                    int len;
                    while ((len = is.read(bytes)) != -1) {
                        fos.write(bytes, 0, len);
                    }
                    is.close();
                    fos.close();
                    fileItem.delete();
                } else {
                    //普通的表单字段 如：书名、价格...
                    switch (fileItem.getFieldName()) {
                        case "title":
                            result.setTitle(fileItem.getString("utf-8"));
                            break;
                        case "description":
                            result.setDescription(fileItem.getString("utf-8"));
                            break;
                        case "price":
                            result.setPrice(Double.parseDouble(fileItem.getString("utf-8")));
                            break;
                        case "salenum":
                            result.setSaleNum(Integer.parseInt(fileItem.getString("utf-8")));
                            break;
                        case "releasedate":
                            result.setReleaseDate(Date.valueOf(fileItem.getString("utf-8")));
                            break;
                        case "type":
                            result.setType(fileItem.getString("utf-8"));
                            break;
                    }
                }
            }
        } catch (FileUploadException | IOException e) {
            System.out.println("上传文件异常: " + e);
            return null;
        }
        return result;
    }

    /**
     * 文件下载
     */
    public static void downloadFile(HttpServletRequest req, HttpServletResponse resp) {
        String filename = req.getParameter("filename");
//        System.out.println("待下载文件名是：" + filename);
        try {
            resp.setContentType("application/octet-stream");
            String[] s = filename.split("_");
            resp.setHeader("Content-Disposition", "attachment;filename=" + URLEncoder.encode(s[1], "utf-8"));
            ServletOutputStream outputStream = resp.getOutputStream();
            String path = FILE_PATH + filename;
            System.out.println("下载的文件路径是：" + path);
            InputStream ras = req.getServletContext().getResourceAsStream(path);
            byte[] bytes = new byte[1024];
            int len;
            while ((len = ras.read(bytes)) != -1) {
                outputStream.write(bytes, 0, len);
            }
            ras.close();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
