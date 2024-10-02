Class {
	#name : #GSHComponent,
	#superclass : #GSHeader,
	#category : #GameStoreDisplay
}

{ #category : #rendering }
GSHComponent >> renderBackButtonOn: html [ 
	html tbsNavbarButton
		tbsPullRight;
		callback: [ component goToGameListView ];
		with: [
			html text: 'Go back '.
			html tbsGlyphIcon iconLogout ].
]

{ #category : #acccessing }
GSHComponent >> renderButtonsOn: html [ 
	html form: [ self renderBackButtonOn: html ].
]
