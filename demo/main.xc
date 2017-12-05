#include <regex.h>

typedef datatype Tree Tree;
datatype Tree {
	Fork(Tree*, Tree*, const char*);
	Leaf(const char*);
}

cilk int count_matches(Tree *t);

cilk int main(void) {
	int count;
	Tree* tree;

	// TODO Initialize tree.

	spawn count = count_matches(tree);
	sync;
	cilk return count;
}

cilk int count_matches(Tree *t0) {
	// Workaround for a bug.
	Tree *t = t0;

	match(t) {
		Fork(t1, t2, str) -> {
			int res_t1, res_t2, res_str;
			spawn res_t1 = count_matches(t1);
			spawn res_t2 = count_matches(t2);
			if(str =~ /[1-9]*/)
				res_str = 1;
			else
				res_str = 0;
			sync;
			cilk return res_t1 + res_t2 + res_str;
		}
		Leaf(/[1-9]*/) -> { cilk return 1; }
		_ -> { cilk return 0; }
	}
}
