package net.celloscope.antarika.app;

import java.io.File;
import java.net.URL;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class AntarikaServiceContainer {

	public static void main(String[] args) throws Exception {
		
		URL serverURL = AntarikaServiceContainer.class.getClassLoader().getResource("server.yml");
		if (serverURL == null) {
			System.err.println("server.yml not found");
			System.exit(1);
		}

		URL pluginURL = AntarikaServiceContainer.class.getClassLoader().getResource("plugin.yml");
		if (pluginURL == null) {
			System.err.println("plugin.yml not found");
			System.exit(1);
		}
		DropWizardApp app = new DropWizardApp(new File(pluginURL.toURI()).getAbsolutePath());
		app.run(new String[] { "server", new File(serverURL.toURI()).getAbsolutePath() });
		log.info(app.getName() + " is running...");
		
	}

}
