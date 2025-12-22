# Assignment 8 - Python
import random
import math
# Problem 1
# Taking input
n = int(input("Enter any integer:"))
# Function
def f(n):
    if (n == 1):
        return 0
    else:
        c = 0
        while (n != 1):
            if (n % 2 == 0):
                n = n/2
                c += 1
            else:
                n = 3*n + 1
                c += 1
        return c
# Calling the function defined above
f(n)
# Problem 2
# Function definition
def reverse_line(f):
    f1 = open(f, "r")
    l = f1.read()
    m = ''
    for i in range(len(l)-1,-1,-1):
        m = m + l[i]
    print(m)
    f2 = open("reverse_lines_op.txt", "w")
    f2.writelines(m)
    f2.close()
    f1.close()
# Calling the function
f = "revers_lines.txt"
reverse_line(f)
# Problem 3
# Function definition
def wordcount(f):
    f1 = open(f, "r")
    c = f1.read()
    ch = 0
    l = 0
    for i in c:
        ch += 1
        if(i == '\n'):
            l += 1
    uw = 0
    s = c.split()
    for i in range(len(s)):
        if (s[i] not in s[0:i]):
            uw += 1
    print("The number of characters in the given file =", ch)
    print("The number of words in the given file =", len(s))
    print("The number of lines in the given file =", l)
    print("The number of unique words in the given file =", uw)
# Calling the function
f = "wcfile.txt"
wordcount(f)
# Problem 4
# Function definition
def dictdiff(d1, d2):
    d = {}
    for i in d1:
        if i in d2:
            if(d1[i] != d2[i]):
                x = [d1[i], d2[i]]
                d[i] = x
        else:
            d[i] = [d1[i], 'None']
            for j in d2:
                if (j not in d1):
                    d[j] = ['None', d2[j]]  
    d = dict(sorted(d.items()))
    return d
# Calling the function
d1 = {'a':1, 'b':2, 'c':3}
d2 = {'a':1, 'b':2, 'c':4}
d3 = {'a':1, 'b':2, 'd':3}
d4 = {'a':1, 'b':2, 'c':4}
d5 = {'a':1, 'b':2, 'd':4}
print(dictdiff(d1,d1))
print(dictdiff(d1,d2))
print(dictdiff(d3,d4))
print(dictdiff(d1,d5))
# Problem 5
# Input for problem 5 is taken by this code.
n = int(input("Enter the number of records in your list of strings: "))
PEOPLE = []
for i in range(1, n):
    f = str(input("Enter first name: "))
    l = str(input("Enter last name: "))
    n = str(input("Enter number of twitter followers in millions: "))
    s = (f, l, n)
    PEOPLE.append(s)
# Function definition
def alphabetize_names(l):
    x = []
    for i in l:
        s = i['last'] + ' ' + i['first']
        x.append(s)
    x = sorted(x)
    y = []
    for i in x:
        for j in l:
            t = j['last'] + ' ' + j['first']
            if(t == i):
                y.append(j)
    return y
# Calling the function
PEOPLE = [{'first':'Narendra', 'last':'Modi',
'email':'naren@modi.co.in'}, {'first':'Donald',
'last':'Trump','email':'president@whitehouse.gov'},
{'first':'Vladimir', 'last':'Putin',
'email':'president@kremvax.ru'}]    
print(alphabetize_names(PEOPLE))
# Problem 6
# Input for problem 6 is taken by this code.
n = int(input("Enter the number of strings in your list of strings: "))
words = []
for i in range(1, n):
    s = str(input("Enter string: "))
    words.append(s)
# Function definition
def most_repeating_word(words):
    max = 0
    max1 = 0
    l = []
    s = ''
    global c
    c = 0
    for i in words:
        for j in i:
            if(i.count(j) > max1):
                max1 = i.count(j)
        l.append(max1)
        if(max1 > max):
            max = max1
        max1 = 0
    if (len(list(set(l))) > 1):
        for i in range(0, len(l)):
            if (max == l[i]):
                s = s + words[i]
        return s
    else:
        return words[0]
# Calling the function
words = ['this', 'is', 'an', 'elementary', 'test', 'example']
most_repeating_word(words)
# Problem 7
# Input for problem 7 is taken by this code.
n = int(input("Enter the number of records in your list of strings: "))
PEOPLE = []
for i in range(1, n):
    f = str(input("Enter first name: "))
    l = str(input("Enter last name: "))
    n = str(input("Enter number of twitter followers in millions: "))
    s = (f, l, n)
    PEOPLE.append(s)
# Function definition
def format_sort_records(l):
    for i in l:
        print(i[1], " ", i[0], " ", "{:.2f}".format(i[2]))
# Calling the function
PEOPLE = [('Donald', 'Trump', 7.85), ('Vladimir', 'Putin',
3.626), ('Narendra', 'Modi', 10.603)]
format_sort_records(PEOPLE)
# Problem 8
# Function definition
def passwrd_to_dict(f):
    f1 = open(f, "r")
    d = {}
    x = f1.readlines()
    for i in x:
        y = i.split(":")
        u = y[0]
        ID = y[2]
        d[u] = ID
    print(d)
# Calling the function
f = "passwd.txt"
passwrd_to_dict(f)
# Problem 9
# Function definition
d = {chr(i): i - 96 for i in range(97, 123) or 0}
d.update({chr(i): 0 for i in range(0, 97)})
d.update({chr(i): 0 for i in range(123, 256)})
DICT_WORDS = ["cat", "bat", "act", "tap", "pat", "rat", "tar",
"art", "zap", "ax", "fox", "box"]
def gematria_for(word):
    s = 0
    for i in word:
        s = s + d[i]
    return s
def gematria_equal_words(word):
    y = []
    for x in DICT_WORDS:
        if (gematria_for(word) == gematria_for(x)):
            y.append(x)
    return y
# Calling the function
word = str(input("Enter a single word: "))
print(gematria_for(word))
print(gematria_equal_words(word))
# Problem 10
# Function definition
def create_password_generator(s):
    def password_creator(n):
        pas = ''
        for i in range(0, n):
            pas = pas + random.choice(s)
        return pas
    return password_creator
# Calling the function
alpha_password = create_password_generator('abcdef')
symbol_password = create_password_generator('!@#$%')
print(alpha_password(5))
print(alpha_password(10))
print(symbol_password(5))
print(symbol_password(10))
# Problem 11
# Class definitions
class Circle: 
    def __init__(self, sequence, number):
        self.sequence = sequence
        self.number = number
class CircleIterator:
    def __init__(self, Circle):
        self.Circle = Circle
    def iterate(self):
        l = list(self.Circle.sequence)
        if (len(l) == 0):
            print(l)
        else:
            a = self.Circle.number//len(l)
            b = self.Circle.number%len(l)
            for i in range(0, a):
                for j in range(0, len(l)):
                    print(self.Circle.sequence[j], end = ' ')
            for i in range(0, b):
                print(self.Circle.sequence[i], end = ' ')
# Calling the function inside the classes
c = Circle("abc", 5)
ci = CircleIterator(c)
ci.iterate()
# Problem 12
# Class definitions
class Animal:
    def __init__(self, color, legs):
        self.color = color
        self.legs = int(legs)
class Cage:
    def __init__(self, animals=None):
        self.animals = animals or []
    def add_animals(self):
        n = int(input("Enter the number of animals to be added: "))
        for i in range(0, n):
            color = str(input("Enter color: "))
            leg = str(input("Enter no of legs: "))
            a = Animal(color, leg)
            self.animals.append(a)
class Zoo:
    def __init__(self, cages=None):
        self.cages = cages or []
    def add_cages(self):
        n = int(input("Enter the number of cages to be added: "))
        for i in range(0, n):
            cage = Cage()
            cage.add_animals()
            self.cages.append(cage)
    def color_filter(self, color):
        l = []
        for i in self.cages:
            for j in i.animals:
                if (j.color == color):
                    l.append(j)
        return l
    def legs_filter(self, legs):
        m = []
        for i in self.cages:
            for j in i.animals:
                if (j.legs == legs):
                    m.append(j)
        return m
    def total_legs(self):
        s = 0
        for i in self.cages:
            for j in i.animals:
                s = s + j.legs
        return s
# Problem 13
# Function definition
#Using Ramanujan's Formula to calculate pi with great accuracy.
def ramanujan_pi(n):
    pi = 0
    if n < math.pow(10, 6):
        if n == 0:
            return "3"
        else:
            for i in range(0, n):
                pi += math.factorial(4*i)*(1103.0 + 26390.0*i)/math.pow(math.factorial(i), 4)/math.pow(396.0, 4*i)
            pi *= 2.0*math.sqrt(2)/9801.0
            x = 1/pi
            y = round(x, n)
            z = str(y)
            return z
# Calling the function
n = int(input("Enter the number of decimal places to approximate pi: "))
print(ramanujan_pi(n))
# Problem 14
# Function definitions
def number_of_unique_char(s):
    c = 1
    for i in range(1, len(s)):
        if (s[i] not in s[0:i]):
            c += 1
    return c
def longest_substring(s):
    a = ''
    for i in range(len(s)):
        for j in range(i+1, len(s)+1):
           if (number_of_unique_char(s[i:j]) <= 2):
               if(len(s[i:j]) > len(a)):
                   a = s[i:j]
    return a
# Calling the functions
s = str(input("Enter string: "))
print(len(longest_substring(s)), longest_substring(s))
# Problem 15
# Input for Problem 15
y = int(input("Enter the number of elements in your list: "))
l = []
for i in range(y):
    z = int(input("Enter a number: "))
    l.append(z)
print(l)
# Function definition
def consecutive(l):
    l = sorted(list(set(l)))
    if (len(l) == 1):
        return l
    elif (l == []):
        return []
    else:
        m = []
        n = []
        for i in range(len(l)):
            for j in range(i + 1, len(l)):
                if(l[j] != l[j - 1] + 1):
                    break
                else:
                    if(l[j - 1] not in n):
                        n.append(l[j - 1])
                    if(l[j] not in n):
                        n.append(l[j])
            if(len(n) > len(m)):
                m = n[:]
            n = []
        if (m == []):
            return [l[0]]
        return m
# Calling the function
l = [100, 4, 200, 1, 3, 2]
print(consecutive(l))