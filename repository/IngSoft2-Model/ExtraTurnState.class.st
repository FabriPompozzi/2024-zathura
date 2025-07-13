Class {
	#name : #ExtraTurnState,
	#superclass : #TurnState,
	#instVars : [
		'turnsRemaining'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #playing }
ExtraTurnState >> addExtraTurns: aNumber [
turnsRemaining := turnsRemaining + aNumber
]

{ #category : #playing }
ExtraTurnState >> addTurnPenalty: aNumber [

	| newBalance |
	newBalance := turnsRemaining - aNumber.

	^ newBalance = 0
		  ifTrue: [ NormalTurnState new ]
		  ifFalse: [
			  newBalance > 0 ifFalse: [
				  SkipTurnState new initializeWith: newBalance negated ] ]
]

{ #category : #playing }
ExtraTurnState >> canPlay [

	^ true
]

{ #category : #initialization }
ExtraTurnState >> initializeWith: aNumber [

	turnsRemaining := aNumber
]

{ #category : #accessing }
ExtraTurnState >> nextStateAfterTurn: aSpaceship [

	turnsRemaining := turnsRemaining - 1.
	^ turnsRemaining = 0
		  ifTrue: [ NormalTurnState new ]
		  ifFalse: [ self ]
]

{ #category : #playing }
ExtraTurnState >> retainsTurn [

	^ true
]
