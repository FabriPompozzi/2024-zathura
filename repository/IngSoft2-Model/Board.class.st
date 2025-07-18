Class {
	#name : #Board,
	#superclass : #Object,
	#instVars : [
		'tiles',
		'laps',
		'parsecs'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #asserting }
Board class >> assertValidQuantityOf: parsecs [

	parsecs < 0 ifTrue: [
		Error signal: 'Parsecs cannot be a negative measure' ]
]

{ #category : #asserting }
Board class >> isValid: tiles [

	tiles size < 2 ifTrue: [ Error signal: 'Tiles should be 2 or more' ]
]

{ #category : #'instance creation' }
Board class >> of: tiles withUnitsOfMeasurement: units [

	self isValid: tiles.
	self assertValidQuantityOf: units valueAsParsecs.
	^ self new initializeOf: tiles withDistance: units
]

{ #category : #initialization }
Board >> amountOfTiles [

	^ tiles size
]

{ #category : #accessing }
Board >> calculateLapToMoveWhen: aSpaceship advances: anAmountOfTilesToMove [

	| tilesSinceBeginning |
	tilesSinceBeginning := aSpaceship position + anAmountOfTilesToMove
	                       + (aSpaceship lap - 1 * self amountOfTiles).
	^ tilesSinceBeginning - 1 // self amountOfTiles + 1
]

{ #category : #accessing }
Board >> calculatePositionToMoveWhen: aSpaceship moves: anAmountOfTilesToMove [

	| newPosition tilesSinceBeginning lapAfterMovement |
	lapAfterMovement := self
		                    calculateLapToMoveWhen: aSpaceship
		                    advances: anAmountOfTilesToMove.
	tilesSinceBeginning := aSpaceship position + anAmountOfTilesToMove
	                       + (aSpaceship lap - 1 * self amountOfTiles).
	newPosition := tilesSinceBeginning % self amountOfTiles.
	(lapAfterMovement < 1 or: lapAfterMovement > self laps) ifTrue: [
		^ 1 - aSpaceship position ].
	newPosition = 0 ifTrue: [ ^ self amountOfTiles - aSpaceship position ].

	^ newPosition - aSpaceship position
]

{ #category : #initialization }
Board >> effectToApplyTo: aSpaceship [

	^ tiles at: aSpaceship position
]

{ #category : #playing }
Board >> finishesAfter: amountOfLaps [

	laps := amountOfLaps
]

{ #category : #initialization }
Board >> initializeOf: aTileCollection withDistance: aUnitOfDistance [

	tiles := aTileCollection.
	parsecs := aUnitOfDistance valueAsParsecs
]

{ #category : #accessing }
Board >> jumpForward: aSpaceship by: anAmountOfTilesToMove [

	| positionToMove lapsMoved newLap |
	newLap := self
		          calculateLapToMoveWhen: aSpaceship
		          advances: anAmountOfTilesToMove.
	lapsMoved := (newLap min: laps + 1 max: 1) - aSpaceship lap.
	positionToMove := self
		                  calculatePositionToMoveWhen: aSpaceship
		                  moves: anAmountOfTilesToMove.

	aSpaceship
		hyperSpaceJumpToTile: positionToMove
		lapBy: lapsMoved
		
]

{ #category : #accessing }
Board >> laps [

	^ laps
]

{ #category : #accessing }
Board >> move: aSpaceship by: anAmountOfTilesToMove [

	| positionToMove lapsMoved costToMove newLap |
	newLap := self
		          calculateLapToMoveWhen: aSpaceship
		          advances: anAmountOfTilesToMove.
	lapsMoved := (newLap min: laps + 1 max: 1) - aSpaceship lap.
	positionToMove := self
		                  calculatePositionToMoveWhen: aSpaceship
		                  moves: anAmountOfTilesToMove.

	costToMove := (lapsMoved * self amountOfTiles + positionToMove) abs.
	aSpaceship
		movePositionBy: positionToMove
		lapBy: lapsMoved
		neededFuel: costToMove
]

{ #category : #initialization }
Board >> move: aSpaceship jumping: aQuantityOfParsec [

	| tilesToMove |
	tilesToMove := (aQuantityOfParsec // (parsecs / self amountOfTiles))
		               truncated.

	self move: aSpaceship by: tilesToMove
]

{ #category : #initialization }
Board >> moveAllSpaceshipsToFirstPosition: allSpaceShips [

	allSpaceShips do: [ :spaceship |
		spaceship
			movePositionBy: 1 - spaceship position
			lapBy: 0
			neededFuel: 0 ]
]
