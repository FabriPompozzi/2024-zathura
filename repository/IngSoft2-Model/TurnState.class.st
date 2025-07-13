Class {
	#name : #TurnState,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #playing }
TurnState >> addExtraTurns: aNumber [

	self subclassResponsibility
]

{ #category : #playing }
TurnState >> addTurnPenalty: aNumber [

	self subclassResponsibility
]

{ #category : #playing }
TurnState >> canPlay [

	self subclassResponsibility
]

{ #category : #accessing }
TurnState >> nextStateAfterTurn: aSpaceship [

	self subclassResponsibility
]

{ #category : #playing }
TurnState >> retainsTurn [

	^ false
]
