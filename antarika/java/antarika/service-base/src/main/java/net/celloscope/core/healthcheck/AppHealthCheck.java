package net.celloscope.core.healthcheck;

import org.springframework.stereotype.Service;

import com.codahale.metrics.health.HealthCheck;

@Service("appHealthCheck")
public class AppHealthCheck extends HealthCheck {

	public AppHealthCheck() {
	}

	@Override
	protected Result check() throws Exception {
		final String saying = String.format("Hello, %s!", "Antarika");
		if (!saying.contains("Antarika")) {
			return Result.unhealthy("Antarika template doesn't include a name");
		}
		return Result.healthy();
	}

}