MONTO_RS_DIR := ~/Projects/melt/monto-rs

all: monto3-broker ableC-monto.jar monto3-cpp monto3-loctrans
clean:
	rm -f monto3-broker ableC-monto.jar monto3-cpp monto3-loctrans
run: monto3-broker ableC-monto.jar monto3-cpp monto3-loctrans
	tmux new-session -d -n broker -s monto3-demo "sleep 3 && ./monto3-broker || read"
	tmux new-window -n ableC -t monto3-demo:1 "java -jar -Xms16M ableC-monto.jar 10000 || read"
	tmux new-window -n cpp -t monto3-demo:2 "./monto3-cpp || read"
	tmux new-window -n loctrans -t monto3-demo:3 "./monto3-loctrans || read"
	tmux attach -t monto3-demo:0
.PHONY: all run

monto3-broker:
	cd $(MONTO_RS_DIR) && cargo build --release --all
	cp $(MONTO_RS_DIR)/target/release/monto3-broker .

monto3-cpp:
	cd $(MONTO_RS_DIR) && cargo build --release --all
	cp $(MONTO_RS_DIR)/target/release/monto3-cpp .

monto3-loctrans:
	cd $(MONTO_RS_DIR) && cargo build --release --all
	cp $(MONTO_RS_DIR)/target/release/monto3-loctrans .

ableC-monto.jar:
	silver --one-jar -o $@ \
		-I .. \
		-I ../../ableC \
		-I ../../extensions/ableC-algebraic-data-types/grammars \
		-I ../../extensions/ableC-cilk/grammars \
		-I ../../extensions/ableC-regex-lib/grammars \
		-I ../../extensions/ableC-regex-pattern-matching/grammars \
		edu:umn:cs:melt:ableC:monto:demo
