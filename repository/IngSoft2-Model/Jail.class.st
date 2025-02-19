Class {
	#name : #Jail,
	#superclass : #Effect,
	#instVars : [
		'needsToThrow'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #playing }
Jail >> triggeredBy: aSpaceship on: anEffectManager [

	anEffectManager currentGame assignJailTo: aSpaceship
]
