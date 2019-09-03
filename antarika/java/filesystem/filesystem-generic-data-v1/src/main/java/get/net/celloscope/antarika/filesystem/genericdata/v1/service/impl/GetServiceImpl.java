package net.celloscope.antarika.filesystem.genericdata.v1.service.impl;

import java.io.File;

import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import net.celloscope.antarika.filesystem.genericdata.v1.request.GetRequest;
import net.celloscope.antarika.filesystem.genericdata.v1.response.GetResponse;
import net.celloscope.antarika.filesystem.genericdata.v1.service.GetService;
import net.celloscope.antarika.filesystem.genericdata.v1.util.FileExtensionValidator;
import net.celloscope.antarika.filesystem.genericdata.v1.util.ValidationMessage;
import net.celloscope.core.exception.AppException;
import net.celloscope.core.service.impl.BaseServiceImpl;
import net.celloscope.core.util.ByteUtils;
import net.celloscope.core.util.Code;
import net.celloscope.core.util.Message;

@Slf4j
@Service("fileSystemGenericDataV1GetService")
public class GetServiceImpl extends BaseServiceImpl implements GetService {

	@Override
	public GetResponse perform(String url, String version, long requestReceivedTime, GetRequest request, GetResponse response){
		log.debug("Save file : {}", request.getBody().getFileName());
		try {
			requestValidatorService.validate(request.getHeader(), url);
			super.saveAntarikaRequestLog(request, response.getHeader(), requestReceivedTime);
			if (!FileExtensionValidator.validateFileExtension(request.getBody().getFileExtension())) {
				headerUtil.setCodeMessage(response.getHeader(), Code.C_402.get(), Message.REQUEST_MSG_PREFIX+ValidationMessage.INVALID_FILE_EXTENSION);
				return response;
			}
			
			StringBuilder filePath = new StringBuilder()
				.append(request.getBody().getFilePath())
				.append(request.getBody().getFileName())
				.append(request.getBody().getFileExtension().toCharArray())
				.append("");
			
			File f = new File(filePath.toString());
			if(!f.exists()) { 
				headerUtil.setCodeMessage(response.getHeader(), Code.C_402.get(), "File not found");
				return response;
			}
			byte[] fileByte = ByteUtils.convertFileToByte(filePath.toString());
			String fileHexString = ByteUtils.bytesToHexString(fileByte);
			response.getBody().setPhotoContent(fileHexString);
			headerUtil.setCodeMessage(response.getHeader(), Code.C_200.get(), Message.REQUEST_SUCCESSFULLY_PROCESSED);
			log.debug("Successfully got file data : {}", f.getName());
		} catch (AppException appException) {
			headerUtil.setCodeMessage(response.getHeader(), appException.getCode(), appException.getMessage());
		} catch (Exception e) {
			headerUtil.setCodeMessage(response.getHeader(), Code.C_500.get(), e.getMessage());
		}
		return response;
	}
	
}
