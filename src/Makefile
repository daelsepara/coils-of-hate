all: clean
	zilf -w coilshate.zil
	-zapf -ab coilshate.zap > coilshate_freq.xzap
	rm coilshate_freq.zap
	zapf coilshate.zap

test: clean
	zilf -w coilshate.zil
	zapf coilshate.zap

clean:
	rm -f *.xzap *.zap *.z?
