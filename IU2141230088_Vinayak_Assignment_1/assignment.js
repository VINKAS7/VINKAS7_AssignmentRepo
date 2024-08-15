// Question-1.) isAnagram ( Means the two string consists all the same characters or character of string are rearranged to form different words. )

function isAnagram(string1,string2){
    let n1 = string1.length; // finding length of string 1
    let n2 = string2.length; // finding length of string 2
    if (n1 !== n2){ // if size is not equal then it is not an anagram
        return false;
    }
    let str1 = string1.split('').sort(); // convert the string into list then sort it
    let str2 = string2.split('').sort();
    for (let i = 0; i < n1; i++) {
        if (str1[i] !== str2[i]){ // if any character in sorted character array is not same then return false
            return false;
        }
    }
    return true; // else return true
}
console.log(isAnagram("vinkas","kasvin"))
console.log(isAnagram("vinkas","hannah"))

// Question-2.) Calculate Total Spent By Category

function calculateTotalSpentByCategory(transactions) {
    const categoryTotals = {}; // Create a map to keep track of total spent per category
    transactions.forEach(transaction => { // Iterate through the transactions
        const { category, price } = transaction;
        if (categoryTotals[category]) { // Add the price to the total for the category
            categoryTotals[category] += price;
        } else {
            categoryTotals[category] = price;
        }
    });
    return Object.keys(categoryTotals).map(category => { // Convert the map to the desired output format
        return {category, totalSpent: categoryTotals[category]};
    });
}
const transactions = [
    { category: 'Groceries', price: 30 },
    { category: 'Entertainment', price: 50 },
    { category: 'Groceries', price: 20 },
    { category: 'Transportation', price: 15 },
    { category: 'Entertainment', price: 30 },
];

console.log(calculateTotalSpentByCategory(transactions));

// Question-3.) find Largest Element in array

function findLargestElement(elements_array) {
    let max_num = elements_array[0]; // by default take first element in array as maximum element
    for(let i = 1; i < elements_array.length; i++) { // Iterate  the array and find element bigger than max_num
        if(max_num < elements_array[i]){
            max_num = elements_array[i]; // If any element is bigger, then replace the value of max_num with that element
        }
    }
    console.log("Maximum element in list: "+max_num);
}
findLargestElement([-10,100,200,1,2,3]);

// Question-4.) isPalindrome ( Means original string == reverse string )

function isPalindrome(str) {
    const reverse_str = str.split('').reverse().join(''); // convert the string into list using split then reverse the list and join to form reverse string.
    return str === reverse_str; // Compare the original string with the reverse string
    // if true then palindrome if not then not a palindrome.
}
console.log(isPalindrome("hannah"));
console.log(isPalindrome("vinkas"));

// Question-5.) Calculate the time in seconds for running javascript Code.

function calculateTime(n) { // Input: n for looping from 1 to n elements
    let start = performance.now(); // this function is used to measure the performance of code and returns time in milliseconds.
    let sum = 0;
    for (let i = 1; i <= n; i++) {
        sum += i;
    }
    let end = performance.now();
    return (end - start) / 1000; // Divide by 1000 because the answer is in milliseconds (1 second = 1000 milliseconds).
}
console.log(calculateTime(1000000));  // Output: time taken in seconds

// Question-6.) countVowels in string

function countVowels(str){
    let vowels_count = 0; // initialize the vowel count with 0
    for(let i=0;i<str.length;i++){ // Iterate through the string for finding vowels
        if(str[i] === 'a' || str[i] === 'e' || str[i] === 'i' || str[i] === 'o' || str[i] === 'u'){ // if character is equal to {a,e,i,o,u} then vowel count is increase by 1
            vowels_count++;
        }
    }
    console.log("No. of vowels in string: "+vowels_count);
}
countVowels("vinkas");

// Question-7.) sumArray return sum of all element in array.

function sumArray(array){
    let sum = 0; // Initialize the sum with 0;
    for(let i=0; i<array.length; i++){ // Iterate through the array for adding each element to sum variable
        sum += array[i];
    }
    console.log("Sum of all elements in array: "+sum);
}
sumArray([1,2,3,4,5,6,7,-7]);

// Question-8.) filterEvenNumbers and return only even number array

function filterEvenNumbers(array) {
    let even_num_array = [] // Initialize the even number empty array
    for (let i = 0; i < array.length; i++) { // Iterate through the array
        if(array[i] % 2 === 0) { // If modulo with 2 is 0 and then push that element in to even number array because it's even number
            even_num_array.push(array[i]);
        }
    }
    console.log("Even number array is: "+even_num_array);
}
filterEvenNumbers([1,2,3,4,5,6,7,8,9,10]);

// Question-9.) find Smallest Element in array.
function findSmallestElement(array) {
    let min_num = array[0]; // Suppose minimum number is first element in array
    for(let i=1;i<array.length;i++){ // Iterate through the array
        if(min_num > array[i]){ // If any number is less than min_num then replace the value in min_num with that element of array/\.
            min_num = array[i];
        }
    }
    console.log("Minimum element in list: "+min_num);
}
findSmallestElement([1,2,3,-10,100,200]);

// Question-10.) reverseString reverse the original string
function reverseString(str){
    console.log("Reverse string is: "+str.split('').reverse().join('')); // Convert the string into character array and
    // reverse the character array and join the string to form reverse string
}
reverseString("vinkas");

// Question-11.) fibonacci sequence

let fib = [] // Initialize the fibonacci sequence with empty array
fib.push(1); // push 1 at index 0
fib.push(1); // push 1 at index 1
function fibonacci(start,end){ // we are using dynamic programming approach
    if(start >= end){ // base case return fib[4] in case of input 5
        return fib[start-1];
    }
    fib[start] = fib[start-1]+fib[start-2]; // save all fibonacci sequence after 0 and 1, so we don't have count it again.
    return fibonacci(start+1,end); // recursive case in which start increases by 1
}
let ans = fibonacci(2,10);
console.log(10+" element in fibonacci series is: "+ans);

// Question-12.) removeDuplicates

function removeDuplicates(array) {
    let temp = new Map() // Initialize map
    let new_array = [] // Initialize new array for elements without duplicates
    for(let i = 0; i < array.length; i++) { // Iterate through array
        if(temp.get(array[i]) === 1){ // If array element already present in map and its value is 1 then continue
            continue;
        }
        new_array.push(array[i]); // If not present in map then push element in new array and also set element in map with value 1.
        temp.set(array[i], 1);
    }
    console.log("Old array with duplication: "+array)
    console.log("New array without duplication is: "+new_array);
}

removeDuplicates([1,2,3,1,1,5,6,-10]);

// Question-13.) countOccurrences count occurrences of character in string

function countOccurrences(str) {
    let array = str.split(''); // convert string into character array
    let occurrences = new Map() // Initialize occurrence map
    for (let i = 0; i < array.length; i++) { // Iterate through array
        if(occurrences.get(array[i]) === undefined) { // If character is not present in map then set the character in map with 0
            occurrences.set(array[i], 0);
        }
        let temp = occurrences.get(array[i]) // If present in map then increase its value by 1.
        occurrences.set(array[i], temp+1);
    }
    for(let [key, value] of occurrences) {
        console.log("Occurrence of "+key+" in array is: "+value)
    }
}
countOccurrences("hannah");

// Question-14.) find Common Elements between two arrays -> array1 and array2

function findCommonElements(array1,array2) {
    let temp = new Map(); // Initialize temp map
    let common_elements = []; // Initialize common elements array
    for(let i = 0; i < array1.length; ++i) { // Iterate through array1
        temp.set(array1[i],1); // set elements present array1 in map and initialize its value 1
    }
    for(let i = 0; i < array2.length; ++i) { // Iterate through thr array2
        if(temp.get(array2[i])){ // If element already present in map then push in common element array
            common_elements.push(array2[i]);
        }
    }
    console.log("Common elements from both array are: "+common_elements)
}
findCommonElements([-1,2,3,1,4],[-5,2,3,1,-4]);

// Question-15.) sort the strings

function sortStrings(str) {
    console.log("Unsorted string is: "+str)
    console.log("Sorted string is: "+str.split('').sort().join('')) // Convert string into character array then sort it and join the string and print sorted string.
}
sortStrings("vinkas");