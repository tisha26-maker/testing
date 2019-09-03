package net.celloscope.antarika.filesystem.genericdata.v1.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import javax.imageio.ImageIO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class WebPImageConverter {
	
	static BufferedImage bImage = null;
	final static String FILE_EXTENSION_WEBP = ".webp";
	final static String FILE_EXTENSION_JPG = ".jpg";
	
	public static void webPToJpg(String webPImageFilePath) {
		File sourceImage = new File(webPImageFilePath + FILE_EXTENSION_WEBP);
		File targetImage = new File(webPImageFilePath + FILE_EXTENSION_JPG);
		try {
			FileInputStream fis = new FileInputStream(sourceImage);
			bImage = ImageIO.read(fis);
			
			if (bImage != null) {
	            ImageIO.write(bImage, "jpg", targetImage); 
	        } else {
	        	log.warn("image is empty");
	        }
		} catch (FileNotFoundException e) {
			log.error("An exception occurred while convert webP to jpg : ", e);
		} catch (IOException e) {
			log.error("An exception occurred while convert webP to jpg : ", e);
		}
	}
	
	public static void jpgToWebP(String jpgImageFilePath) {
		File sourceImage = new File(jpgImageFilePath + FILE_EXTENSION_JPG);
		File targetImage = new File(jpgImageFilePath + FILE_EXTENSION_WEBP);
		try {
			FileInputStream fis = new FileInputStream(sourceImage);
			bImage = ImageIO.read(fis);
			if (bImage != null) {
	            ImageIO.write(bImage, "webp", targetImage);
	            log.info("Image file written successfully");
	        } else {
	        	log.warn("image is empty");
	        }
		} catch (FileNotFoundException e) {
			log.error("An exception occurred while convert jpg to webP : ", e);
		} catch (IOException e) {
			log.error("An exception occurred while convert jpg to webP : ", e);
		}
	}
 }
