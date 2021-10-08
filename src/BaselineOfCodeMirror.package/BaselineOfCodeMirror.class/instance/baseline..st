baselines
baseline: spec
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
					with: [ spec requires: #('CodeMirror-Core' 'gitBrigde' 'FileLibraryHelper') ];
				package: 'CodeMirror-Demo'
					with: [ spec requires: #('CodeMirror-Core') ].
					
			"Groups"		
			spec group: 'core' with: #('CodeMirror-Core') ]