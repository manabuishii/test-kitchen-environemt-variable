# test-kitchen-environment-variable

# Purpose

Test how test kitchen use attributes value.

I want to select these situation.

1. recipe default (attributes) value.
2. .kitchen.yml value
3. environment value

# Conclusion

```
attributes:
  test_kitchen_environment_variable:
    sourcecode: <%= ENV['SOURCECODE'] || "test.tar.gz" %>
```

# Check



## Recipe default value and set value by .kitchen.yml

```
kitchen converge
```



***sourcecode*** default value is ***stable.tar.gz*** which is set by attributes/default.rb .

In this case

***sourcecode*** value is ***test.tar.gz*** which is set by .kitchen.yml .

***options*** default value is ***-O3 -lm*** which is only set by attributes/default.rb .

### Result

```
Recipe: test-kitchen-environment-variable::default
  * log[sourcecode is [test.tar.gz]] action write

  * log[options    is [-O3 -lm]] action write
```

## Use environment value

```
SOURCECODE=devel.tar.gz kitchen converge
```

***sourcecode*** value is ***test.tar.gz*** which is set by environment value SOURCECODE.

***options*** default value is ***-O3 -lm*** which is set by attributes/default.rb .

### Result

```
Recipe: test-kitchen-environment-variable::default
  * log[sourcecode is [devel.tar.gz]] action write

  * log[options    is [-O3 -lm]] action write
```

## if environment value is not set.

```
SOURCECODE= kitchen converge
```

### Result

```
Recipe: test-kitchen-environment-variable::default
  * log[sourcecode is [stable.tar.gz]] action write

  * log[options    is [-O3 -lm]] action write
```
