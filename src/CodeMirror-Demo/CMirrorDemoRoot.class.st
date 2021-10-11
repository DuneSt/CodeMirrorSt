Class {
	#name : #CMirrorDemoRoot,
	#superclass : #WAComponent,
	#instVars : [
		'currentDemo'
	],
	#category : #'CodeMirror-Demo'
}

{ #category : #'class initialization' }
CMirrorDemoRoot class >> initialize [
	"WAAdmin applicationDefaults removeParent: WADevelopmentConfiguration instance."
	(WAAdmin register: self asApplicationAt: 'CodeMirrorEditorDemo')
		addLibrary: JQDeploymentLibrary;
		addLibrary: CMirrorLibrary    
]

{ #category : #'class initialization' }
CMirrorDemoRoot class >> version [
	^ 'v1.0.0'
]

{ #category : #accessing }
CMirrorDemoRoot >> currentDemo [
	^ currentDemo
]

{ #category : #accessing }
CMirrorDemoRoot >> currentDemo: anObject [
	currentDemo := anObject
]

{ #category : #accessing }
CMirrorDemoRoot >> initialize [
	super initialize.
	self currentDemo: CMirrorSimpleDemo new
]

{ #category : #accessing }
CMirrorDemoRoot >> renderContentOn: html [
	html div
		class: 'cmirror-demo';
		with: [ self renderDemoListOn: html.
			(html tag: 'main')
				with: [ html div
						class: 'cmirror-demo-page';
						with: [ html render: self currentDemo ] ] ]
]

{ #category : #accessing }
CMirrorDemoRoot >> renderDemoListOn: html [
	html div
		class: 'cmirror-demo-list';
		with: [ html unorderedList: [ CMirrorAbstractDemo allSubclasses do: [ :aDemoClass | self renderDemosListItemFor: aDemoClass on: html ] ] ]
]

{ #category : #accessing }
CMirrorDemoRoot >> renderDemosListItemFor: aDemoClass on: html [
	html listItem
		class: 'cmirror-demo-list-item_active' if: aDemoClass = self currentDemo class;
		with: [ html anchor
				callback: [ self currentDemo: aDemoClass new ];
				with: [ html span: aDemoClass title ] ]
]

{ #category : #accessing }
CMirrorDemoRoot >> style [
	^ 'body, html{
	margin: 0;
	height: 100%;
	width: 100%;
	font-size: 14px;
	font-weight: 400;
	line-height: 20px;
	color: #757575;
	font-family: ''Roboto'',''Helvetica'',''Arial'', sans-serif;
}
	
.cmirror-demo{
	display: flex;
	display: -webkit-flex;
	display: -ms-flexbox;
	background: #fafafa;
	height: 100%;
	width: 100%;
}

.cmirror-demo-list{
	width: 225px;
	height: 100%;
	background-color: #FFF;
	box-shadow: 0 4px 5px 0 rgba(0,0,0,.14),0 1px 10px 0 rgba(0,0,0,.12),0 2px 4px -1px rgba(0,0,0,.2);
}

.cmirror-demo-list ul{
	padding-left: 0;
	font-size: 14px;
	line-height: 24px;
	font-weight: 400;
	letter-spacing: 0;
}

.cmirror-demo-list li{
	-webkit-transition: all 450ms cubic-bezier(.23, 1, .32, 1) 0ms;
	transition: all 450ms cubic-bezier(.23, 1, .32, 1) 0ms;
	width: 100%;
	line-height: 0;
}

.cmirror-demo-list li a{
	padding-left: 15px;
	font-size: 16px;
	font-weight: inherit;
	display: -webkit-flex;
	color: rgba(0,0,0,0.87);
	text-decoration: none;
	white-space: nowrap;
	cursor: pointer;
}

.cmirror-demo-list li a:hover{
	background-color: #eee;
}

.cmirror-demo-list li a span{
	line-height: 60px;
}

.cmirror-demo-list-item_active{
	background-color: rgba(206,147,216 ,1);
}

.cmirror-demo-list li.cmirror-demo-list-item_active a:hover{
	background-color: rgba(186,104,200 ,1);
}

.cmirror-demo-list li.cmirror-demo-list-item_active a{
	color: #FFF;
}

.cmirror-demo main{
	display: inline-block;
	-webkit-flex-grow: 1;
	-ms-flex-positive: 1;
	flex-grow: 1;
	overflow: auto;
}

.cmirror-demo-page{
	padding: 16px;
}

.cmirror-demo-page-title{
	margin-bottom: 60px;
	margin-left: 32px;
	text-align: justify;
}

.cmirror-demo-page-title h3{
	font-size: 16px;
	font-weight: 600;
	margin-top: 80px;
	text-transform: uppercase;
	color: rgba(0,0,0,.54);
	line-height: 40px;
}

.cmirror-demo-page-title p{	
	margin-top: 16px;
	margin-bottom: 16px;
	font-size: 13px;
	max-width: 640px;
}

.cmirror-demo-snippet-group{
	width: 100%;
	overflow: hidden;
	display: flex;
	display: -webkit-flex;
	display: -ms-flexbox;
	flex-direction: column;
}

.cmirror-demo-snippet-demo-code pre, .cmirror-demo .minimap-container{
	height: 400px;
	box-shadow: 0 4px 5px 0 rgba(0,0,0,.14),0 1px 10px 0 rgba(0,0,0,.12),0 2px 4px -1px rgba(0,0,0,.2);
	margin-bottom: 50px;
}

.cmirror-demo pre{
	margin-top: 0;
	margin-bottom: 0;
	padding-top: 0;
	padding-bottom: 0;
}

.cmirror-demo .minimap-container pre{
	width: initial;
}
'


]

{ #category : #accessing }
CMirrorDemoRoot >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot title: 'CodeMirror Editor Demo - ' , self class version
]
