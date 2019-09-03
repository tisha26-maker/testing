package net.celloscope.antarika.filesystem.genericdata.v1.service.impl;

import java.io.File;
import java.io.IOException;

import org.apache.commons.codec.DecoderException;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import net.celloscope.antarika.filesystem.genericdata.v1.request.SaveRequest;
import net.celloscope.antarika.filesystem.genericdata.v1.response.SaveResponse;
import net.celloscope.antarika.filesystem.genericdata.v1.service.SaveService;
import net.celloscope.antarika.filesystem.genericdata.v1.util.FileExtensionValidator;
import net.celloscope.antarika.filesystem.genericdata.v1.util.ValidationMessage;
import net.celloscope.core.exception.AppException;
import net.celloscope.core.service.impl.BaseServiceImpl;
import net.celloscope.core.util.ByteUtils;
import net.celloscope.core.util.Code;
import net.celloscope.core.util.Message;

@Slf4j
@Service("fileSystemGenericDataV1SaveService")
public class SaveServiceImpl extends BaseServiceImpl implements SaveService {

	@Override
	public SaveResponse perform(String url, String version, long requestReceivedTime, SaveRequest request, SaveResponse response) {
		log.debug("Save file : {}", request.getBody().getFileName());
		try {
			requestValidatorService.validate(request.getHeader(), url);
			super.saveAntarikaRequestLog(request, response.getHeader(), requestReceivedTime);
			if (!FileExtensionValidator.validateFileExtension(request.getBody().getFileExtension())) {
				headerUtil.setCodeMessage(response.getHeader(), Code.C_402.get(), Message.REQUEST_MSG_PREFIX+ValidationMessage.INVALID_FILE_EXTENSION);
				return response;
			}

			if (!FileExtensionValidator.validateFileType(request.getBody().getFileType(), request.getBody().getFileExtension())) {
				headerUtil.setCodeMessage(response.getHeader(), Code.C_401.get(), Message.REQUEST_MSG_PREFIX+ValidationMessage.FILE_TYPE_FILE_EXTENSION_NOT_MATCHED);
				return response;
			}
			
			File dir = new File(request.getBody().getFilePath());
			boolean isDirectoryExist = true;
			if (!dir.exists()) {
				isDirectoryExist = dir.mkdirs();
			}
			
			if (!isDirectoryExist) {
				headerUtil.setCodeMessage(response.getHeader(), Code.C_402.get(), Message.REQUEST_MSG_PREFIX+ValidationMessage.COULD_NOT_CREATE_FILE_DIRECTORY);
				return response;
			}

			ByteUtils.writeToFile(request.getBody().getFileData(), request.getBody().getFilePath(), request.getBody().getFileName() + request.getBody().getFileExtension().toLowerCase());
			response.getBody().setData(true);
			headerUtil.setCodeMessage(response.getHeader(), Code.C_200.get(), Message.REQUEST_SUCCESSFULLY_PROCESSED);
			log.debug("Successfully save file");
			
		} catch (AppException appException) {
			headerUtil.setCodeMessage(response.getHeader(), appException.getCode(), appException.getMessage());
		} catch (IOException ioException) {
			headerUtil.setCodeMessage(response.getHeader(), Code.C_401.get(), ioException.getMessage());
		} catch (DecoderException decoderException) {
			headerUtil.setCodeMessage(response.getHeader(), Code.C_402.get(), Message.REQUEST_MSG_PREFIX+ValidationMessage.INVALID_DATA);
		}
		return response;
	}
	
}

