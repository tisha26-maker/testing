package net.celloscope.core.util;

import java.io.File;
import java.io.IOException;
import org.apache.commons.codec.DecoderException;
import org.apache.commons.codec.binary.Hex;
import org.apache.commons.codec.binary.StringUtils;
import org.apache.commons.io.FileUtils;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class ByteUtils {
	
	public static byte[] convertFileToByte(String filePath) {
		try {
			return FileUtils.readFileToByteArray(new File(filePath));
		} catch (Exception e) {
			log.error("An exception occurred while converting file to bytes : ", filePath, e);
		}
		return null;
	}

	public static void writeToFile(String bytes, String filePath, String fileName) throws IOException,DecoderException{
		try {
			FileUtils.writeByteArrayToFile(FileUtils.getFile(filePath + fileName), hexStringToByteArray2(bytes));
		} catch (IOException e) {
			log.error("An exception occurred while writing Byte Array to file : ", filePath, e);
			throw e;
		}
		catch(DecoderException decoderException)
		{
		    log.error("An exception occurred while writing Byte Array to file : ", filePath, decoderException);
			throw decoderException;
		}
	}

	public static byte[] stringToBytesASCII(String str) {
		return StringUtils.getBytesUsAscii(str);
	}

	public static final byte[] hexStringToByteArray2(final String hex) throws DecoderException{
		try {
			return Hex.decodeHex(hex.toCharArray());
		} catch(DecoderException e) {
			log.error("An exception occurred while decoding hex string : ", hex, e);
		    throw e;
		}
	}

	public static String bytesToHexString(byte[] bytes) {
		return Hex.encodeHexString(bytes);
	}
	
}
