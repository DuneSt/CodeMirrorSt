accessing
renderContentOn: html
	html div
		class: 'cmirror-demo';
		with: [ self renderDemoListOn: html.
			(html tag: 'main')
				with: [ html div: 'Note: We''re not affiliated with Medium.com'.
					html div
						class: 'cmirror-demo-page';
						with: [ html render: self currentDemo ] ] ]