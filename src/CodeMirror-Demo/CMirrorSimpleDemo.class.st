Class {
	#name : #CMirrorSimpleDemo,
	#superclass : #CMirrorAbstractDemo,
	#category : #'CodeMirror-Demo'
}

{ #category : #accessing }
CMirrorSimpleDemo class >> description [
	^ 'Simple display and edition of markdown, without event'
]

{ #category : #accessing }
CMirrorSimpleDemo class >> title [
	^ 'Simple display'
]

{ #category : #rendering }
CMirrorSimpleDemo >> renderMEditorComponentOn: html [
	^ html
		div:
			(CMirrorComponent new
				text:
					'
Try highlighting this text.


# h1 Heading 
## h2 Heading
### h3 Heading
#### h4 Heading
##### h5 Heading
###### h6 Heading

## Lists

Unordered

+ Create a list by starting a line with `+`, `-`, or `*`
+ Sub-lists are made by indenting 2 spaces:
  - Marker character change forces new list start:
    * Ac tristique libero volutpat at
    + Facilisis in pretium nisl aliquet
    - Nulla volutpat aliquam velit
+ Very easy!

Ordered

1. Lorem ipsum dolor sit amet
2. Consectetur adipiscing elit
3. Integer molestie lorem at massa


1. You can use sequential numbers...
1. ...or keep all the numbers as `1.`

Start numbering with offset:

57. foo
1. bar

';
				yourself)
]
