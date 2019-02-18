#!/usr/bin/env -S awk -f

/.*/ {
	split($0, chars, "")
	for (i in test) {test[i] = 0}
	for (i=1; i <= length($0); i++) {
		test[chars[i]] += 1;
	}
	print(test["a"])
}
