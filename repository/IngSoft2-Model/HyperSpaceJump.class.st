Class {
	#name : #HyperSpaceJump,
	#superclass : #Effect,
	#instVars : [
		'needsToThrow'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #playing }
HyperSpaceJump >> triggeredBy: aSpaceship on: anEffectManager [

	anEffectManager hyperSpaceJump: aSpaceship by: 4
]
