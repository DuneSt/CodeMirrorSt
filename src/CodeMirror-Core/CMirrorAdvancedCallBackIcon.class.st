Class {
	#name : #CMirrorAdvancedCallBackIcon,
	#superclass : #CMirrorSimpleCallBackIcon,
	#instVars : [
		'onCompleteJs'
	],
	#category : #'CodeMirror-Core'
}

{ #category : #accessing }
CMirrorAdvancedCallBackIcon >> jsScriptOnComplete: html [
	^ String
		streamContents: [ :s | 
			s
				<< (super jsScriptOnComplete: html);
				<< ';'.
			(self onCompleteJs cull: html) javascriptContentOn: s ]
]

{ #category : #accessing }
CMirrorAdvancedCallBackIcon >> onCompleteJs [
	^ onCompleteJs
]

{ #category : #accessing }
CMirrorAdvancedCallBackIcon >> onCompleteJs: anObject [
	onCompleteJs := anObject
]
