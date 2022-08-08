package com.team.delivery;

import java.io.IOException;
import java.nio.file.*;

public class FileUtils {
    public static void  main(String[] args){
        Path directPath= Paths.get("D:\\image\\newfile");
        try {
            Files.createDirectory(directPath);
            System.out.println(directPath+"디렉토리 생성");
        }catch (FileAlreadyExistsException e){
            System.out.println("디렉토리 이미 존재");
        }catch (NoSuchFileException e){
            System.out.println("디렉토리 경로 없음");
        }catch (IOException e){
            e.printStackTrace();
        }
    }

}
