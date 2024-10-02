Class {
	#name : #StoreTest,
	#superclass : #TestCase,
	#instVars : [
		'store',
		'game',
		'first',
		'previousRepository'
	],
	#category : #GameStoreTests
}

{ #category : #running }
StoreTest >> setUp [ 
	previousRepository := VORepository current.
	VORepository setRepository: VOMemoryRepository new.

	store := GameStore current.
	store removeAllGames.
	
	first := Game title: 'The Legend of Zelda'
                 genre: 'Action-Adventure'
                 platform: 'Nintendo Switch'
                 price: '59.99'
					  rating:'4.9'.
	
	store addGame: first.
	
	game := Game title: 'Minecraft'
                genre: 'Sandbox'
                platform: 'PC'
                price: '29.99'
					 rating:'4.8'.
	
	store addGame: game.
]

{ #category : #running }
StoreTest >> tearDown [ 
	VORepository setRepository: previousRepository
]

{ #category : #tests }
StoreTest >> testAddGame [
	store addGame: game. 
	self assert: store gameCount equals: 3.
]

{ #category : #tests }
StoreTest >> testGameCount [ 
	self assert: store gameCount equals: 2.
]

{ #category : #tests }
StoreTest >> testRemoveAllGames [
	store removeAllGames.
	self assert: store gameCount equals: 0.
]

{ #category : #tests }
StoreTest >> testRemoveGame [
	store addGame: game.

   self assert: store gameCount equals: 3.
    
	store removeGame: game.
	
	self assert: store gameCount equals: 2.
]
