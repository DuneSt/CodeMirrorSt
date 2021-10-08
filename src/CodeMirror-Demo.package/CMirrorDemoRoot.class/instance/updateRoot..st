accessing
updateRoot: anHtmlRoot
	super updateRoot: anHtmlRoot.
	anHtmlRoot title: 'CodeMirror Editor Demo - ' , self class version