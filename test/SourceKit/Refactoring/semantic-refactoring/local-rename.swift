func foo() {
  var aa = 3
  aa = aa + 1
  _ = "before \(aa) after"
  return 1
}

// RUN: rm -rf %t.result && mkdir -p %t.result
// RUN: %sourcekitd-test -req=local-rename -pos=2:8 -name new_name %s -- %s > %t.result/local-rename.swift.expected
// RUN: diff -u %S/local-rename.swift.expected %t.result/local-rename.swift.expected
// RUN: %sourcekitd-test -req=find-local-rename-ranges -pos=2:8 %s -- %s > %t.result/local-rename-ranges.swift.expected
// RUN: diff -u %S/local-rename-ranges.swift.expected %t.result/local-rename-ranges.swift.expected

// REQUIRES-ANY: OS=macosx, OS=linux-gnu