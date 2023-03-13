# Example XPath Expressions 

## Predicate filters

In [movieData.xml](movieData.xml), find all of the movies marked with the year 1930.

```
//movie[child::year = "1930"]
```


### Filtering by [contains(., "string")]  
When used in an expression to filter elements, this filters based on what literal text is found inside the current node.

In [stoker-dracula.xml](stoker-dracula.xml), find all of the paragraphs that contain the word "thousand".

```
//p[contains(., 'thousand')]
```

Single quotes or double quotes are fine to indicate a string. 

### Filtering by [matches(., "regex")]  
This is similar to `contains()`, but filters based on a regular expression

```
//p[matches(., '\d')]
```

