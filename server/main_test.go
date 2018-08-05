package main

import "testing"

func TestCompleteAnalysisFlow(t *testing.T) {
	k := todoList()
	if k[0].Title != "Do auto build" {
		t.Fail()
	}
	if len(k) < 2 {
		t.Fail()
	}
}
