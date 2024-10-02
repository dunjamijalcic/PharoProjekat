Class {
	#name : #GameStoreRoot,
	#superclass : #WAComponent,
	#instVars : [
		'main'
	],
	#category : #GameStoreDisplay
}

{ #category : #testing }
GameStoreRoot class >> canBeRoot [
	^ true
]

{ #category : #'class initialization' }
GameStoreRoot class >> initialize [
	| app |
	app := WAAdmin register: self asApplicationAt: 'GameStore'.
	app
		addLibrary: JQDeploymentLibrary;
		addLibrary: JQUiDeploymentLibrary;
		addLibrary: TBSDeploymentLibrary.
]

{ #category : #hooks }
GameStoreRoot >> children [ 
	^ { main }
]

{ #category : #initialization }
GameStoreRoot >> initialize [ 
	super initialize.
	main := GamesListComponent new.
]

{ #category : #accessing }
GameStoreRoot >> main: aComponent [ 
	main := aComponent
]

{ #category : #rendering }
GameStoreRoot >> renderContentOn: html [ 
	html render: main

]

{ #category : #updating }
GameStoreRoot >> updateRoot: anHtmlRoot [ 
	super updateRoot: anHtmlRoot.
	anHtmlRoot beHtml5.
	anHtmlRoot title: 'GameStore'
]
