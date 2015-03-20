.PHONY: bin clean


####### libsvm installation #######

SRC_URL=http://www.csie.ntu.edu.tw/~cjlin/libsvm/libsvm-3.20.tar.gz
SRC_TGZ=$(notdir $(SRC_URL))
LIBSVM_DIR=$(basename $(basename $(SRC_TGZ)))
BINARIES=$(LIBSVM_DIR)/svm-train $(LIBSVM_DIR)/svm-predict $(LIBSVM_DIR)/svm-scale

bin: $(BINARIES)

$(SRC_TGZ):
	curl -sS -o $@ $(SRC_URL)

$(LIBSVM_DIR): $(SRC_TGZ)
	tar xvzf $<

$(BINARIES): $(LIBSVM_DIR)
	cd $< && make

clean:
	rm -f $(SRC_TGZ)
	rm -rf $(LIBSVM_DIR)
