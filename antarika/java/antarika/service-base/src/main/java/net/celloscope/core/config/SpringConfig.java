package net.celloscope.core.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@EnableAsync
@Configuration
@EnableTransactionManagement
@ComponentScan(basePackages = { "net.celloscope" })
@Import({ DataSourceConfig.class})
public class SpringConfig {

}
