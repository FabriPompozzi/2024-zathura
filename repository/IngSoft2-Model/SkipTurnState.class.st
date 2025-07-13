Class {
	#name : #SkipTurnState,
	#superclass : #TurnState,
	#instVars : [
		'turnsLeft'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #playing }
SkipTurnState >> addExtraTurns: aNumber [

	| newBalance |
	newBalance := turnsLeft - aNumber.

	^ newBalance = 0
		  ifTrue: [ NormalTurnState new ]
		  ifFalse: [
			  newBalance > 0 ifFalse: [
				  ExtraTurnState new initializeWith: newBalance negated ] ]
]

{ #category : #playing }
SkipTurnState >> addTurnPenalty: aNumber [

	turnsLeft := turnsLeft + aNumber
]

{ #category : #playing }
SkipTurnState >> canPlay [

	^ turnsLeft = 0
]

{ #category : #initialization }
SkipTurnState >> initializeWith: anAmountOfTurns [

	turnsLeft := anAmountOfTurns
]

{ #category : #accessing }
SkipTurnState >> nextStateAfterTurn: aSpaceship [

	turnsLeft = 0 ifTrue: [ ^ NormalTurnState new ].
	turnsLeft := turnsLeft - 1.
	^ self
]

{ #category : #accessing }
SkipTurnState >> turnsLeft [

	^ turnsLeft
]
