Class {
	#name : #SkipCard,
	#superclass : #Card,
	#category : #'IngSoft2-Model'
}

{ #category : #delegating }
SkipCard >> uses: cardPlayResolver [

	cardPlayResolver resolveASkipCardPlay: self
]
