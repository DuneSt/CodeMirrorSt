Class {
	#name : #CMirrorLanguage,
	#superclass : #Object,
	#instVars : [
		'name'
	],
	#category : #'CodeMirror-Core'
}

{ #category : #'as yet unclassified' }
CMirrorLanguage class >> java [
	^ self new
		name: #java;
		yourself
]

{ #category : #'as yet unclassified' }
CMirrorLanguage class >> javascript [
	^ self new
		name: #javascript;
		yourself
]

{ #category : #'as yet unclassified' }
CMirrorLanguage class >> markdown [
	^ self new
		name: #markdown;
		yourself
]

{ #category : #'as yet unclassified' }
CMirrorLanguage class >> smalltalk [
	^ self new
		name: #smalltalk;
		yourself
]

{ #category : #'as yet unclassified' }
CMirrorLanguage class >> typescript [
	^ self new
		name: #typescript;
		yourself
]

{ #category : #accessing }
CMirrorLanguage >> name [
	^ name
]

{ #category : #accessing }
CMirrorLanguage >> name: anObject [
	name := anObject
]
