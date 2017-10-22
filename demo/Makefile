MONTO_RS_DIR := ~/Projects/melt/monto-rs
MONTO_CPP_DIR := ~/Projects/melt/monto-cpp
MONTO_LOCTRANS_DIR := ~/Projects/melt/monto-loctrans

all: monto-broker ableC-monto.jar monto-cpp monto-loctrans
run: monto-broker ableC-monto.jar monto-cpp monto-loctrans
	tmux new-session -d -n broker -s monto-demo "sleep 3 && ./monto-broker"
	tmux new-window -n ableC -t monto-demo:1 "java -jar ableC-monto.jar 10000"
	tmux new-window -n cpp -t monto-demo:2 "./monto-cpp"
	tmux new-window -n loctrans -t monto-demo:3 "./monto-loctrans"
	tmux attach -t monto-demo:0
.PHONY: all run

monto-broker:
	cd $(MONTO_RS_DIR) && cargo build --release
	cp $(MONTO_RS_DIR)/target/release/monto-broker .

monto-cpp:
	cd $(MONTO_CPP_DIR) && cargo build --release
	cp $(MONTO_CPP_DIR)/target/release/monto-cpp .

monto-loctrans:
	cd $(MONTO_LOCTRANS_DIR) && cargo build --release
	cp $(MONTO_LOCTRANS_DIR)/target/release/monto-loctrans .

ableC-monto.jar:
	silver --one-jar -o $@ \
		-I .. \
		-I ../../ableC \
		-I ../../extensions/ableC-algebraic-data-types/grammars \
		-I ../../extensions/ableC-cilk/grammars \
		-I ../../extensions/ableC-regex-lib/grammars \
		-I ../../extensions/ableC-regex-pattern-matching/grammars \
		edu:umn:cs:melt:ableC:monto:demo
