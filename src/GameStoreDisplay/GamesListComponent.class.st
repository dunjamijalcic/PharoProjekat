Class {
	#name : #GamesListComponent,
	#superclass : #GSScreen,
	#instVars : [
		'gameComponents',
		'currentGenre'
	],
	#category : #GameStoreDisplay
}

{ #category : #hooks }
GamesListComponent >> children [ 
	^ self gameComponents, super children
]

{ #category : #accessing }
GamesListComponent >> currentGenre [ 
	^ currentGenre
]

{ #category : #accessing }
GamesListComponent >> currentGenre: aGenre [ 
	currentGenre := aGenre
]

{ #category : #acccessing }
GamesListComponent >> gameComponentFor: aGame [ 
	^ GameComponent new game: aGame
]

{ #category : #acccessing }
GamesListComponent >> gameComponents [
	gameComponents := self readSelectedGames 
	collect: [ :each | GameComponent new game: each ]. 
	^ gameComponents 
]

{ #category : #acccessing }
GamesListComponent >> genresComponent [ 
	^ GSComponents
		categories: self store allGenres
		games: self
]

{ #category : #acccessing }
GamesListComponent >> goToAdministrationView [ 
	self call: GSAdmin new
]

{ #category : #acccessing }
GamesListComponent >> goToSearchView [ 
	self call: GWGenreComponent new
]

{ #category : #acccessing }
GamesListComponent >> initialize [ 
	super initialize.
	gameComponents := OrderedCollection new
]

{ #category : #acccessing }
GamesListComponent >> readSelectedGames [ 
	^ self currentGenre
		ifNil: [ self store allGames ]
		ifNotNil: [ self store gamesByGenre: self currentGenre ]
]

{ #category : #rendering }
GamesListComponent >> renderContentOn: html [ 
	super renderContentOn: html.
	html tbsContainer: [
		html tbsRow showGrid;
		with: [
			html tbsColumn
				extraSmallSize: 12;
				smallSize: 2;
				mediumSize: 4;
				with: [ html render: self genresComponent ].
	
			html tbsColumn
				extraSmallSize: 12;
				smallSize: 10;
				mediumSize: 8;
				with: [
					self readSelectedGames do: [ :g |
						html render: (self gameComponentFor: g) ]
				]
		]
	]
]
