Class {
	#name : #CMirrorSaveDemo,
	#superclass : #CMirrorAbstractDemo,
	#classInstVars : [
		'code'
	],
	#category : #'CodeMirror-Demo'
}

{ #category : #accessing }
CMirrorSaveDemo class >> code [
	^ code
]

{ #category : #accessing }
CMirrorSaveDemo class >> code: aString [
	code := aString
]

{ #category : #accessing }
CMirrorSaveDemo class >> description [
	^ 'The code in  editor is keep betwwen each reload'
]

{ #category : #accessing }
CMirrorSaveDemo class >> title [
	^ 'Save code demo'
]

{ #category : #accessing }
CMirrorSaveDemo >> renderMEditorComponentOn: html [
	html
		render:
			((CMirrorComponent new
				code: self class code;
				language: CMirrorLanguage markdown;
				yourself)
				saveCallback: [ :text | self class code: text ])
]
