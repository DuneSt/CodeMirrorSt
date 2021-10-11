Extension { #name : #CMirrorLibrary }

{ #category : #'*CodeMirror-Dev' }
CMirrorLibrary class >> addSelectorsOf: aProtocoleName to: aBuffer [
	(self selectorsInProtocol:  aProtocoleName )
		do: [ :aSelector | aBuffer << ' ';
			<< aSelector  ]
]

{ #category : #'*CodeMirror-Dev' }
CMirrorLibrary class >> compileSelectorToIncludes [
	<script>
	self
		compile:
			'selectorsToInclude
	^ #('
				,
					(String
						streamContents: [ :aStream | 
							#('js' 'css' 'codemirror' 'languages-modes')
								do: [ :aProtocol | self addSelectorsOf: aProtocol to: aStream ] ])
				, ')'
]

{ #category : #'*CodeMirror-Dev' }
CMirrorLibrary class >> deployFiles [
	<script>
	super deployFiles
]

{ #category : #'*CodeMirror-Dev' }
CMirrorLibrary class >> filesDirectory [
	^ GitCodeMirror resources
]

{ #category : #'*CodeMirror-Dev' }
CMirrorLibrary class >> importFiles [
	<script>
	super importFiles.
	self compileSelectorToIncludes
]

{ #category : #'*CodeMirror-Dev' }
CMirrorLibrary class >> openImportButton [
	<script>
	super openImportButton
]
