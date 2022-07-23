import Array "mo:base/Array";
import Debug "mo:base/Debug";
import Nat "mo:base/Nat";
import Result "mo:base/Result";

actor Main {
  // Write func add takes 2 params m and n, return their sum
  public func add(n : Nat, m :Nat) : async Nat {
    return m + n;
  };

  // Given n, write func square that calculates it's area
  public func square(n : Nat) : async Nat {
    return n * n;
  };

  // Write func dayToSecond takes number of days n, calculate number of seconds
  public func dayToSecond(n : Nat) : async Nat {
    // A minute has 60 seconds
    // An hour has 60 minutes
    // A day has 24 hours
    return n * 60 * 60 * 24;
  };

  /* Write two functions increment_counter & clear_counter.
    + increment_counter returns the incremented value of counter by n.
    + clear_counter sets the value of counter to 0.
  */

  // Create common counter variable for 2 functions
  var counter : Nat = 0;
  // increase counter by one
  public func incrementCounter() : async Nat {
    counter +=1;
    return counter;
  };

  // clear counter, return its result, if counter already 0, return error
  // else set counter to 0, return success
  public func clearCounter() : async Result.Result<Text, Text> {
    if(counter == 0) {
      return #err("Counter already cleared!");
    } else {
      counter:=0;
      return #ok("Counter cleared");
    }
  };

  // Write a function divide that takes two natural numbers n and m and returns a boolean indicating if n divides m.
  public func divide(n : Nat, m : Nat) : async Bool {
    // if n < m, we can't divide them, so return false;
    // else, return true

    // if m == 0, it'll make ArithmeticException
    if(m == 0) return false;

    if(n < m) {
      return false;
    };
    return true;
  };

  // Write a function is_even that takes a natural number n and returns a boolean indicating if n is even.
  public func isEven(n : Nat) : async Bool {
    return n % 2 == 0;
  };

  /* Write a function sum_of_array that takes an array of natural numbers and returns the sum.
   This function will returns 0 if the array is empty. */
  public func sumOfArray(arr :[Nat]) : async Nat {
    if(arr.size() == 0) return 0;

    var result : Nat = 0;
    // just a for loop
    for(element in arr.vals()) {
      result += element;
    };

    return result;
  };

  /* Write a function maximum that takes an array of natural numbers and returns the maximum value in the array.
   This function will returns 0 if the array is empty. */
  public func maximum(arr :[Nat]) : async Nat {
    if(arr.size() == 0) return 0;

    var max : Nat = 0;
    // just a for loop
    for(element in arr.vals()) {
      if(max < element) {
        max := element;
      };
    };

    return max;
  };

  /* Write a function remove_from_array that takes 2 parameters : an array of natural numbers and a natural number n and returns
   a new array where all occurences of n have been removed (order should remain unchanged). */
  public func removeFromArray(arr : [Nat], n : Nat) : async [Nat] {
    // Array.filter just like javascript xD
    return Array.filter(arr, func(i : Nat) : Bool {
      i != n;
    });
  };

  // cuz motoko doesn't have for loop, so we have to use while loop to indexing the array
  public func selectionSort(arr:[Nat]) : async [Nat] {
    // if arr length < 2 return arr;
    if(arr.size() < 2) 
      return arr;

    // create mutable array from given immutable array
    let newArr : [var Nat] = Array.thaw(arr);

    // you shouldn't care 'bout this, cuz i don't even know what i'm doing lol :>
    var i : Nat = 0;
    let n : Nat = newArr.size();
    while(i < n - 1) {
      // get the index of min value in each loop
      var minIndex = i;
      var  j = i + 1;
      while(j < n) {
        if(newArr[j] < newArr[minIndex]) {
          minIndex := j;
        };
        j+=1;
      };
      // swap them
      let temp : Nat = newArr[minIndex];
      newArr[minIndex] := newArr[i];
      newArr[i] := temp;

      i+=1;
    };

    // convert array from mutable to immutable again using freeze
    return Array.freeze(newArr);
  };
};
