Class {
	#name : #GSAdmin,
	#superclass : #GSScreen,
	#instVars : [
		'gameReport'
	],
	#category : #GameStoreDisplay
}

{ #category : #hooks }
GSAdmin >> children [ 
    ^ super children copyWith: self gameReport
]

{ #category : #acccessing }
GSAdmin >> createHeaderComponent [ 
    ^ GSAdminHeader from: self
]

{ #category : #accessing }
GSAdmin >> gameReport [ 
	^ gameReport
]

{ #category : #accessing }
GSAdmin >> gameReport: aReport [ 
	gameReport := aReport
]

{ #category : #acccessing }
GSAdmin >> goToGameListView [ 
    self answer.
]

{ #category : #acccessing }
GSAdmin >> initialize [
	super initialize.
	self gameReport: (GameReport from: self game)
]

{ #category : #rendering }
GSAdmin >> renderContentOn: html [
    super renderContentOn: html.
    html tbsContainer: [
        html heading: 'GameStore Admin'.
        html horizontalRule.
        html render: self gameReport.
    ]
]
