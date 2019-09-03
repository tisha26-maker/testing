package net.celloscope.core.service;

import net.celloscope.core.exception.ValidationException;
import net.celloscope.core.model.ServiceRequestHeader;

@FunctionalInterface
public interface RequestValidatorService {

	public void validate(ServiceRequestHeader requestHeader, String url) throws ValidationException;

}
