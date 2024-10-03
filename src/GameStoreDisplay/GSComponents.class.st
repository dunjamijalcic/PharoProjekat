Class {
	#name : #GSComponents,
	#superclass : #WAComponent,
	#instVars : [
		'games',
		'categories'
	],
	#category : #GameStoreDisplay
}

{ #category : #acccessing }
GSComponents class >> categories: categories games: aScreen [ 
	^ self new categories: categories; games: aScreen
]

{ #category : #accessing }
GSComponents >> categories [ 
	^ categories
]

{ #category : #accessing }
GSComponents >> categories: aCollection [ 
	categories := aCollection asSortedCollection
]

{ #category : #accessing }
GSComponents >> games [ 
	^ games
]

{ #category : #accessing }
GSComponents >> games: aComponent [ 
	games := aComponent
]

{ #category : #rendering }
GSComponents >> renderCategoryLinkOn: html with: aCategory [ 
	html tbsLinkifyListGroupItem
		class: 'active' if: aCategory = self games current;
		callback: [ self selectCategory: aCategory ];
		with: aCategory
]

{ #category : #rendering }
GSComponents >> renderContentOn: html [ 
	html div
		class: 'list-group list-group-horizontal';
		with: [
			html div
				class: 'list-group-item';
				with: [ html strong: 'All categories' ].
			categories do: [ :category |
				html div
					class: 'list-group-item list-group-item-custom';
					with: [ self renderCategoryLinkOn: html with: category ]
			]
		]
]

{ #category : #acccessing }
GSComponents >> selectCategory: aCategory [ 
	games current: aCategory

]

{ #category : #hooks }
GSComponents >> style [ 
    ^ '
    .list-group-horizontal {
        display: flex;
        flex-wrap: wrap;
        justify-content: flex-start;
    }
    .list-group-horizontal .list-group-item {
        margin-right: 10px;
    }
	 .list-group-item-custom {
    	  background-color: #f8f9fa;
   	 	  color: #333;
  	     border: none;
	 }
    ' 
]
