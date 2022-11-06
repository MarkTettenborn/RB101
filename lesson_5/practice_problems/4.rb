# For each of these collection objects where the value 3 occurs, 
# demonstrate how you would change this to 4.

arr1 = [1, [2, 3], 4]
arr1[1][1] += 1
puts arr1.inspect

arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]
arr2[2] += 1
puts arr2.inspect

hsh1 = {first: [1, 2, [3]]}
hsh1[:first][2][0] += 1
puts hsh1.inspect

hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}
hsh2[['a']][:a][2] += 1
puts hsh2.inspect