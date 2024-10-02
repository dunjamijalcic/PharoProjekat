Class {
	#name : #GWGenreReport,
	#superclass : #TBSMagritteReport,
	#instVars : [
		'store'
	],
	#category : #GameStoreDisplay
}

{ #category : #'instance creation' }
GWGenreReport class >> from: aStore genre: aGenre [ 
    | report games |
    games := aStore searchGamesWithGenre: aGenre.
    report := self rows: games description: games anyOne magritteDescription.
    report store: aStore.
    ^ report
]

{ #category : #accessing }
GWGenreReport >> store [ 
	^ store
]

{ #category : #accessing }
GWGenreReport >> store: aStore [ 
	store := aStore
]
