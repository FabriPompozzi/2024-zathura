Class {
	#name : #ExtraTurnState,
	#superclass : #TurnState,
	#instVars : [
		'turnsLeft'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #playing }
ExtraTurnState >> addExtraTurns: aNumber [

	turnsLeft := turnsLeft + aNumber
]

{ #category : #playing }
ExtraTurnState >> addTurnPenalty: aNumber [

	| newBalance |
	newBalance := turnsLeft - aNumber.

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

	turnsLeft := aNumber
]

{ #category : #accessing }
ExtraTurnState >> nextStateAfterTurn: aSpaceship [

	turnsLeft := turnsLeft - 1.
	^ turnsLeft = 0
		  ifTrue: [ NormalTurnState new ]
		  ifFalse: [ self ]
]

{ #category : #playing }
ExtraTurnState >> retainsTurn [

	^ true
]

{ #category : #accessing }
ExtraTurnState >> turnsLeft [

	^ turnsLeft
]
