Class {
	#name : #GWGenreComponent,
	#superclass : #GSScreen,
	#instVars : [
		'games',
		'genreInput',
		'report'
	],
	#category : #GameStoreDisplay
}

{ #category : #hooks }
GWGenreComponent >> children [ 
	^ super children copyWith: self report
]

{ #category : #acccessing }
GWGenreComponent >> createHeaderComponent [ 
	^ GSHeader from: self
]

{ #category : #accessing }
GWGenreComponent >> genreInput [ 
	^ genreInput
]

{ #category : #accessing }
GWGenreComponent >> genreInput: anInput [ 
	genreInput := anInput
]

{ #category : #acccessing }
GWGenreComponent >> goToGamesListView [ 
	self answer
]

{ #category : #initialization }
GWGenreComponent >> initialize [ 
	super initialize.
]

{ #category : #rendering }
GWGenreComponent >> renderContentOn: html [ 
	super renderContentOn: html.
	html tbsContainer: [
		html heading: 'Games with Genre'.
		html horizontalRule.
		html form: [
			html paragraph: [  
				html text: 'Genre: '.
				genreInput := html textInput
					id: 'genreInput';
					yourself.
				html submitButton
					callback: [ self report: (GWGenreReport from: self game genre: genreInput value) ];
					with: 'Search'.
			]
		].
		html render: self report
	]
]

{ #category : #accessing }
GWGenreComponent >> report [ 
	^ report 
]

{ #category : #accessing }
GWGenreComponent >> report: aReport [ 
	report := aReport 
]
