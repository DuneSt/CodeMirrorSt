Class {
	#name : #BaselineOfCodeMirror,
	#superclass : #BaselineOf,
	#category : #BaselineOfCodeMirror
}

{ #category : #baselines }
BaselineOfCodeMirror >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ "Dependencies"
			self
				seaside3: spec;
				gitBridge: spec;
				fileLibraryHelper: spec.

			"Packages"
			spec
				package: 'CodeMirror-Core' with: [ spec requires: #('Seaside3') ];
				package: 'CodeMirror-Dev'
					with: [ spec requires: #('CodeMirror-Core' 'GitBridge' 'FileLibraryHelper') ];
				package: 'CodeMirror-Demo'
					with: [ spec requires: #('CodeMirror-Core') ].
					
			"Groups"		
			spec group: 'core' with: #('CodeMirror-Core') ]
]

{ #category : #dependencies }
BaselineOfCodeMirror >> fileLibraryHelper: spec [
	"I small project to help developers to manage the files in the FileLibrary."

	spec
		baseline: 'FileLibraryHelper'
		with: [ spec repository: 'github://jecisc/FileLibraryHelper:v1.x.x/src' ]
]

{ #category : #dependencies }
BaselineOfCodeMirror >> gitBridge: spec [
	spec
    	baseline: 'GitBridge'
    	with: [ spec repository: 'github://jecisc/GitBridge:v1.x.x/src' ]
]

{ #category : #dependencies }
BaselineOfCodeMirror >> seaside3: spec [
	spec
		baseline: 'Seaside3'
		with: [ spec
				loads: #('Core' 'JQuery' 'Zinc');
				repository: 'github://SeasideSt/Seaside/repository' ]
]
