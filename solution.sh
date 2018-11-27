#!/usr/bin/env sh

# 1. List the cities that start with the letter “Z”
grep "^Z" cities.txt

# 2. List the cities that end with the word "gan"
grep "gan$" cities.txt

# 3. List the cities that start with "A", "D", or "E"
grep "^[ADE]" cities.txt

# 4. List the cities that have "a" as their second letter and "r" as their third letter
# [a-zA-Z] and [[:alpha:]] are equivalent
grep "\<[a-zA-Z]ar" cities.txt
grep "\<[[:alpha:]]ar" cities.txt

# 5. List the cities that don't start with "C"
# "^" outside brackets is an anchor for the beginning of line
# "^" inside brackets Matches the opposite of the brackets contents
grep "^[^C]" cities.txt
grep --invert-match "^[C]" cities.txt

# 6. List the cities that have at least 14 characters
grep --extended-regexp "[[:alpha:]-]{14,}" cities.txt

# 7. Count how many cities start with the letter "B"
grep --count "^B" cities.txt

# 8. Count how many times the letter "d" repeats
# We must print the matches and use wc to count the lines
grep --only-matching "d" cities.txt | wc -l

# 9. List the cities that end with the same letter twice
grep --extended-regexp "([[:alpha:]])\1$" cities.txt

# 10. List the palindrome cities with 5 characters
grep --ignore-case --extended-regexp "^([[:alpha:]])([[:alpha:]])[[:alpha:]]\2\1$" cities.txt
# We need to use perl syntax to find arbitrary palidromes
grep --ignore-case --perl-regexp "^((.)(?1)\2|.?)$" cities.txt
