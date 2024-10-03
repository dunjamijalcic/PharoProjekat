Class {
	#name : #GameTest,
	#superclass : #TestCase,
	#category : #GameStoreTests
}

{ #category : #tests }
GameTest >> testGameCreation [ 
    | game |
    
    game := Game title: 'Cyberpunk 2077' 
                 genre: 'RPG' 
                 platform: 'PC' 
                 price: 59.99 
                 rating: 7.5.
    
    self assert: game name equals: 'Cyberpunk 2077'.
    self assert: game category equals: 'RPG'.
    self assert: game platform equals:'PC'.
    self assert: game price equals:  59.99.
    self assert: game rating equals:7.5. 
]
