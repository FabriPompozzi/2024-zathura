Class {
	#name : #Jail,
	#superclass : #Effect,
	#instVars : [
		'needsToThrow'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Jail class >> needsToThrow: aRollingResult [

	^ self new initializedWith: aRollingResult
]

{ #category : #initialization }
Jail >> initializedWith: aNumber [

	needsToThrow := aNumber
]

{ #category : #playing }
Jail >> triggeredBy: aSpaceship on: anEffectManager [

	aSpaceship changeRollingResultNeededToMoveJail: needsToThrow
]
