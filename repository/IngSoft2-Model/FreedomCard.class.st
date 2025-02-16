Class {
	#name : #FreedomCard,
	#superclass : #Card,
	#category : #'IngSoft2-Model'
}

{ #category : #delegating }
FreedomCard >> uses: cardPlayResolver [

	cardPlayResolver resolveAFreedomCardPlay: self
]
