Class {
	#name : #Game,
	#superclass : #Object,
	#instVars : [
		'title',
		'genre',
		'platform',
		'price',
		'rating'
	],
	#category : #GameStore
}

{ #category : #accessing }
Game class >> title: aTitle genre: aGenre platform: aPlatform price: aPrice rating: aRating [ 
   | game |
   game := self new.
   game title: aTitle.
   game genre: aGenre.
   game platform: aPlatform.
   game price: aPrice.
   game rating: aRating.
    ^ game 
]

{ #category : #accessing }
Game >> Genre [
   ^ genre
]

{ #category : #accessing }
Game >> Platform [
	^ platform 
]

{ #category : #accessing }
Game >> Price [
	^ price
]

{ #category : #accessing }
Game >> Rating [
	^ rating
]

{ #category : #accessing }
Game >> Title [
	^ title
]

{ #category : #acccessing }
Game >> descriptionGenre [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Genre';
		priority: 300;
		accessor: #genre;
		beRequired;
		yourself









]

{ #category : #acccessing }
Game >> descriptionPlatform [ 
	<magritteDescription>
	^ MAStringDescription new
		label: 'Platform';
		priority: 200;
		accessor: #platform;
		beRequired;
		yourself

]

{ #category : #acccessing }
Game >> descriptionPrice [ 
	<magritteDescription>
	^ MANumberDescription new
		label: 'Price';
		priority: 200;
		accessor: #price;
		beRequired;
		yourself

]

{ #category : #acccessing }
Game >> descriptionRating [
	<magritteDescription>
	^ MANumberDescription new
		label: 'Rating';
		priority: 100;
		accessor: #rating;
		beRequired;
		yourself

]

{ #category : #'acessing-magritte' }
Game >> descriptionTitle [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Title';
		priority: 100;
		accessor: #title;
		beRequired;
		yourself
]

{ #category : #accessing }
Game >> genre: aGenre [
        genre := aGenre.
]

{ #category : #initialization }
Game >> initialize [
    super initialize.
]

{ #category : #accessing }
Game >> platform: aPlatform [ 
        platform := aPlatform.
]

{ #category : #accessing }
Game >> price: aPrice [
        price := aPrice.
]

{ #category : #accessing }
Game >> rating: aRating [
        rating := aRating.
]

{ #category : #accessing }
Game >> title: aTitle [
        title := aTitle.
]
