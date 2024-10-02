Class {
	#name : #GSScreen,
	#superclass : #WAComponent,
	#instVars : [
		'header'
	],
	#category : #GameStoreDisplay
}

{ #category : #hooks }
GSScreen >> children [ 
	^ { header }
]

{ #category : #acccessing }
GSScreen >> createHeader [
	^ GSHeader from: self
]

{ #category : #acccessing }
GSScreen >> initialize [ 
	super initialize.
	header := self createHeader
]

{ #category : #rendering }
GSScreen >> renderContentOn: html [ 
	html render: header
]

{ #category : #acccessing }
GSScreen >> store [ 
	^ GameStore current
]
