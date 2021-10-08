class initialization
initialize
	"WAAdmin applicationDefaults removeParent: WADevelopmentConfiguration instance."
	(WAAdmin register: self asApplicationAt: 'CodeMirrorEditorDemo')
		addLibrary: JQDeploymentLibrary;
		addLibrary: CMirrorFileLibrary   