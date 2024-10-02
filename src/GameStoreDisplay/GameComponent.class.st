Class {
	#name : #GameComponent,
	#superclass : #WAComponent,
	#instVars : [
		'game'
	],
	#category : #GameStoreDisplay
}

{ #category : #accessing }
GameComponent >> game: aGame [ 
	game := aGame.
]

{ #category : #accessing }
GameComponent >> genre [ 
	^ game genre 
]

{ #category : #initialize }
GameComponent >> initialize [ 
	super initialize.
	game := Game new.

]

{ #category : #accessing }
GameComponent >> rating [
	^ game rating
]

{ #category : #rendering }
GameComponent >> renderContentOn: html [ 
	html heading level: 2; with: self title.
	html heading level: 3; with: 'Genre'.
	html text: self genre.         
	html heading level: 3; with: 'Rating'.
	html text: self rating .
]

{ #category : #accessing }
GameComponent >> title [
	^ game title
]
