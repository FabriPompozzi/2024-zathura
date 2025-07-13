Class {
	#name : #MovementRestriction,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #playing }
MovementRestriction >> allowsMovementTo: aSpaceship withRoll: aRoll [

	^ true
]

{ #category : #asserting }
MovementRestriction >> isClearedBy: aCondition [

	self subclassResponsibility

	
]

{ #category : #asserting }
MovementRestriction >> isRemovableByFreedomCard [

	^ false
]
