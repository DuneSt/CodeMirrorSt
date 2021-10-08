accessing
renderDemoOn: html
	html div
		class: 'cmirror-demo-snippet-demo';
		with: [ self renderMEditorComponentOn: html ]