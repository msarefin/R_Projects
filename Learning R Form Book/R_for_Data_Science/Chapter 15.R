# Chapter 15 - https://r4ds.hadley.nz/regexps.html


# Chapter15 - https://r4ds.hadley.nz/regexps.html#introduction


# Pattern Basics - https://r4ds.hadley.nz/regexps.html#introduction

# Most punctuation characters, like ., +, *, [, ], and ?, 
# have special meanings2 and are called metacharacters. 

str_view(fruit, "berry")
str_view(c("a", "ab", "ae", "bd", "ea", "eab"), "a.")
str_view(fruit, "a...e")

# ? makes a pattern optional (i.e. it matches 0 or 1 times)
# + lets a pattern repeat (i.e. it matches at least once)
# * lets a pattern be optional or repeat (i.e. it matches any number of times, including 0).

# ab? matches an "a", optionally followed by a "b".
str_view(c("a", "ab", "abb"), "ab?")

# ab+ matches an "a", followed by at least one "b".
str_view(c("a", "ab", "abb"), "ab+")

# ab* matches an "a", followed by any number of "b"s.
str_view(c("a", "ab", "abb"), "ab*")

# Character classes are defined by [] and let you match a set of characters, 
# e.g., [abcd] matches “a”, “b”, “c”, or “d”. You can also invert the match 
# by starting with ^: [^abcd] matches anything except “a”, “b”, “c”, or “d”. 

str_view(words, "[aeiou]x[aeiou]")
str_view(words, "[^aeiou]y[^aeiou]")


# You can use alternation, |, to pick between one or more alternative patterns.

str_view(fruit, "apple|melon|nut")
str_view(fruit, "aa|ee|ii|oo|uu")



# 15.3 Key functions - https://r4ds.hadley.nz/regexps.html#sec-stringr-regex-funs

str_detect(c("a","e","i","o","u"), "a|e|i|o|u")
str_detect(c("a","e","i","o","u","y"), "[aeiou]")
str_detect(c("a","e","i","o","u"), "[^aeiou]")

babynames |> 
  filter(str_detect(name, "x")) |> 
  count(name, wt = n, sort = TRUE)

babynames |> 
  group_by(year) |> 
  filter(str_detect(name, "x")) |> 
  summarise()

# str_detect - returns a logical vector indicating whether each string matches the pattern - returns TRUE or FALSE
# str_subset - returns the subset of strings that match the pattern - returns a character vector
# str_which - returns the indices of the strings that match the pattern - returns an integer vector

babynames |> 
  filter(str_detect(name, "x")) |>
  mutate(str_subset(name, "x"), str_which(name, "x"), .keep = "used")

# - 15.3.2 Count matches - https://r4ds.hadley.nz/regexps.html#count-matches

# str_count - counts the number of matches of the pattern in each string - returns an integer vector

babynames |> 
  filter(str_detect(name, "x")) |>
  mutate(count = str_count(name, "x")) |>
  count(name, wt = count, sort = TRUE)


babynames |>
  count(name) |>
  mutate(vowels = str_count(name, "[aeiou]"), consonants = str_count(name, "[^aeiou]")) 
# this will return incorrect number of vowels because str_count is case sensitive, therefore it "aeiou" does not match "AEIOU"
# There are 3 ways to resolve this 
# 1. Use str_count(name, "[aeiouAEIOU]") to count both lower and upper case vowels
# 2. Use str_to_lower(name) to convert the name to lower case before counting
# 3. Tell Regex to ignore case


# str_detect - returns a logical vector indicating whether each string matches the pattern - returns TRUE or FALSE
# str_subset - returns the subset of strings that match the pattern - returns a character vector
# str_which - returns the indices of the strings that match the pattern - returns an integer vector


babynames |> 
  filter(str_detect(name, "x")) |>
  mutate(str_subset(name, "x"), str_which(name, "x"), .keep = "used")

# - 15.3.2 Count matches - https://r4ds.hadley.nz/regexps.html#count-matches

# str_count - counts the number of matches of the pattern in each string - returns an integer vector

babynames |> 
  filter(str_detect(name, "x")) |>
  mutate(count = str_count(name, "x")) |>
  count(name, wt = count, sort = TRUE)


babynames |>
  count(name) |>
  mutate(vowels = str_count(name, "[aeiou]"), consonants = str_count(name, "[^aeiou]")) 
# this will return incorrect number of vowels because str_count is case sensitive, therefore it "aeiou" does not match "AEIOU"
# There are 3 ways to resolve this 
# 1. Use str_count(name, "[aeiouAEIOU]") to count both lower and upper case vowels
# 2. Use str_to_lower(name) to convert the name to lower case before counting
# 3. Tell Regex to ignore case

babynames |>
  count(name) |>
  mutate(vowels = str_count(name, "[aeiouAEIOU]"), consonants = str_count(name, "[^aeiouAEIOU]"))

babynames |>
  count(name) |>
  mutate(vowels = str_count(name, regex("[aeiou]", ignore_case = TRUE)), 
         consonants = str_count(name, regex("[^aeiou]", ignore_case = TRUE)))

babynames |>
  count(name) |>
  mutate(vowels = str_count(str_to_lower(name), "[aeiou]"), 
         consonants = str_count(str_to_lower(name), "[^aeiou]"))


babynames |> count(name) |> select(vowels = str_count(name, regex("[aeiou]", ignore_case = T)))


# - 15.3.4 Extract variables - https://r4ds.hadley.nz/regexps.html#sec-extract-variables

df <- tribble(
  ~str,
  "<Sheryl>-F_34",
  "<Kisha>-F_45", 
  "<Brandon>-N_33",
  "<Sharon>-F_38", 
  "<Penny>-F_58",
  "<Justin>-M_41", 
  "<Patricia>-F_84", 
)

df |> 
  separate_wider_regex(
    str,
    patterns = c(
      "<", 
      name = "[A-Za-z]+", 
      ">-", 
      gender = ".",
      "_",
      age = "[0-9]+"
    ), ignore_case = T
  )


df |> 
  separate_wider_regex(
    str,
    patterns = c(
      "<", 
      name = "[A-Za-z]+", 
      ">-", 
      gender = ".",
      "_",
      age = "[0-9]+"
    )
  )


df |> separate_wider_regex(
  str, 
  pattern = c(
    "<",
    name ="[a-zA-Z]+",
    ">-",
    gender = ".",
    "_", 
    age = "[0-9]+"
  )
)

