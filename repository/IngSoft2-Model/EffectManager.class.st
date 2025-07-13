Class {
	#name : #EffectManager,
	#superclass : #Object,
	#instVars : [
		'game',
		'board',
		'spaceships',
		'lastEffectApplied',
		'restrictionsBySpaceship'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
EffectManager class >> usedIn: aGame with: aBoard affecting: someShips [

	^ self new initializeIn: aGame using: aBoard affecting: someShips
]

{ #category : #playing }
EffectManager >> addRestriction: aRestriction to: aSpaceship [

	| current |
	current := self restrictionsFor: aSpaceship.
	restrictionsBySpaceship
		at: aSpaceship
		put: (current copyWith: aRestriction)
]

{ #category : #initialization }
EffectManager >> applyEffectOnLandingShip: aSpaceship [

	| effectToApply |
	effectToApply := board effectToApplyTo: aSpaceship.
	lastEffectApplied := effectToApply.
	effectToApply triggeredBy: aSpaceship on: self
]

{ #category : #playing }
EffectManager >> applyMoonwalkMoving: anAmountOfTiles notAffecting: aShip [

	| filteredShips |
	filteredShips := spaceships select: [ :spaceship |
		                 spaceship ~= aShip ].
	filteredShips do: [ :spaceship |
		board move: spaceship by: anAmountOfTiles ]
]

{ #category : #playing }
EffectManager >> escapeJailFor: aSpaceship [

	self removeRestriction: JailRestriction from: aSpaceship
]

{ #category : #playing }
EffectManager >> giveCardFromDeckTo: aSpaceship [

	game giveCardFromDeckTo: aSpaceship
]

{ #category : #playing }
EffectManager >> hyperSpaceJump: aSpaceShip by: anAmountOfTiles [

	board jumpForward: aSpaceShip by: anAmountOfTiles
]

{ #category : #initialization }
EffectManager >> initializeIn: aGame using: aBoard affecting: someShips [

	game := aGame.
	board := aBoard.
	spaceships := someShips.
	lastEffectApplied := Null create.
	restrictionsBySpaceship := Dictionary new
]

{ #category : #playing }
EffectManager >> move: aSpaceShip by: anAmountOfTiles [

	board move: aSpaceShip by: anAmountOfTiles
]

{ #category : #playing }
EffectManager >> move: aSpaceship jumping: aQuantityOfParsec [

	board move: aSpaceship jumping: aQuantityOfParsec
]

{ #category : #playing }
EffectManager >> moveAllSpaceshipsToFirstPosition [

	board moveAllSpaceshipsToFirstPosition: spaceships
]

{ #category : #playing }
EffectManager >> removeRestriction: aRestriction from: aSpaceship [

	| current updated |
	current := self restrictionsFor: aSpaceship.
	updated := current reject: [ :each | each = aRestriction ].
	restrictionsBySpaceship at: aSpaceship put: updated
]

{ #category : #playing }
EffectManager >> repeatLastEffectAppliedOn: aSpaceship [

	lastEffectApplied triggeredBy: aSpaceship on: self
]

{ #category : #playing }
EffectManager >> restrictionsFor: aSpaceship [

	^ restrictionsBySpaceship at: aSpaceship ifAbsent: [ #(  ) ]
]
