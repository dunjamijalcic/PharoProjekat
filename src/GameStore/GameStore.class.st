Class {
	#name : #GameStore,
	#superclass : #Object,
	#instVars : [
		'games'
	],
	#category : #GameStore
}

{ #category : #acccessing }
GameStore class >> createDemoGames [
	self current 
	addGame: (Game title: 'The Legend of Zelda'
                  genre: 'Action-Adventure'
					   platform: 'Nintendo Switch'
                  price: '59.99'
                  rating: '4.9');
	addGame: (Game title: 'Minecraft'
                  genre: 'Sandbox'
					   platform:'PC'
                  price: '29.99'
                  rating: '4.8');
	addGame: (Game title: 'Fortnite'
                  genre: 'Battle Royale'
						platform:'PlayStation'
                  price: '0.0'
                  rating: '4.5')
]

{ #category : #acccessing }
GameStore class >> current [
	^ self selectAll
	ifNotEmpty: [ :x | x anyOne ]
	ifEmpty: [ self new save ]
]

{ #category : #'class initialization' }
GameStore class >> initialize [ 
	self reset
]

{ #category : #initialization }
GameStore class >> initializeVoyageOnMemoryDB [ 
	VOMemoryRepository new enableSingleton
]

{ #category : #testing }
GameStore class >> isVoyageRoot [ 
	^ true
]

{ #category : #initialization }
GameStore class >> reset [ 
	self initializeVoyageOnMemoryDB
]

{ #category : #adding }
GameStore >> addGame: aGame [
   games add: aGame.
	aGame save.
	self save.
]

{ #category : #acccessing }
GameStore >> allGames [ 
	^ games
]

{ #category : #private }
GameStore >> allGenres [
	^ (self allGames collect: [ :r | r genre ]) asSet
]

{ #category : #acccessing }
GameStore >> gameCount [
    ^ games size
]

{ #category : #acccessing }
GameStore >> gamesByGenre: aGenre [ 
    ^ games select: [ :game | game genre = aGenre ]
]

{ #category : #testing }
GameStore >> hasGame: aGame [
    ^ games includes: aGame
]

{ #category : #initialization }
GameStore >> initialize [ 
	super initialize. 
   games := OrderedCollection new
]

{ #category : #removing }
GameStore >> removeAllGames [ 
	games do: [ :each | each remove ].
	games := OrderedCollection new.
	self save. 
]

{ #category : #removing }
GameStore >> removeGame: aGame [ 
   games remove: aGame ifAbsent: [ ].
	self save.
]

{ #category : #acccessing }
GameStore >> searchByPlatform: aPlatform [ 
        ^ games select: [:game | game platform = aPlatform].
]

{ #category : #acccessing }
GameStore >> searchByTitle: aTitle [ 
        ^ games select: [:game | game title = aTitle].
]

{ #category : #acccessing }
GameStore >> searchGamesWithRating: aRating [
    ^ games select: [:game | game rating = aRating].
]
