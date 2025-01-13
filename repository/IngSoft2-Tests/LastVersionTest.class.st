Class {
	#name : #LastVersionTest,
	#superclass : #GameTest,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
LastVersionTest >> testBanana [
]

{ #category : #tests }
LastVersionTest >> testLV01PlayerGetStuckOnJailTile [

	| aGame aBoard aDie1 someSpaceships |
	aDie1 := LoadedDie of: { 3. 2. 2 }.
	someSpaceships := { 'Danny' }.

	aBoard := Board
		          of: {
				          Null create.
				          Null create.
				          Null create.
				          (Jail needsToThrow: aDie1 maxRoll).
				          Null create.
				          Null create.
				          Null create }
		          withUnitsOfMeasurement: (Parsecs with: 10).


	aGame := Game
		         playedBy: someSpaceships
		         on: aBoard
		         finishingAfter: 2
		         rolling: aDie1
		         usingCardsFrom: (Deck of: { 'card1'. 'card2' }).

	self assert: (aGame spaceshipCalled: 'Danny') position equals: 1.
	aGame playNextTurn.
	self assert: (aGame spaceshipCalled: 'Danny') position equals: 4.
	aGame playNextTurn.
	self assert: (aGame spaceshipCalled: 'Danny') position equals: 4
]

{ #category : #tests }
LastVersionTest >> testLV02PlayerCanLeaveJailWhenRollingTheMaxAmount [

	| aGame aBoard aDie1 someSpaceships |
	aDie1 := LoadedDie of: { 2. 3. 5 }.
	someSpaceships := { 'Danny' }.

	aBoard := Board
		          of: {
				          Null create.
				          Null create.
				          (Jail needsToThrow: aDie1 maxRoll).
				          Null create.
				          Null create.
				          Null create.
				          Null create.
				          Null create }
		          withUnitsOfMeasurement: (Parsecs with: 10).


	aGame := Game
		         playedBy: someSpaceships
		         on: aBoard
		         finishingAfter: 2
		         rolling: aDie1
		         usingCardsFrom: (Deck of: { 'card1'. 'card2' }).


	self assert: (aGame spaceshipCalled: 'Danny') position equals: 1.
	aGame playNextTurn.
	self assert: (aGame spaceshipCalled: 'Danny') position equals: 3.
	aGame playNextTurn.
	self assert: (aGame spaceshipCalled: 'Danny') position equals: 3.
	aGame playNextTurn.
	self assert: (aGame spaceshipCalled: 'Danny') position equals: 8
]

{ #category : #tests }
LastVersionTest >> testLV03PlayerCanLeaveWhenRollingTheMaxOnADiceRoller [

	| aGame aBoard aDie1 aDie2 aDiceRoller someSpaceships |
	aDie1 := LoadedDie of: { 2. 2. 2 }.
	aDie2 := LoadedDie of: { 1. 2. 3 }.
	aDiceRoller := DiceRoller of: {
			               aDie1.
			               aDie2 }.
	someSpaceships := { 'Danny' }.

	aBoard := Board
		          of: {
				          Null create.
				          Null create.
				          Null create.
				          (Jail needsToThrow: aDiceRoller maxRoll).
				          Null create.
				          Null create.
				          Null create.
				          Null create.
				          Null create.
				          Null create.
				          Null create }
		          withUnitsOfMeasurement: (Parsecs with: 10).

	aGame := Game
		         playedBy: someSpaceships
		         on: aBoard
		         finishingAfter: 2
		         rolling: aDiceRoller
		         usingCardsFrom: (Deck of: { 'card1'. 'card2' }).

	self assert: (aGame spaceshipCalled: 'Danny') position equals: 1.
	aGame playNextTurn.
	self assert: (aGame spaceshipCalled: 'Danny') position equals: 4.
	aGame playNextTurn.
	self assert: (aGame spaceshipCalled: 'Danny') position equals: 4.
	aGame playNextTurn.
	self assert: (aGame spaceshipCalled: 'Danny') position equals: 9
]

{ #category : #tests }
LastVersionTest >> testLV04PlayerCanLeaveJailWhenUsingFreedomCard [

	| aGame aBoard aDie1 someSpaceships aFreedomCard |
	aDie1 := LoadedDie of: { 3. 2. 2. 5 }.
	someSpaceships := { 'Danny' }.

	aBoard := Board
		          of: {
				          Null create.
				          Null create.
				          Null create.
				          (Jail needsToThrow: aDie1 maxRoll).
				          Null create.
				          Null create.
				          Null create }
		          withUnitsOfMeasurement: (Parsecs with: 10).

	aFreedomCard := FreedomCard new.

	aGame := Game
		         playedBy: someSpaceships
		         on: aBoard
		         finishingAfter: 2
		         rolling: aDie1
		         usingCardsFrom: (Deck of: { aFreedomCard }).

	self assert: (aGame spaceshipCalled: 'Danny') position equals: 1.
	aGame playNextTurn.
	self assert: (aGame spaceshipCalled: 'Danny') position equals: 4.
	aGame playNextTurn.
	self assert: (aGame spaceshipCalled: 'Danny') position equals: 4.
	aGame play: aFreedomCard by: 'Danny' targetting: 'Danny'.
	aGame playNextTurn.
	self assert: (aGame spaceshipCalled: 'Danny') position equals: 6
]

{ #category : #tests }
LastVersionTest >> testLV05HyperSpaceJumpSendsTheSpaceship4TilesForward [

	| aGame aBoard aDie1 someSpaceships |
	aDie1 := LoadedDie of: { 3. 2. 2 }.
	someSpaceships := { 'Danny' }.

	aBoard := Board
		          of: {
				          Null create.
				          Null create.
				          Null create.
				          HyperSpaceJump new.
				          Null create.
				          Null create.
				          Null create.
				          Null create.
				          Null create }
		          withUnitsOfMeasurement: (Parsecs with: 10).


	aGame := Game
		         playedBy: someSpaceships
		         on: aBoard
		         finishingAfter: 2
		         rolling: aDie1
		         usingCardsFrom: (Deck of: { 'card1'. 'card2' }).

	self assert: (aGame spaceshipCalled: 'Danny') position equals: 1.
	aGame playNextTurn.
	self assert: (aGame spaceshipCalled: 'Danny') position equals: 8
]

{ #category : #tests }
LastVersionTest >> testLV06HyperSpaceJumpDoesntCostAnyExtraFuel [

	| aGame aBoard aDie1 someSpaceships |
	aDie1 := LoadedDie of: { 3. 2. 2 }.
	someSpaceships := { 'Danny' }.

	aBoard := Board
		          of: {
				          Null create.
				          Null create.
				          Null create.
				          HyperSpaceJump new.
				          Null create.
				          Null create.
				          Null create.
				          Null create.
				          Null create }
		          withUnitsOfMeasurement: (Parsecs with: 10).


	aGame := Game
		         playedBy: someSpaceships
		         on: aBoard
		         finishingAfter: 2
		         rolling: aDie1
		         usingCardsFrom: (Deck of: { 'card1'. 'card2' }).

	self assert: (aGame spaceshipCalled: 'Danny') position equals: 1.
	self
		assert: (aGame spaceshipCalled: 'Danny') fuelTank currentFuel
		equals: 6.
	aGame playNextTurn.
	self assert: (aGame spaceshipCalled: 'Danny') position equals: 8.
	self
		assert: (aGame spaceshipCalled: 'Danny') fuelTank currentFuel
		equals: 3
]

{ #category : #tests }
LastVersionTest >> testLV07SkipCardForcesCurrentShipToLoseTurn [

	| aGame aBoard aDie1 someSpaceships aSkipCard |
	aDie1 := LoadedDie of: { 3. 2. 2. 1. }.
	someSpaceships := { 'Danny'. 'Walter'. 'Joseph' }.

	aSkipCard := SkipCard new.

	aBoard := Board
		          of: {
				          Null create.
				          Null create.
				          Null create.
				          Null create.
				          Null create.
				          Null create.
				          Null create.
				          Null create.
				          Null create }
		          withUnitsOfMeasurement: (Parsecs with: 10).


	aGame := Game
		         playedBy: someSpaceships
		         on: aBoard
		         finishingAfter: 2
		         rolling: aDie1
		         usingCardsFrom: (Deck of: { aSkipCard }).

	self assert: (aGame spaceshipCalled: 'Danny') position equals: 1.
	self assert: (aGame spaceshipCalled: 'Walter') position equals: 1.
	self assert: (aGame spaceshipCalled: 'Joseph') position equals: 1.
	
	aGame playNextTurn.
	aGame play: aSkipCard by:'Danny' targetting: 'Walter'.
	aGame playNextTurn.

	self assert: (aGame spaceshipCalled: 'Danny') position equals: 4.
	self assert: (aGame spaceshipCalled: 'Walter') position equals: 1.
	self assert: (aGame spaceshipCalled: 'Joseph') position equals: 3.

	aGame playNextTurn.
	aGame playNextTurn.
	
	self assert: (aGame spaceshipCalled: 'Danny') position equals: 6.
	self assert: (aGame spaceshipCalled: 'Walter') position equals: 2.
	self assert: (aGame spaceshipCalled: 'Joseph') position equals: 3
]
