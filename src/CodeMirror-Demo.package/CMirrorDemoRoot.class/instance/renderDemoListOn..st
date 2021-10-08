accessing
renderDemoListOn: html
	html div
		class: 'cmirror-demo-list';
		with: [ html unorderedList: [ CMirrorAbstractDemo allSubclasses do: [ :aDemoClass | self renderDemosListItemFor: aDemoClass on: html ] ] ]