Class {
	#name : #CMirrorSimpleCallBackIcon,
	#superclass : #Object,
	#instVars : [
		'block',
		'icon',
		'id',
		'position',
		'jsScript'
	],
	#category : #'CodeMirror-Core'
}

{ #category : #accessing }
CMirrorSimpleCallBackIcon >> block [
	^ block
]

{ #category : #accessing }
CMirrorSimpleCallBackIcon >> block: anObject [
	block := anObject
]

{ #category : #accessing }
CMirrorSimpleCallBackIcon >> icon [
	^ icon
]

{ #category : #accessing }
CMirrorSimpleCallBackIcon >> icon: anObject [
	icon := anObject
]

{ #category : #accessing }
CMirrorSimpleCallBackIcon >> id [
	^ id
]

{ #category : #accessing }
CMirrorSimpleCallBackIcon >> id: anObject [
	id := anObject
]

{ #category : #accessing }
CMirrorSimpleCallBackIcon >> jsScript: html [
	^ jsScript
		ifNil: [ html jQuery ajax
				type: 'POST';
				callback: self block
					value: (JSStream on: 'CMirrorBinding.save("' , self id , '")');
				onComplete: (self jsScriptOnComplete: html);
				onError: 'CMirrorBinding.saveFailed("' , self id , '")' ]
]

{ #category : #accessing }
CMirrorSimpleCallBackIcon >> jsScriptOnComplete: html [
	^ 'CMirrorBinding.saveCompleted("' , self id , '")'
]

{ #category : #'As yet unclassified' }
CMirrorSimpleCallBackIcon >> position [
	^ position
]

{ #category : #'as yet unclassified' }
CMirrorSimpleCallBackIcon >> position: anInteger [ 
	position := anInteger
]

{ #category : #accessing }
CMirrorSimpleCallBackIcon >> renderContentOn: html [
	html image
		id: self id , '-save';
		style:
			'height: 25px;width: 25px; position: absolute;top: 5px;right: '
				, ((self position * 26 - 15) asString) , 'px;z-index: 10;';
		url: self icon;
		onClick: (self jsScript: html)
]
