Class {
	#name : #GSAdminHeader,
	#superclass : #GSHeader,
	#category : #GameStoreDisplay
}

{ #category : #acccessing }
GSAdminHeader >> renderButtonsOn: html [ 
	html form: [ self renderDisconnectButtonOn: html ]
]

{ #category : #rendering }
GSAdminHeader >> renderDisconnectButtonOn: html [ 
	html tbsNavbarButton
		tbsPullRight;
		callback: [ component goToGamesListView ];
		with: [
			html text: 'Disconnect '.
			html tbsGlyphIcon iconLogout ]
]
