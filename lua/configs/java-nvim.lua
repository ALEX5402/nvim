local jdtls = require("jdtls")

local root_dir = jdtls.setup.find_root({ ".git", "pom.xml", "build.gradle" })
local workspace_dir = "/path/to/workspace/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

jdtls.start_or_attach({
	cmd = {
		"java",
		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Djava.home=/path/to/java/home",
		"-Dfile.encoding=UTF-8",
		"-Xmx1g",
		"-jar",
		"/path/to/jdtls/plugins/org.eclipse.equinox.launcher_*.jar",
		"-configuration",
		"/path/to/jdtls/config_linux",
		"-data",
		workspace_dir,
	},
	root_dir = root_dir,
})
