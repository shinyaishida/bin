#!/usr/bin/env bash

readonly target=../or

test_or() {
    assert "test '$($target 0)' = '0'"
    assert "test '$($target 0 1)' = '0 or 1'"
    assert "test '$($target 0 1 2)' = '0, 1, or 2'"
}
