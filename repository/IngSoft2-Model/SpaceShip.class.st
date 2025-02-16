Class {
	#name : #SpaceShip,
	#superclass : #Object,
	#instVars : [
		'name',
		'position',
		'lap',
		'ally',
		'fuelTank',
		'modifiedTurns',
		'needsToThrowToEscapeJail',
		'needsToThrowToEscapeHyperGravity'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #asserting }
SpaceShip class >> assertValidNameFor: aName [

	aName isEmpty ifTrue: [
		Error signal: 'Ship cant be created without a name' ]
]

{ #category : #'instance creation' }
SpaceShip class >> named: aName withMaxFuel: anAmount [

	self assertValidNameFor: aName.
	^ self new initialize: aName withMaxFuel: anAmount
]

{ #category : #accessing }
SpaceShip >> ally [

	^ ally
]

{ #category : #playing }
SpaceShip >> applyPenaltyForEmptyFuelTank [

	position := 1.
	fuelTank refuelToMax.
	self turnModifier: -2
]

{ #category : #playing }
SpaceShip >> changeRollingResultNeededToEscapeHiperGravity: aNumber [

	needsToThrowToEscapeHyperGravity := aNumber
]

{ #category : #playing }
SpaceShip >> changeRollingResultNeededToEscapeJail: aNumber [

	needsToThrowToEscapeJail := aNumber
]

{ #category : #playing }
SpaceShip >> decreaseFuelBy: amountOfFuel [

	fuelTank decreaseFuelBy: amountOfFuel
]

{ #category : #playing }
SpaceShip >> escapeJail [

	needsToThrowToEscapeJail := 0
]

{ #category : #playing }
SpaceShip >> extraTurn [

	self turnModifier: 1
]

{ #category : #accessing }
SpaceShip >> fuelTank [

	^ fuelTank
]

{ #category : #playing }
SpaceShip >> handleAllyFuelForMovePositionBy: aNumber lapBy: quantityOfLapsToMove [

	ally fuelTank currentFuel < fuelTank currentFuel abs
		ifTrue: [
			ally applyPenaltyForEmptyFuelTank.
			self applyPenaltyForEmptyFuelTank ]
		ifFalse: [
			ally decreaseFuelBy: fuelTank currentFuel abs.
			fuelTank fuel: 0.
			self moveToNextPositionBy: aNumber lapBy: quantityOfLapsToMove ]
]

{ #category : #playing }
SpaceShip >> handleEmptyFuelTankForMovePositionBy: aNumber lapBy: quantityOfLapsToMove [

	ally ifNil: [ self applyPenaltyForEmptyFuelTank ] ifNotNil: [
		self
			handleAllyFuelForMovePositionBy: aNumber
			lapBy: quantityOfLapsToMove ]
]

{ #category : #initialization }
SpaceShip >> initialize: aName withMaxFuel: anAmount [

	name := aName.
	position := 1.
	lap := 1.
	modifiedTurns := 0.
	needsToThrowToEscapeHyperGravity := 0.
	needsToThrowToEscapeJail := 0.
	fuelTank := FuelTank withMaxFuel: anAmount.
	ally := nil
]

{ #category : #asserting }
SpaceShip >> isAlliedWith: anotherSpaceship [

	ally := anotherSpaceship
]

{ #category : #'accessing - arguments' }
SpaceShip >> lap [

	^ lap
]

{ #category : #accessing }
SpaceShip >> modifiedTurns [

	^ modifiedTurns
]

{ #category : #playing }
SpaceShip >> movePositionBy: aNumber lapBy: quantityOfLapsToMove neededFuel: aFuelAmount [

	(needsToThrowToEscapeHyperGravity = 0 and: [
		 needsToThrowToEscapeJail = 0 ]) ifFalse: [ ^ self ].
	self decreaseFuelBy: aFuelAmount.

	fuelTank isEmpty
		ifTrue: [
			self
				handleEmptyFuelTankForMovePositionBy: aNumber
				lapBy: quantityOfLapsToMove ]
		ifFalse: [
		self moveToNextPositionBy: aNumber lapBy: quantityOfLapsToMove ]
]

{ #category : #playing }
SpaceShip >> moveToNextPositionBy: aNumber lapBy: quantityOfLapsToMove [

	position := position + aNumber.
	lap := lap + quantityOfLapsToMove
]

{ #category : #accessing }
SpaceShip >> name [

	^ name
]

{ #category : #'accessing - arguments' }
SpaceShip >> position [

	^ position
]

{ #category : #playing }
SpaceShip >> rollDiceUsing: aDiceRoller [

	| rolledNumber |
	rolledNumber := aDiceRoller roll.
	((needsToThrowToEscapeHyperGravity = 0 or: [
		  rolledNumber = needsToThrowToEscapeHyperGravity ]) and: [
		 needsToThrowToEscapeJail = 0 or:
			 rolledNumber = needsToThrowToEscapeJail ]) ifTrue: [
		needsToThrowToEscapeHyperGravity := 0.
		needsToThrowToEscapeJail := 0 ].
	^ rolledNumber
]

{ #category : #asserting }
SpaceShip >> setAllyToNil [

	ally := nil
]

{ #category : #playing }
SpaceShip >> skipTurn [

	self turnModifier: -1
]

{ #category : #playing }
SpaceShip >> skipTurnToRefuel [

	self turnModifier: -1.
	fuelTank refuelToMax
]

{ #category : #playing }
SpaceShip >> turnModifier: amountOfTurns [

	modifiedTurns := modifiedTurns + amountOfTurns
]
