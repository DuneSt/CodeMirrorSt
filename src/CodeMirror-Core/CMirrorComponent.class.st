Class {
	#name : #CMirrorComponent,
	#superclass : #WAComponent,
	#instVars : [
		'code',
		'language',
		'waitingMessage',
		'timeBeforeSaveOnStopTyping',
		'saveOnLooseFocus',
		'saveCallback'
	],
	#category : #'CodeMirror-Core'
}

{ #category : #'As yet unclassified' }
CMirrorComponent class >> ajaxInitScript [
 ^ 'CMirrorBinding.initEditors()' js
]

{ #category : #accessing }
CMirrorComponent >> code [
	^ code
]

{ #category : #accessing }
CMirrorComponent >> code: anObject [
	code := anObject
]

{ #category : #accessing }
CMirrorComponent >> defaultWaitingHtml [
	^ [ :html | 
	html div
		class: 'tlWaiting';
		with: [ 
					html image
						style: 'height: 50px; width: 50px;';
						url: (MonacoFileLibrary urlOf: 'cog.gif').
					html heading
						level1;
						with: 'Please wait, loading in progress' ];
		yourself ]
]

{ #category : #accessing }
CMirrorComponent >> language [
	^ language ifNil:[ language:= CMirrorLanguage markdown]
]

{ #category : #accessing }
CMirrorComponent >> language: anObject [
	language := anObject
]

{ #category : #accessing }
CMirrorComponent >> renderContentOn: html [
	| component |
	html div
		id: html nextId;
		class: 'cmirror-container';
		style: 'position: relative';
		with: [ self renderSaveButton: html.
			component := html div
				class: 'cmirror-container-editor';
				style: 'width:100%;height:600px;border:1px solid grey;';
				attributeAt: #'data-language' put: self language name;
				yourself.
			self code
				ifNotNil: [ component attributeAt: #'data-code' put: self code ].
			component with: [ self waitingMessage value: html ] ]
]

{ #category : #accessing }
CMirrorComponent >> renderSaveButton: html [
	self saveCallback
		ifNotNil: [ html image
				style:
					'height: 25px;width: 25px;position: absolute;top: 5px;right: 10px;z-index: 10;';
				url: (MonacoFileLibrary urlOf: 'saveIconSvg');
				onClick: (self saveJSScript: html) ]
]

{ #category : #accessing }
CMirrorComponent >> saveCallback [
	^ saveCallback
]

{ #category : #accessing }
CMirrorComponent >> saveCallback: aBlock [
	saveCallback := aBlock
]

{ #category : #accessing }
CMirrorComponent >> saveJSScript: html [
	|ajax|
	ajax := html jQuery ajax.
	^ ajax
		type: 'POST';
		callback:  self saveCallback
		value: (JSStream on: 'CMirrorBinding.save(event.target)');
		onComplete: 'CMirrorBinding.saveCompleted(event.target)';
		onError: 'CMirrorBinding.saveFailed(event.target)'
]

{ #category : #accessing }
CMirrorComponent >> waitingMessage [
	^ waitingMessage ifNil: [ self defaultWaitingHtml ]
]

{ #category : #accessing }
CMirrorComponent >> waitingMessage: anObject [
	waitingMessage := anObject
]
