accessing
renderDemosListItemFor: aDemoClass on: html
	html listItem
		class: 'cmirror-demo-list-item_active' if: aDemoClass = self currentDemo class;
		with: [ html anchor
				callback: [ self currentDemo: aDemoClass new ];
				with: [ html span: aDemoClass title ] ]