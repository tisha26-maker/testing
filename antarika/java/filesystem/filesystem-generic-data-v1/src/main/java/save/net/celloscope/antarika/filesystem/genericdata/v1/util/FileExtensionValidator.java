package net.celloscope.antarika.filesystem.genericdata.v1.util;

public class FileExtensionValidator {

	public static boolean validateFileExtension(String fileExtension) {
		if (fileExtension.equals(".txt") || fileExtension.equals(".webp") || fileExtension.equals(".png")
				|| fileExtension.equals(".jpg") || fileExtension.equals(".jpeg") || fileExtension.equals(".pdf")
				|| fileExtension.equals(".xls")) {
			return true;
		} else {
			return false;
		}
	}
	
	public static boolean validateFileType(String fileType, String fileExtension) {
		if (fileType.equals("image")) {
			if (fileExtension.equals(".webp") || fileExtension.equals(".png") || fileExtension.equals(".jpg")
					|| fileExtension.equals(".jpeg")) {
				return true;
			} else {
				return false;
			}
		} else if (fileType.equals("pdf")) {
			if (fileExtension.equals(".pdf")) {
				return true;
			} else {
				return false;
			}
		} else if (fileType.equals("excel")) {
			if (fileExtension.equals(".xls")) {
				return true;
			} else {
				return false;
			}
		} else if (fileType.equals("text")) {
			if (fileExtension.equals(".txt")) {
				return true;
			} else {
				return false;
			}
		} else {
			return false;
		}
	}
}
