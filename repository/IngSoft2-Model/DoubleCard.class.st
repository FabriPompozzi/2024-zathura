Class {
	#name : #DoubleCard,
	#superclass : #Card,
	#category : #'IngSoft2-Model'
}

{ #category : #delegating }
DoubleCard >> uses: cardPlayResolver [

	cardPlayResolver resolveADoubleCardPlay:self
]
