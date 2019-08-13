/*
Maximum difference between two elements such that larger element
appears after the smaller number.

Given an array arr[] of integers, find out the maximum difference
between any two elements such that larger element appears after
the smaller number.
If no solution exists, return null.
-------------------------------------

My solution: 
* Use 2 variables
  * maxDiff - is the max difference, starts with difference of first 2 values.
  * minElement - is the smallest element, starts at arr[0].

* For each element of the array
  * calculate difference between current element and minElement.
  * compare difference to maxDiff and update maxDiff if it's greater.
  * compare current element to minElement and update minElement if it's lesser.

* Finally, return maxDiff if solution exists else return null.

***  Time Complexity O(n)
***  Auxiliary Space O(1)
*/

function maxDiff(arr: number[] = []): number | null {
  if (arr.length < 2) return null;

  let maxDiff: number = arr[1] - arr[0];
  let minElement: number = arr[0];

  for (let i: number = 1; i < arr.length; i++) {
    let diff: number = arr[i] - minElement;
    if (diff > maxDiff) {
      maxDiff = diff;
    }
    if (arr[i] < minElement) {
      minElement = arr[i];
    }
  }
  return (maxDiff > 0) ? maxDiff : null;
}


let arr: number[] = [100, 0, 10, 50];
console.log("Input => Output,  Answer\n")
console.log(arr + " => " + maxDiff(arr) + ",  Answer: 50");
console.log("[]" + " => " + maxDiff() + ",  Answer: null");
arr = [100, 50, 10, 0];
console.log(arr + " => " + maxDiff(arr) + ",  Answer: null");
