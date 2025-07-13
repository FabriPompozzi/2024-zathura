Class {
	#name : #SpaceShipTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
SpaceShipTest >> should: anErrorBlock raise: anErrorClass withMessage: anErrorMessage [

	self
		should: anErrorBlock
		raise: anErrorClass
		withExceptionDo: [ :error |
		self assert: error messageText equals: anErrorMessage ]
]

{ #category : #running }
SpaceShipTest >> testASpaceshipCanBeCreatedWithAName [

	| aSpaceShip |
	aSpaceShip := SpaceShip named: 'Danny' withMaxFuel: 10.
	self assert: aSpaceShip name equals: 'Danny'
]

{ #category : #running }
SpaceShipTest >> testASpaceshipCanBeCreatedWithFuel [

	| aSpaceShip |
	aSpaceShip := SpaceShip named: 'Danny' withMaxFuel: 10.
	self assert: aSpaceShip fuelTank currentFuel equals: 10
]

{ #category : #running }
SpaceShipTest >> testASpaceshipCanMoveBackwards [

	| aSpaceShip |
	aSpaceShip := SpaceShip named: 'Danny' withMaxFuel: 10.
	aSpaceShip movePositionBy: 5 lapBy: 0 neededFuel: 0.
	aSpaceShip movePositionBy: -2 lapBy: 0 neededFuel: 0.

	self assert: aSpaceShip position equals: 4
]

{ #category : #running }
SpaceShipTest >> testASpaceshipCannotBeCreatedWithoutAName [

	| aName |
	aName := ''.
	self
		should: [ SpaceShip named: aName withMaxFuel: 10 ]
		raise: Error
		withMessage: 'Ship cant be created without a name'
]

{ #category : #running }
SpaceShipTest >> testASpaceshipCorrectlyChangesStatesAfterGainingTurns [

	| aSpaceShip |
	aSpaceShip := SpaceShip named: 'Danny' withMaxFuel: 10.
	self assert: (aSpaceShip currentTurnState isKindOf: NormalTurnState).
	aSpaceShip addExtraTurns: 2.
	self assert: (aSpaceShip currentTurnState isKindOf: ExtraTurnState)

]

{ #category : #running }
SpaceShipTest >> testASpaceshipCorrectlyChangesStatesAfterGainingTurnsAfterBeingInSkipTurnState [

	| aSpaceShip |
	aSpaceShip := SpaceShip named: 'Danny' withMaxFuel: 10.
	self assert: (aSpaceShip currentTurnState isKindOf: NormalTurnState).
	aSpaceShip loseTurns:1.
	self assert: (aSpaceShip currentTurnState isKindOf: SkipTurnState).
	aSpaceShip addExtraTurns: 2.
	self assert: (aSpaceShip currentTurnState isKindOf: ExtraTurnState)

]

{ #category : #running }
SpaceShipTest >> testASpaceshipCorrectlyChangesStatesAfterLosingTurns [

	| aSpaceShip |
	aSpaceShip := SpaceShip named: 'Danny' withMaxFuel: 10.
	self assert: (aSpaceShip currentTurnState isKindOf: NormalTurnState).
	aSpaceShip loseTurns: 2.
	self assert: (aSpaceShip currentTurnState isKindOf: SkipTurnState)

]

{ #category : #running }
SpaceShipTest >> testASpaceshipIsMovedOnePosition [

	| aSpaceShip |
	aSpaceShip := SpaceShip named: 'Danny' withMaxFuel: 10.
	aSpaceShip movePositionBy: 1 lapBy: 0 neededFuel: 1.
	self assert: aSpaceShip position equals: 2
]

{ #category : #running }
SpaceShipTest >> testExtraTurnsCanBeStacked [

	| aSpaceShip |
	aSpaceShip := SpaceShip named: 'Danny' withMaxFuel: 10.
	self assert: (aSpaceShip currentTurnState isKindOf: NormalTurnState).
	aSpaceShip addExtraTurns: 2.
	self assert: aSpaceShip currentTurnState turnsLeft equals: 2.
	aSpaceShip addExtraTurns: 2.
	self assert: aSpaceShip currentTurnState turnsLeft equals: 4
]

{ #category : #running }
SpaceShipTest >> testLostTurnsCanBeStacked [

	| aSpaceShip |
	aSpaceShip := SpaceShip named: 'Danny' withMaxFuel: 10.
	self assert: (aSpaceShip currentTurnState isKindOf: NormalTurnState).
	aSpaceShip loseTurns: 2.
	self assert: aSpaceShip currentTurnState turnsLeft equals: 2.
	aSpaceShip loseTurns: 2.
	self assert: aSpaceShip currentTurnState turnsLeft equals: 4
]
