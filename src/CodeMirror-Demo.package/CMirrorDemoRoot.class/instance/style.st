accessing
style
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
	
.meditor-demo{
	display: flex;
	display: -webkit-flex;
	display: -ms-flexbox;
	background: #fafafa;
	height: 100%;
	width: 100%;
}

.meditor-demo-list{
	width: 225px;
	height: 100%;
	background-color: #FFF;
	box-shadow: 0 4px 5px 0 rgba(0,0,0,.14),0 1px 10px 0 rgba(0,0,0,.12),0 2px 4px -1px rgba(0,0,0,.2);
}

.meditor-demo-list ul{
	padding-left: 0;
	font-size: 14px;
	line-height: 24px;
	font-weight: 400;
	letter-spacing: 0;
}

.meditor-demo-list li{
	-webkit-transition: all 450ms cubic-bezier(.23, 1, .32, 1) 0ms;
	transition: all 450ms cubic-bezier(.23, 1, .32, 1) 0ms;
	width: 100%;
	line-height: 0;
}

.meditor-demo-list li a{
	padding-left: 15px;
	font-size: 16px;
	font-weight: inherit;
	display: -webkit-flex;
	color: rgba(0,0,0,0.87);
	text-decoration: none;
	white-space: nowrap;
	cursor: pointer;
}

.meditor-demo-list li a:hover{
	background-color: #eee;
}

.meditor-demo-list li a span{
	line-height: 60px;
}

.meditor-demo-list-item_active{
	background-color: rgba(206,147,216 ,1);
}

.meditor-demo-list li.meditor-demo-list-item_active a:hover{
	background-color: rgba(186,104,200 ,1);
}

.meditor-demo-list li.meditor-demo-list-item_active a{
	color: #FFF;
}

.meditor-demo main{
	display: inline-block;
	-webkit-flex-grow: 1;
	-ms-flex-positive: 1;
	flex-grow: 1;
	overflow: auto;
}

.meditor-demo-page{
	padding: 16px;
}

.meditor-demo-page-title{
	margin-bottom: 60px;
	margin-left: 32px;
	text-align: justify;
}

.meditor-demo-page-title h3{
	font-size: 16px;
	font-weight: 600;
	margin-top: 80px;
	text-transform: uppercase;
	color: rgba(0,0,0,.54);
	line-height: 40px;
}

.meditor-demo-page-title p{	
	margin-top: 16px;
	margin-bottom: 16px;
	font-size: 13px;
	max-width: 640px;
}

.meditor-demo-snippet-group{
	width: 100%;
	overflow: hidden;
	display: flex;
	display: -webkit-flex;
	display: -ms-flexbox;
	flex-direction: column;
}

.meditor-demo-snippet-demo pre, .meditor-demo .minimap-container{
	height: 400px;
	box-shadow: 0 4px 5px 0 rgba(0,0,0,.14),0 1px 10px 0 rgba(0,0,0,.12),0 2px 4px -1px rgba(0,0,0,.2);
	margin-bottom: 50px;
}

.meditor-demo pre{
	margin-top: 0;
	margin-bottom: 0;
	padding-top: 0;
	padding-bottom: 0;
}

.meditor-demo .minimap-container pre{
	width: initial;
}
'

