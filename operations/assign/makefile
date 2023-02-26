all: FtoC CtoF toNegative toInches

FtoC: FtoC.s
	gcc FtoC.s -g -o FtoC

CtoF: CtoF.s
	gcc CtoF.s -g -o CtoF

toNegative:
	gcc toNegative.s -g -o toNegative

toInches:
	gcc toInches.s -g -o toInches

clean:
	rm FtoC CtoF toNegative toInches

