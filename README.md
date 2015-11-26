# test-kitchen-environment-variable

# Purpose

Test how test kitchen use environment variable.

## recipe default value

```
kitchen converge
```

### result

```
Recipe: test-kitchen-environemt-variable::default
  * log[variable is [recipe default value]] action write
```

## .kitchen.erubytest.yml file

.kitchen.yml and .kitchen.erubytest.yml is almost same.

Only one difference is set variable in .kitchen.erubytest.yml

```diff
--- .kitchen.yml	2015-11-26 13:30:33.810372169 +0900
+++ .kitchen.erubytest.yml	2015-11-26 13:24:02.944433969 +0900
@@ -15,3 +15,7 @@
   - name: default
     run_list:
       - recipe[test-kitchen-environemt-variable]
+    attributes:
+      test_kitchen_environemt_variable:
+        #
+        sourcecode: <%= ENV['FOO'] || "kitchen local yaml default value" %>
```

### Use .kitchen.erubytest.yml default value

```
KITCHEN_YAML=.kitchen.erubytest.yml kitchen converge
```

### result

```
Recipe: test-kitchen-environemt-variable::default
  * log[variable is [kitchen local yaml default value]] action write
```

### Use environment value

```
FOO=foobar KITCHEN_YAML=.kitchen.erubytest.yml kitchen converge
```

### result

```
Recipe: test-kitchen-environemt-variable::default
  * log[variable is [foobar]] action write
```
