Class {
	#name : #GameReport,
	#superclass : #TBSMagritteReport,
	#instVars : [
		'store'
	],
	#category : #GameStoreDisplay
}

{ #category : #'instance creation' }
GameReport class >> from: aStore [ 
	| report storeGames |
	storeGames := aStore allGames.
	report := self rows: storeGames description: storeGames anyOne magritteDescription.
	report store: aStore.
	report addColumn: (MACommandColumn new 
				addCommandOn: report selector: #editGame: text: 'Edit';
				yourself;
				addCommandOn: report selector: #deleteGame: text: 'Delete';
				yourself). 
	^ report
]

{ #category : #adding }
GameReport >> addGame [ 
	| game |
	game := self call: (self renderAddGameForm: Game new).
	game ifNotNil: [ store addGame: game.
		self refreshReport ].
]

{ #category : #acccessing }
GameReport >> deleteGame: aGame [ 
	(self confirm: 'Do you want to remove this game?')
	ifTrue: [ store removeGame: aGame.
		self refreshReport ]
]

{ #category : #acccessing }
GameReport >> editGame: aGame [ 
	| game |
	game := self call: (self renderEditGameForm: aGame).
	game ifNotNil: [ store save ].
]

{ #category : #acccessing }
GameReport >> refreshReport [ 
	self rows: store allGames.
	self refresh.
]

{ #category : #rendering }
GameReport >> renderAddGameForm: aGame [
	^ aGame asComponent
		addDecoration: (TBSMagritteFormDecoration buttons: { #save -> 'Add game'. #cancel -> 'Cancel' });
		yourself.
]

{ #category : #rendering }
GameReport >> renderContentOn: html [ 
	html tbsGlyphIcon iconPencil.
	html anchor
		callback: [ self addGame ];
		with: 'Add game'.
	super renderContentOn: html.
]

{ #category : #rendering }
GameReport >> renderEditGameForm: aGame [ 
	^ aGame asComponent
		addDecoration: (TBSMagritteFormDecoration buttons: { #save -> 'Save game'. #cancel -> 'Cancel' });
		yourself.
]

{ #category : #accessing }
GameReport >> store [ 
	^ store
]

{ #category : #accessing }
GameReport >> store: aStore [ 
	store := aStore.
]
