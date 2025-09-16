# Coverage Calculation

## Algorithm

Define a minimum set of test cases for the following pseudocode to reach

1. 100% statement coverage
2. 100% decision coverage

```text
IF q <= 5 THEN
    x = 100
ELSE
    x = 50
ENDIF

IF r >= 22 THEN
    x = 500
    IF s < 13 THEN
        x = 200
    ENDIF
ENDIF
```

### Solution

**1. Test cases 100% statement coverage**

```text
#1. Values: q = 3, r = 25, s = 10 (all ifs)

#2. Values: q = 8, r = 25, s = 10 (first else, then all ifs)
```

**2. Test cases 100% decision coverage**

```text
#1. Values: q = 3, r = 25, s = 10 (all ifs)

#2. Values: q = 8, r = 20, s = 10 (first and second elses)

#3. Values: q = 8, r = 25, s = 15 (else – if - else)
```

---

<br>

## Grading

Define a minimum set of test cases for the following pseudocode to reach

1. 100% statement coverage
2. 100% decision coverage

```text
Program Grading
    StudentScore: integer
    Result: string
Begin
    Read StudentScore
    If StudentScore > 79
    Then Result = "Distinction"
    Else
        If StudentScore > 59
        Then Result = "Merit"
        Else
            If StudentScore > 39
            Then Result = "Pass"
            Else Result = "Fail"
            Endif
       Endif
    Endif
    Print ("Your result is", Result)
End
```

**1. Test cases 100% statement coverage**

```text
#1. Studentscore = 80 true
#2. Studentscore = 79 false true
#3. Studentscore = 58 false false true
#4. Studentscore = 39 false false false
```

**2. Test cases 100% decision coverage**

Same as statement coverage, because every if has an else.

---

<br>

## Interest

Define a minimum set of test cases for the following pseudocode to reach

1. 100% statement coverage
1. 100% decision coverage

```text
 1 Program BestInterest
 2 Interest, BaseRate, Balance: Real
 3
 4 Begin
 5 BaseRate = 0.035
 6 Interest = BaseRate
 7
 8 Read (Balance)
 9 If Balance > 1000
10 Then
11     Interest = Interest + 0.005
12     If Balance < 10000
13     Then
14            Interest = Interest + 0.005
15     Else
16            Interest = Interest + 0.01
17     Endif
18 Endif
19
20 Balance = Balance × (1 + Interest)
21
22 End
```

**1. Test cases 100% statement coverage**

```text
#1. Balance = 10_001 - true true
#2. Balance = 1_001 - true false
```

**2. Test cases 100% decision coverage**

```text
#1. Balance = 101 - false
#2. Balance = 1_001 - true false
#3. Balance = 10_001 - true true
```

---

<br>

# Number

Define a minimum set of test cases for the following pseudocode to reach

1. 100% statement coverage
2. 100% decision coverage

```text
lContinue = true;

while(lContinue)
  Write "Enter number: ";
  Read nNumber;
  
  if(nNumber = 0) 
    lContinue = false;
  else 
    Write "Choose an option: ";
    Write "0. Quit";
    Write "1. Check if even or odd";
    Write "2. Check if prime";
    Read nOption;

    if(nOption = 0)
      lContinue = false;
    else
      if(nOption = 1)
        if(nNumber MOD 2 = 0)
          Write "Even";
        else
          Write "Odd";
      else
        if(nOption = 2)
          if(IsPrime(nNumber))
            Write "Prime";
          else
            Write "Not prime";
Write "Goodbye";
```

**1. Test cases 100% statement coverage**

```text
#1. nNumber = 1, nOption = 1 | false, false, true, false
#2. nNumber = 2, nOption = 1 | false, false, true, true
#3. nNumber = 2, nOption = 2 | false, false, false, true, true
#4. nNumber = 10, nOption = 2 | false, false, false, true, false
#5. nNumber = 0, nOption = 0 | true
```

**2. Test cases 100% decision coverage**

```text
#1. nNumber = 1, nOption = 1 | false, false, true, false
#2. nNumber = 2, nOption = 1 | false, false, true, true
#3. nNumber = 2, nOption = 2 | false, false, false, true, true
#4. nNumber = 10, nOption = 2 | false, false, false, true, false
#5. nNumber = 1, nOption = 3 | false, false, false, false
#6. nNumber = 0, nOption = 0 | true
```

---

<br>

## Employees

Define a minimum set of test cases for the following pseudocode to reach

1. 100% statement coverage
2. 100% decision coverage

```text
NumEmployees = 0

Write "Insert country code"
Read CountryCode

Open employees file
If not error
    While not eof
        Read file line
        If employee's country code = CountryCode
            Write "Name: " + employee's name
            NumEmployees++
        Endif
    Endwhile
    Close employees file
    Write "Total employees: " + NumEmployees
Else
    Write "Error opening the file"
Endif
```

**1. Test cases 100% statement coverage**

```text
#1. CountryCode = 1, file does not exist error raised                       | false
#2. CountryCode equal with an employees, file exists with employees         | true - true
```

**2. Test cases 100% decision coverage**

```text
#1. CountryCode = 1, file does not exist error raised                                   | false
#2. CountryCode equal with an employees.., file exists with employees                   | true - true
#2. CountryCode IS NOT equal with an employees.., file exists with employees            | true - false
```
