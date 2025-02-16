Class {
	#name : #ReverseCard,
	#superclass : #Card,
	#category : #'IngSoft2-Model'
}

{ #category : #delegating }
ReverseCard >> uses: cardPlayResolver [

	cardPlayResolver resolveAReverseCardPlay: self
]
