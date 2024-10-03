Class {
	#name : #GSHeader,
	#superclass : #WAComponent,
	#instVars : [
		'component'
	],
	#category : #GameStoreDisplay
}

{ #category : #'instance creation' }
GSHeader class >> from: aComponent [ 
	^ self new
		component: aComponent;
		yourself.
]

{ #category : #accessing }
GSHeader >> component [ 
	^ component.

]

{ #category : #accessing }
GSHeader >> component: anObject [ 
	component := anObject.
]

{ #category : #rendering }
GSHeader >> renderAdminButtonOn: html [ 
	html form: [
		html tbsNavbarButton
			tbsPullRight;
			callback: [ component goToAdministrationView ];
			with: [
				html tbsGlyphIcon iconListAlt.
				html text: ' Admin View' ]].
]

{ #category : #rendering }
GSHeader >> renderBrandOn: html [ 
	html tbsNavbarHeader: [
		html tbsNavbarBrand
			url: self application url;
			with: 'GameStore' ]
]

{ #category : #acccessing }
GSHeader >> renderButtonsOn: html [ 
	self renderAdminButtonOn: html.
	self renderSearchButtonOn: html
]

{ #category : #rendering }
GSHeader >> renderContentOn: html [ 
	html tbsNavbar beDefault; with: [
		html tbsContainer: [
			self renderBrandOn: html.
			self renderButtonsOn: html.
		] ]
]

{ #category : #rendering }
GSHeader >> renderSearchButtonOn: html [ 
	html form: [
		html tbsNavbarButton
			tbsPullRight;
			callback: [ component goToSearchView ];
			with: [
				html tbsGlyphIcon iconListAlt.
				html text: ' Search View' ] ]
]
