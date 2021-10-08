accessing
renderTitleOn: html
	html div
		class: 'cmirror-demo-page-title';
		with: [ html heading
				level3;
				with: self title.
			html paragraph: self description.
			self warningDescription ifNotNil: [ :desc | html strong: desc ] ]