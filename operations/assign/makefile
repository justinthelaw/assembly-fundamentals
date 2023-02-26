all: FtoC CtoF

FtoC: FtoC.s
	gcc FtoC.s -g -o FtoC

FtoC: CtoF.s
	gcc CtoF.s -g -o CtoF

clean:
	rm FtoC CtoF

