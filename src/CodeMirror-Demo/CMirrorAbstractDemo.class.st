Class {
	#name : #CMirrorAbstractDemo,
	#superclass : #WAComponent,
	#category : #'CodeMirror-Demo'
}

{ #category : #accessing }
CMirrorAbstractDemo class >> description [
	^ self subclassResponsibility
]

{ #category : #accessing }
CMirrorAbstractDemo class >> title [
	^ self subclassResponsibility
]

{ #category : #accessing }
CMirrorAbstractDemo >> description [
	^ self class description
]

{ #category : #accessing }
CMirrorAbstractDemo >> renderCodeOfDemoOn: html [
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
]

{ #category : #accessing }
CMirrorAbstractDemo >> renderContentOn: html [
	self renderTitleOn: html.
	html div
		class: 'cmirror-demo-snippet-group';
		with: [ self renderDemoOn: html.
			self renderCodeOfDemoOn: html ].
]

{ #category : #accessing }
CMirrorAbstractDemo >> renderDemoOn: html [
	html div
		class: 'cmirror-demo-snippet-demo';
		with: [ self renderMEditorComponentOn: html ]
]

{ #category : #accessing }
CMirrorAbstractDemo >> renderMEditorComponentOn: html [
	^ self subclassResponsibility
]

{ #category : #accessing }
CMirrorAbstractDemo >> renderTitleOn: html [
	html div
		class: 'cmirror-demo-page-title';
		with: [ html heading
				level3;
				with: self title.
			html paragraph: self description.
			self warningDescription ifNotNil: [ :desc | html strong: desc ] ]
]

{ #category : #accessing }
CMirrorAbstractDemo >> title [
	^ self class title
]

{ #category : #accessing }
CMirrorAbstractDemo >> warningDescription [
	"If a demo needs a warning, override this method."

	^ nil
]
