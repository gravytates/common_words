# 100 most common three words

> ruby program to return the 100 most common three word sequence of any given text file(s).

#### Recommended Requirements
- Ruby 2.4.1
- Ruby Gem 'test-unit'

#### Run from terminal with arguments or using STDIN
Clone this project, and navigate to the top level:
```bash
$ cd common_three_words
```
Using arguments:
```bash
$ ./common_three_words.rb example1.txt example2.txt
```

Alternatively, Using STDIN
```bash
$ cat origin-of-species.txt example2.txt | ./common_three_words.rb
```

Snippet of expected outcome:

```bash
320 - of the same, 
126 - the same species, 
125 - conditions of life, 
116 - in the same, 
107 - of natural selection, 
103 - from each other, 
98 - species of the, 
89 - on the other, 
81 - the other hand, 
...
```
#### Test from Terminal
Run test-unit scripts from the top level of the directory:
```bash
$ ./common_three_words_tests.rb
```

Example test outcome:

![Image of unit test result](/screenshots/test-example.png)