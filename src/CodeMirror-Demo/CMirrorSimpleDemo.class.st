Class {
	#name : #CMirrorSimpleDemo,
	#superclass : #CMirrorAbstractDemo,
	#category : #'CodeMirror-Demo'
}

{ #category : #accessing }
CMirrorSimpleDemo class >> description [
	^ 'Simple display and edition of markdown, without event'
]

{ #category : #accessing }
CMirrorSimpleDemo class >> title [
	^ 'Simple display'
]

{ #category : #rendering }
CMirrorSimpleDemo >> renderMEditorComponentOn: html [
	^ html
		div:
			(CMirrorComponent new
				code: CMirrorLibrary new codemirrorJs;
				language: CMirrorLanguage javascript;
				yourself)
]
