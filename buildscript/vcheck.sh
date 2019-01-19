#!/usr/bin/env bash

vera++ *.h | grep -Ev "horizontal|copyright|comma|closing curly|reserved name|negation operator|composed of only|than 100 characters|full block \{\}"
vera++ *.c | grep -Ev "horizontal|copyright|comma|closing curly|reserved name|negation operator|composed of only|than 100 characters|full block \{\}"
