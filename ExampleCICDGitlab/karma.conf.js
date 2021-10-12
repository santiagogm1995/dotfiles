process.env.CHROME_BIN = require("puppeteer").executablePath();
module.exports = function (config) {
	"use strict";

	config.set({
		frameworks: ["ui5"],
		ui5: {
			type: "application",
			configPath: "uimodule/ui5.yaml",
			paths: {
				webapp: "uimodule/webapp",
			},
		},
		customLaunchers: {
			ChromeHeadlessNoSandbox: {
				base: "ChromeHeadless",
				flags: ["--no-sandbox"],
			},
		},
		singleRun: true,
		browsers: ["ChromeHeadlessNoSandbox"],
		browserConsoleLogOptions: {
			level: "error",
		},
	});
};
