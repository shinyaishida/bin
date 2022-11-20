#!/usr/bin/env bash

readonly target=../and

test_or() {
    assert "test '$($target 0)' = '0'"
    assert "test '$($target 0 1)' = '0 and 1'"
    assert "test '$($target 0 1 2)' = '0, 1, and 2'"
}
