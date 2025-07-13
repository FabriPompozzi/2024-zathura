Class {
	#name : #NormalTurnState,
	#superclass : #TurnState,
	#category : #'IngSoft2-Model'
}

{ #category : #playing }
NormalTurnState >> addExtraTurns: aNumber [

	^ ExtraTurnState new initializeWith: aNumber.
]

{ #category : #playing }
NormalTurnState >> addTurnPenalty: aNumber [

	^ SkipTurnState new initializeWith: aNumber
]

{ #category : #playing }
NormalTurnState >> canPlay [

	^ true
]

{ #category : #accessing }
NormalTurnState >> nextStateAfterTurn: aSpaceship [

	^ self
]
