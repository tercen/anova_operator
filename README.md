# ANOVA

##### Description

The `anova` operator performs an analysis of variance of the data.

##### Usage

Input projection|.
---|---
`y-axis`| measurement value
`color` | represents the groups to compare
`labels`| optional, pairing/blocking factor for repeated measures
`row`   | optional, row stratification factor
`column`| optional, column stratification factor

Output relations|.
---|---
`Effect`| Effect
`DFn`| Degrees of Freedom in the numerator
`DFd`| Degrees of Freedom in the denominator
`F`| F-value
`p`| p-value
`significance`| Highlights p-values less than the traditional alpha level of .05
`ges`| Generalized Eta-Squared measure of effect size

##### Details

`anova` operator performs an analysis of variance of the data. The operator is based on the [anova R function](https://www.rdocumentation.org/packages/stats/versions/3.6.2/topics/anova).

##### References

See [Analysis of variance on Wikipedia](https://en.wikipedia.org/wiki/Analysis_of_variance).

##### See Also

[t-Test operator](https://github.com/tercen/t_test_operator)
