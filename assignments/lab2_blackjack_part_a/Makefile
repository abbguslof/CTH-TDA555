.PHONY: default test test_a test_b report clean

OUT  = out
TSTA = $(OUT)/test_a
TSTB = $(OUT)/test_b
RPT  = test_report_lab2.txt

default: $(TSTA) $(TSTB)

# "build" just typechecks/compiles the student solution
$(TSTA):
	mkdir -p $(OUT)
	ghc --make -main-is CheckPartA -hidir $(OUT) -odir $(OUT) -o $(TSTA) CheckPartA.hs

$(TSTB):
	mkdir -p $(OUT)
	ghc --make -main-is CheckPartB -hidir $(OUT) -odir $(OUT) -o $(TSTB) CheckPartB.hs

# "test" runs the test suite
test_a: $(TSTA)
	./$(TSTA)

test_b: $(TSTB)
	./$(TSTB)

test: $(TSTA) $(TSTB)
	./$(TSTA) || true
	./$(TSTB)

# Save the test results in a file
report: $(TSTA) $(TSTB)
	./$(TSTA) > $(RPT) || true
	./$(TSTB) >> $(RPT)

# optional cleanup
clean:
	rm -fr $(OUT) $(RPT)
