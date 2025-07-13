Class {
	#name : #HyperGravityRestriction,
	#superclass : #MovementRestriction,
	#instVars : [
		'requiredValue'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #testing }
HyperGravityRestriction class >> needsToThrow: aNumber [

	^ self new initializeWith: aNumber
]

{ #category : #playing }
HyperGravityRestriction >> allowsMovementTo: aSpaceship withRoll: aRoll [

	^ aRoll = requiredValue
]

{ #category : #initialization }
HyperGravityRestriction >> initializeWith: aRequiredValue [

	requiredValue := aRequiredValue
]
