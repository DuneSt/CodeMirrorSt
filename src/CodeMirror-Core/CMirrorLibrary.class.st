Class {
	#name : #CMirrorLibrary,
	#superclass : #WAFileLibrary,
	#category : #'CodeMirror-Core'
}

{ #category : #fileLibraryHelper }
CMirrorLibrary class >> deployFiles [
	<script>
	super deployFiles
]

{ #category : #fileLibraryHelper }
CMirrorLibrary class >> filesDirectory [
	^ GitCodeMirror resources
]

{ #category : #fileLibraryHelper }
CMirrorLibrary class >> importFiles [
	<script>
	super importFiles
]

{ #category : #fileLibraryHelper }
CMirrorLibrary class >> openImportButton [
	<script>
	super openImportButton
]
