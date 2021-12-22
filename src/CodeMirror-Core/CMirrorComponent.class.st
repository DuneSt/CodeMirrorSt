Class {
	#name : #CMirrorComponent,
	#superclass : #WAComponent,
	#instVars : [
		'code',
		'language',
		'waitingMessage',
		'GraphicalsActions'
	],
	#category : #'CodeMirror-Core'
}

{ #category : #'As yet unclassified' }
CMirrorComponent class >> ajaxInitScript [
 ^ 'CMirrorBinding.initEditors()' js
]

{ #category : #accessing }
CMirrorComponent >> addCallback: aCallbackBlock onComplete: jsOnCompleteScript withIcon: icon [
	self graphicalsActions
		add:
			(CMirrorAdvancedCallBackIcon new
				icon: icon;
				block: aCallbackBlock;
				onCompleteJs: jsOnCompleteScript;
				yourself)
]

{ #category : #accessing }
CMirrorComponent >> addCallback: aCallbackBlock withIcon: icon [
	self graphicalsActions
		add:
			(CMirrorSimpleCallBackIcon new
				icon: icon;
				block: aCallbackBlock;
				yourself)
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
						url: (CMirrorLibrary urlOf: 'cog.gif').
					html heading
						level1;
						with: 'Please wait, loading in progress' ];
		yourself ]
]

{ #category : #accessing }
CMirrorComponent >> graphicalsActions [
	^ GraphicalsActions ifNil: [ GraphicalsActions := OrderedCollection new ]
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
	| component id |
	id := html nextId.
	html div
		id: id;
		class: 'cmirror-container';
		style: 'position: relative';
		with: [ self renderGraphicalsActionsOn: html forEditorId: id.
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
CMirrorComponent >> renderGraphicalsActionsOn: html forEditorId: id [
	self graphicalsActions
		doWithIndex: [ :action :index | 
			action
				id: id;
				position: index;
				renderContentOn: html ]
]

{ #category : #accessing }
CMirrorComponent >> saveCallback: aBlock [
	self addCallback: aBlock withIcon: (CMirrorLibrary urlOf: 'iconmonstrsave3Svg')
]

{ #category : #Toolkit }
CMirrorComponent >> text: aString [
	self code: aString
]

{ #category : #accessing }
CMirrorComponent >> waitingMessage [
	^ waitingMessage ifNil: [ self defaultWaitingHtml ]
]

{ #category : #accessing }
CMirrorComponent >> waitingMessage: anObject [
	waitingMessage := anObject
]
