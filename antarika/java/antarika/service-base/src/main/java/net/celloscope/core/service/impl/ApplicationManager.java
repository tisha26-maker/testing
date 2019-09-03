package net.celloscope.core.service.impl;

import org.springframework.stereotype.Component;

import io.dropwizard.lifecycle.Managed;
import lombok.NoArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@NoArgsConstructor
@Component("applicationManager")
public class ApplicationManager implements Managed {
    
    @Override
    public void start() throws Exception {
        log.info("Antarika Start");
    }

    @Override
    public void stop() throws Exception {
        log.warn("Antarika Stop");
    }
    
}

