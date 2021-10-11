Class {
	#name : #GitCodeMirror,
	#superclass : #GitBridge,
	#category : #'CodeMirror-Dev'
}

{ #category : #accessing }
GitCodeMirror class >> resources [
	^ self root / 'resources'
]
