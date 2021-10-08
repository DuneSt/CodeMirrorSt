accessing
renderCodeOfDemoOn: html
	html heading
		level3;
		with: 'Code:'.
	html div
		class: 'cmirror-demo-snippet-code';
		with: [ html text: #TODO"html
				render:
					(PrismComponent new
						sourceCode: [ (self class >> #renderPrismComponentOn:) sourceCode ];
						language: #smalltalk;
						enableCopyOnClick;
						yourself)" ]