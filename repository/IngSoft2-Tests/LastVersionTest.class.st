Class {
	#name : #LastVersionTest,
	#superclass : #GameTest,
	#category : #'IngSoft2-Tests'
}

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
				          Jail new.
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
				          Jail new.
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
				          Jail new.
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
				          Jail new.
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
	aDie1 := LoadedDie of: { 3. 2. 2. 4 }.
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
		equals: 8.
	aGame playNextTurn.
	self assert: (aGame spaceshipCalled: 'Danny') position equals: 8.
	self
		assert: (aGame spaceshipCalled: 'Danny') fuelTank currentFuel
		equals: 5
]

{ #category : #tests }
LastVersionTest >> testLV07SkipCardForcesCurrentShipToLoseTurn [

	| aGame aBoard aDie1 someSpaceships aSkipCard |
	aDie1 := LoadedDie of: { 3. 2. 2. 1 }.
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
	aGame play: aSkipCard by: 'Danny' targetting: 'Walter'.
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

{ #category : #tests }
LastVersionTest >> testLV08SkipCardCanBeUsedTwiceWithRedoCard [

	| aGame aBoard aDie1 someSpaceships aSkipCard aRedoCard aDeck |
	aDie1 := LoadedDie of: { 3. 3. 2. 1 }.
	someSpaceships := { 'Danny'. 'Walter'. 'Joseph' }.

	aSkipCard := SkipCard new.
	aRedoCard := RedoCard new.

	aDeck := LoadedDeck of: {
			         aSkipCard.
			         aRedoCard.
			         aSkipCard.
			         aRedoCard.
			         aRedoCard.
			         aSkipCard }.

	aBoard := Board
		          of: {
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
		         usingCardsFrom: aDeck.

	self assert: (aGame spaceshipCalled: 'Danny') position equals: 1.
	self assert: (aGame spaceshipCalled: 'Walter') position equals: 1.
	self assert: (aGame spaceshipCalled: 'Joseph') position equals: 1.

	aGame playNextTurn.
	aGame play: aSkipCard by: 'Danny' targetting: 'Walter'.
	aGame playNextTurn.

	self assert: (aGame spaceshipCalled: 'Danny') position equals: 4.
	self assert: (aGame spaceshipCalled: 'Walter') position equals: 1.
	self assert: (aGame spaceshipCalled: 'Joseph') position equals: 4.

	aGame play: aRedoCard by: 'Joseph' targetting: 'Danny'.
	aGame playNextTurn.
	aGame playNextTurn.

	self assert: (aGame spaceshipCalled: 'Danny') position equals: 4.
	self assert: (aGame spaceshipCalled: 'Walter') position equals: 3.
	self assert: (aGame spaceshipCalled: 'Joseph') position equals: 5
]

{ #category : #tests }
LastVersionTest >> testLV09DoubleCardGivesCurrentSpaceshipAnExtraTurn [

	| aGame aBoard aDie1 someSpaceships aDoubleCard |
	aDie1 := LoadedDie of: { 3. 2. 2. 1 }.
	someSpaceships := { 'Danny'. 'Walter'. 'Joseph' }.

	aDoubleCard := DoubleCard new.

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
		         usingCardsFrom: (Deck of: { aDoubleCard }).

	self assert: (aGame spaceshipCalled: 'Danny') position equals: 1.
	self assert: (aGame spaceshipCalled: 'Walter') position equals: 1.
	self assert: (aGame spaceshipCalled: 'Joseph') position equals: 1.

	aGame playNextTurn.
	aGame play: aDoubleCard by: 'Walter' targetting: 'Walter'.
	aGame playNextTurn.
	aGame playNextTurn.
	aGame playNextTurn.

	self assert: (aGame spaceshipCalled: 'Danny') position equals: 4.
	self assert: (aGame spaceshipCalled: 'Walter') position equals: 5.
	self assert: (aGame spaceshipCalled: 'Joseph') position equals: 2
]

{ #category : #tests }
LastVersionTest >> testLV10DoubleCardCanBeUsedTwiceWithRedoCard [

	| aGame aBoard aDie1 someSpaceships aDoubleCard aRedoCard aDeck |
	aDie1 := LoadedDie of: { 3. 3. 2. 1. 3. 5 }.
	someSpaceships := { 'Danny'. 'Walter'. 'Joseph' }.

	aDoubleCard := DoubleCard new.
	aRedoCard := RedoCard new.

	aDeck := LoadedDeck of: {
			         aDoubleCard.
			         aRedoCard.
			         aDoubleCard.
			         aRedoCard.
			         aRedoCard.
			         aDoubleCard }.

	aBoard := Board
		          of: {
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
		         usingCardsFrom: aDeck.

	self assert: (aGame spaceshipCalled: 'Danny') position equals: 1.
	self assert: (aGame spaceshipCalled: 'Walter') position equals: 1.
	self assert: (aGame spaceshipCalled: 'Joseph') position equals: 1.

	aGame playNextTurn.
	aGame play: aDoubleCard by: 'Walter' targetting: 'Walter'.
	aGame playNextTurn.
	aGame playNextTurn.

	self assert: (aGame spaceshipCalled: 'Danny') position equals: 4.
	self assert: (aGame spaceshipCalled: 'Walter') position equals: 6.
	self assert: (aGame spaceshipCalled: 'Joseph') position equals: 1.

	aGame play: aRedoCard by: 'Joseph' targetting: 'Joseph'.
	aGame playNextTurn.
	aGame playNextTurn.

	self assert: (aGame spaceshipCalled: 'Danny') position equals: 4.
	self assert: (aGame spaceshipCalled: 'Walter') position equals: 6.
	self assert: (aGame spaceshipCalled: 'Joseph') position equals: 5
]

{ #category : #tests }
LastVersionTest >> testLV11ReverseCardReversesTurns [

	| aGame aBoard aDie1 someSpaceships aReverseCard |
	aDie1 := LoadedDie of: { 3. 2. 2. 1 }.
	someSpaceships := { 'Danny'. 'Walter'. 'Joseph' }.

	aReverseCard := ReverseCard new.

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
		         usingCardsFrom: (Deck of: { aReverseCard }).

	self assert: (aGame spaceshipCalled: 'Danny') position equals: 1.
	self assert: (aGame spaceshipCalled: 'Walter') position equals: 1.
	self assert: (aGame spaceshipCalled: 'Joseph') position equals: 1.

	aGame playNextTurn.
	aGame play: aReverseCard by: 'Danny' targetting: 'All'.

	self assert: aGame turnHandler spaceships first name equals: 'Danny'.
	self
		assert: aGame turnHandler spaceships second name
		equals: 'Joseph'.
	self assert: aGame turnHandler spaceships third name equals: 'Walter'.

	aGame playNextTurn.
	aGame playNextTurn.
	aGame playNextTurn.

	self assert: (aGame spaceshipCalled: 'Danny') position equals: 6.
	self assert: (aGame spaceshipCalled: 'Walter') position equals: 2.
	self assert: (aGame spaceshipCalled: 'Joseph') position equals: 3
]

{ #category : #tests }
LastVersionTest >> testLV12ReverseCardCanBeUsedTwiceWithRedoCard [

	| aGame aBoard aDie1 someSpaceships aReverseCard aRedoCard aDeck |
	aDie1 := LoadedDie of: { 3. 2. 2. 1 }.
	someSpaceships := { 'Danny'. 'Walter'. 'Joseph' }.

	aReverseCard := ReverseCard new.
	aRedoCard := RedoCard new.
	aDeck := LoadedDeck of: {
			         aReverseCard.
			         aRedoCard.
			         aReverseCard.
			         aRedoCard.
			         aReverseCard.
			         aRedoCard }.

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
		         usingCardsFrom: aDeck.

	self assert: (aGame spaceshipCalled: 'Danny') position equals: 1.
	self assert: (aGame spaceshipCalled: 'Walter') position equals: 1.
	self assert: (aGame spaceshipCalled: 'Joseph') position equals: 1.

	aGame playNextTurn.
	aGame play: aReverseCard by: 'Danny' targetting: 'All'.

	self assert: aGame turnHandler spaceships first name equals: 'Danny'.
	self
		assert: aGame turnHandler spaceships second name
		equals: 'Joseph'.
	self assert: aGame turnHandler spaceships third name equals: 'Walter'.

	aGame playNextTurn.
	aGame playNextTurn.
	aGame play: aRedoCard by: 'Joseph' targetting: 'all'.
	aGame playNextTurn.

	self assert: aGame turnHandler spaceships first name equals: 'Danny'.
	self
		assert: aGame turnHandler spaceships second name
		equals: 'Walter'.
	self assert: aGame turnHandler spaceships third name equals: 'Joseph'.

	self assert: (aGame spaceshipCalled: 'Danny') position equals: 6.
	self assert: (aGame spaceshipCalled: 'Walter') position equals: 1.
	self assert: (aGame spaceshipCalled: 'Joseph') position equals: 4
]

{ #category : #tests }
LastVersionTest >> testLV13SkipCardCanBeStackedWithItself [

	| aGame aBoard aDie1 someSpaceships aSkipCard aRedoCard aDeck |
	aDie1 := LoadedDie of: { 3. 3. 2. 1. 2. 5 }.
	someSpaceships := { 'Danny'. 'Walter'. 'Joseph' }.

	aSkipCard := SkipCard new.
	aRedoCard := RedoCard new.

	aDeck := LoadedDeck of: {
			         aSkipCard.
			         aRedoCard.
			         aSkipCard.
			         aRedoCard.
			         aRedoCard.
			         aSkipCard }.

	aBoard := Board
		          of: {
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
		         usingCardsFrom: aDeck.

	self assert: (aGame spaceshipCalled: 'Danny') position equals: 1.
	self assert: (aGame spaceshipCalled: 'Walter') position equals: 1.
	self assert: (aGame spaceshipCalled: 'Joseph') position equals: 1.

	aGame playNextTurn.
	aGame play: aSkipCard by: 'Danny' targetting: 'Walter'.
	aGame play: aRedoCard by: 'Danny' targetting: 'Walter'.
	aGame playNextTurn.
	aGame playNextTurn.

	self assert: (aGame spaceshipCalled: 'Danny') position equals: 6.
	self assert: (aGame spaceshipCalled: 'Walter') position equals: 1.
	self assert: (aGame spaceshipCalled: 'Joseph') position equals: 4.

	aGame playNextTurn.
	aGame playNextTurn.

	self assert: (aGame spaceshipCalled: 'Danny') position equals: 8.
	self assert: (aGame spaceshipCalled: 'Walter') position equals: 1.
	self assert: (aGame spaceshipCalled: 'Joseph') position equals: 5
]

{ #category : #tests }
LastVersionTest >> testLV14DoubleCardCanBeStackedWithItself [

	| aGame aBoard aDie1 someSpaceships aDoubleCard aRedoCard aDeck |
	aDie1 := LoadedDie of: { 3. 3. 2. 1. 3. 2. 5 }.
	someSpaceships := { 'Danny'. 'Walter'. 'Joseph' }.

	aDoubleCard := DoubleCard new.
	aRedoCard := RedoCard new.

	aDeck := LoadedDeck of: {
			         aDoubleCard.
			         aRedoCard.
			         aDoubleCard.
			         aRedoCard.
			         aRedoCard.
			         aDoubleCard }.

	aBoard := Board
		          of: {
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
		         usingCardsFrom: aDeck.

	self assert: (aGame spaceshipCalled: 'Danny') position equals: 1.
	self assert: (aGame spaceshipCalled: 'Walter') position equals: 1.
	self assert: (aGame spaceshipCalled: 'Joseph') position equals: 1.

	aGame playNextTurn.
	aGame play: aDoubleCard by: 'Walter' targetting: 'Walter'.
	aGame play: aRedoCard by: 'Walter' targetting: 'Walter'.
	aGame playNextTurn.
	aGame playNextTurn.
	aGame playNextTurn.

	self assert: (aGame spaceshipCalled: 'Danny') position equals: 4.
	self assert: (aGame spaceshipCalled: 'Walter') position equals: 7.
	self assert: (aGame spaceshipCalled: 'Joseph') position equals: 1.

	aGame playNextTurn.
	aGame playNextTurn.

	self assert: (aGame spaceshipCalled: 'Danny') position equals: 6.
	self assert: (aGame spaceshipCalled: 'Walter') position equals: 7.
	self assert: (aGame spaceshipCalled: 'Joseph') position equals: 4
]

{ #category : #tests }
LastVersionTest >> testLV15RandomBoardDistributionWithNewTilesAndRandomDice [

	| aGame aBoard aDie1 unitsToMove someSpaceships effectDistribution randomCollection aDie2 aDiceRoller |
	aDie1 := Die of: 6.
	aDie2 := Die of: 3.
	unitsToMove := OrderedCollection
		               with: (LightYear with: 9)
		               with: (Parsecs with: 4).

	aDiceRoller := DiceRoller of: {
			               aDie1.
			               aDie2 }.
	effectDistribution := EffectDistribution with: {
			                      (ProbabilityEffectTile
				                       with: Null new
				                       and: 0.20).
			                      (ProbabilityEffectTile
				                       with: CardGiver new
				                       and: 0.10).
			                      (ProbabilityEffectTile
				                       with: BlackHole new
				                       and: 0.20).
			                      (ProbabilityEffectTile
				                       with: (HyperGravity needsToThrow: 3)
				                       and: 0.20).
			                      (ProbabilityEffectTile
				                       with: (MoonWalk backwardDistance: 3)
				                       and: 0.10).
			                      (ProbabilityEffectTile
				                       with: (HyperJump of: unitsToMove)
				                       and: 0.08).
			                      (ProbabilityEffectTile
				                       with: AtomicBomb new
				                       and: 0.02).
			                      (ProbabilityEffectTile
				                       with:
				                       Jail new
				                       and: 0.05).
			                      (ProbabilityEffectTile
				                       with: HyperSpaceJump new
				                       and: 0.05) }.


	randomCollection := effectDistribution randomCollectionWith: 5.

	aBoard := Board
		          of: randomCollection
		          withUnitsOfMeasurement: (Parsecs with: 10).

	someSpaceships := { 'Danny'. 'Walter' }.

	aGame := Game
		         playedBy: someSpaceships
		         on: aBoard
		         finishingAfter: 2
		         rolling: aDiceRoller
		         usingCardsFrom: (Deck of: { 'card1'. 'card2' }).

	self playUntilFinished: aGame.

	self assert: aGame hasEnded
]
