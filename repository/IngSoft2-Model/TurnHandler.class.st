Class {
	#name : #TurnHandler,
	#superclass : #Object,
	#instVars : [
		'spaceships'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #asserting }
TurnHandler class >> assertValidNumberOf: someSpaceShips [

	someSpaceShips isEmpty ifTrue: [
		Error signal: 'Game must have at least one player' ]
]

{ #category : #'instance creation' }
TurnHandler class >> withPlayers: someSpaceShips [

	self assertValidNumberOf: someSpaceShips.
	^ self new initializeWithSpaceships: someSpaceShips
]

{ #category : #playing }
TurnHandler >> changeTurns [

	spaceships add: spaceships first.
	spaceships removeFirst
]

{ #category : #initialization }
TurnHandler >> initializeWithSpaceships: someSpaceShips [

	spaceships := someSpaceShips asOrderedCollection
]

{ #category : #playing }
TurnHandler >> nextSpaceshipTurn [

	| spaceshipTurn |
	spaceshipTurn := self nextTurn.
	[ spaceshipTurn modifiedTurns < 0 ] whileTrue: [
		spaceshipTurn turnModifier: 1.
		self changeTurns.
		spaceshipTurn := self nextTurn ].
	[ spaceshipTurn modifiedTurns > 0 ] whileTrue: [
		spaceshipTurn turnModifier: -1.
		^ spaceshipTurn ].

	self changeTurns.
	^ spaceshipTurn
]

{ #category : #playing }
TurnHandler >> nextTurn [

	| spaceshipTurn |
	spaceshipTurn := spaceships first.
	^ spaceshipTurn
]

{ #category : #accessing }
TurnHandler >> reverseTurns [

	spaceships := spaceships reverse
]

{ #category : #accessing }
TurnHandler >> spaceships [

	^ spaceships
]
