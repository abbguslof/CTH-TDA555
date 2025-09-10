.PHONY: default test report clean

SRC = Lab1.hs
OUT = out
TST = $(OUT)/test
RPT = test_report_lab1.txt

default: $(TST)

# "build" just typechecks/compiles the student solution
$(TST): $(SRC)
	mkdir -p $(OUT)
	ghc --make -main-is Check -hidir $(OUT) -odir $(OUT) -o $(TST) Check.hs

# "test" runs the test suite
test: $(TST)
	./$(TST)

report: $(TST)
	./$(TST) > $(RPT)

# optional cleanup
clean:
	rm -fr $(OUT) $(RPT)
