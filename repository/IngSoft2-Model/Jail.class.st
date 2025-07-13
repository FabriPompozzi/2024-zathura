Class {
	#name : #Jail,
	#superclass : #Effect,
	#instVars : [
		'needsToThrow'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Jail class >> usingDice: someDice [

	^ self new initializedWith: someDice maxRoll
]

{ #category : #initialization }
Jail >> initializedWith: aNumber [

	needsToThrow := aNumber
]

{ #category : #playing }
Jail >> triggeredBy: aSpaceship on: anEffectManager [

	anEffectManager
		addRestriction: (JailRestriction needsToThrow: needsToThrow)
		to: aSpaceship
]
