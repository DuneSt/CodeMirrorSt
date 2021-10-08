accessing
renderContentOn: html
	self renderTitleOn: html.
	html div
		class: 'cmirror-demo-snippet-group';
		with: [ self renderDemoOn: html.
			self renderCodeOfDemoOn: html ].