## Description

This problem was asked by Facebook.

Describe an algorithm to compute the longest increasing subsequence of an array of numbers in `O(n log n)` time.

## Answer

- Create a structure that:
	- takes as input an array of integers
	- go through each element of the array in order
	- has an internal array of arrays (of ints) representing all the `candidates` it builds

As you're going through the elements, you start building `candidates` for the answer, for example if the input is [1,3,4,2,5,6,2]:

- you drop 1, create a new "candidate" in your `candidates` array of array with 1 in it
- you drop 3, it's greated than the last element of your current candidate, so you append it, you don't have other `candidates`
- you drop 4, same as above
- you drop 2, it's smaller than 4, you create a new candidate in the `candidates` array and add 2 to it
- you drop 5, it's larger than both 2 and 4, append it to both, since both candidates have the same max value for now, only the largest one is relevant, remove the smaller candidate ([2,5]), `candidates` is now [[1,3,4,5]]
- you drop 6, it's larger than 5 so you append it
- you drop 2, it's smaller than 6 so you create a new candidate. `candidates` is now [[1,3,4,5,6],[2]]
- there are no more item. you return the largest element in `candidates`