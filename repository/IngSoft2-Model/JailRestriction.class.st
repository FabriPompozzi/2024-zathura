Class {
	#name : #JailRestriction,
	#superclass : #MovementRestriction,
	#instVars : [
		'requiredValue'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #testing }
JailRestriction class >> needsToThrow: aNumber [

	^ self new initializeWith: aNumber
]

{ #category : #playing }
JailRestriction >> allowsMovementTo: aSpaceship withRoll: aRoll [

	^ aRoll = requiredValue 
]

{ #category : #initialization }
JailRestriction >> initializeWith: aRequiredValue [

	requiredValue := aRequiredValue
]

{ #category : #asserting }
JailRestriction >> isRemovableByFreedomCard [

	^ true
]
