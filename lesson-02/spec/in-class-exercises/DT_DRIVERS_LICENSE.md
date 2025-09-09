### Driver's license

The operator of the driver's license test support system enters the following information into the system, for a
candidate who is taking the exams for the first time:

- The number of points from the theoretical exam (integer number from 0 to 100)
- The number of errors made by the candidate during the practical exam (integer number 0 or greater)
  The candidate must take both exams. A candidate is granted a driver's license if they meet the following two
  conditions: they scored at least 85 points on the theoretical test and made no more than two errors on the practical
  test. If a candidate fails one of the exams, they must repeat this exam. In addition, if the candidate fails both
  exams, they are required to take additional hours of driving lessons.

Use black-box analysis to identify a comprehensive series of test cases:

1. Create the corresponding decision table
2. Write test cases based on the decision table
3. Identify the corresponding equivalence partitions
4. Use 3-value boundary value analysis to identify further test cases
5. Identify edge cases
6. List all test case values
7. Implement in code a function that receives as parameters the number of points for the theory exam and the number of
   errors for the practical exam and that returns a data structure with four boolean properties: whether the driver's
   license is granted, whether the theory exam must be repeated, whether the practical exam must be repeated, and
   whether additional driving lessons must be taken. Write the corresponding unit tests based on the above analysis. Use
   the programming language and unit test framework of your choice

<sub>Adapted from Stapp, Lucjan, Roman, Adam, and Michaël Pilaeten (2024). _ISTQB Certified Tester Foundation Level: A
Self-Study Guide Syllabus v4.0_. Springer.</sub>

# Solution

## 1. Decision table

| **Driver License**                | R1 | R2 | R3 | R4 |
|-----------------------------------|----|----|----|----|
| **Conditions**                    |    |    |    |    |
| _Theory ≥ 85_                     | F  | T  | F  | T  |
| _Practical errors ≤ 2_            | F  | F  | T  | T  |
| **Actions**                       |
| _Drivers license granted_         | N  | N  | N  | Y  |
| _Repeat on of the exams_          | N  | Y  | Y  | N  |
| _Take additional driving lessons_ | Y  | N  | N  | N  |

---

## 2. Test cases based on the decision table

1. ___it___ "requires additional driving lessons when theory and practical fails".
2. ___it___ "requires one more exam trial if practical failed but theory parsed".
3. ___it__ "requires one more exam trial if theory failed but practice parsed".
4. ___it___ "grants driving license when theory and practical parses".

| Test Case | Theory | Practical | Expected Result                                                      |
|-----------|--------|-----------|----------------------------------------------------------------------|
| TC1       | 90     | 0         | License: Yes, Repeat Theory: No, Repeat Practical: No, Lessons: No   |
| TC2       | 90     | 3         | License: No, Repeat Theory: No, Repeat Practical: Yes, Lessons: No   |
| TC3       | 80     | 2         | License: No, Repeat Theory: Yes, Repeat Practical: No, Lessons: No   |
| TC4       | 80     | 5         | License: No, Repeat Theory: Yes, Repeat Practical: Yes, Lessons: Yes |

---

## 3. Corresponding equivalence partitions

|                 |    Valid |         Invalid |
|-----------------|---------:|----------------:|
| **_Theory_**    | 85 - 100 |          0 - 84 |
| **_Practical_** |    0 - 2 | 3 - MAX INTEGER |

---

## 4. Use 3-value boundary value analysis to identify further test cases

| Value           | Partition types |    Partitions | Boundary values |   Test case values |
|-----------------|-----------------|--------------:|----------------:|-------------------:|
| **_Theory_**    | Invalid         |          0-84 |            0 84 |    0 1 42 83 84 85 |
|                 | Valid           |        85-100 |          85 100 | 84 85 86 92 99 100 |
|                 |                 |               |                 |                    |
| **_Practical_** | Invalid         | 3 MAX INTEGER |               3 |            3 4 400 |
|                 | Valid           |           0-2 |             0 2 |            0 1 2 3 |

---

## 5. Identify edge cases

Theory = 0 (minimum)

Theory = 100 (maximum)

Practical errors = 0 (minimum)

Practical errors = very high number

---

## 6. List all test case values

| Test Case | Theory | Practical | Expected Result                                                    |
|-----------|--------|-----------|--------------------------------------------------------------------|
| TC1       | 0      | 0         | License: No, Repeat Theory: Yes, Repeat Practical: No, Lessons: No |
| TC2       | 1      | 0         | License: No, Repeat Theory: Yes, Repeat Practical: No, Lessons: No |
| TC3       | 42     | 0         | License: No, Repeat Theory: Yes, Repeat Practical: No, Lessons: No |
| TC4       | 83     | 0         | License: No, Repeat Theory: Yes, Repeat Practical: No, Lessons: No |
| TC5       | 84     | 0         | License: No, Repeat Theory: Yes, Repeat Practical: No, Lessons: No |
| TC5       | 85     | 0         | License: Yes, Repeat Theory: No, Repeat Practical: No, Lessons: No |
| TC5       | 86     | 0         | License: Yes, Repeat Theory: No, Repeat Practical: No, Lessons: No |
| TC6       | 92     | 0         | License: Yes, Repeat Theory: No, Repeat Practical: No, Lessons: No |
| TC7       | 99     | 0         | License: Yes, Repeat Theory: No, Repeat Practical: No, Lessons: No |
| TC8       | 100    | 0         | License: Yes, Repeat Theory: No, Repeat Practical: No, Lessons: No |
| TC9       | 85     | 1         | License: Yes, Repeat Theory: No, Repeat Practical: No, Lessons: No |
| TC10      | 85     | 2         | License: Yes, Repeat Theory: No, Repeat Practical: No, Lessons: No |
| TC11      | 85     | 3         | License: No, Repeat Theory: No, Repeat Practical: Yes, Lessons: No |
| TC12      | 85     | 4         | License: No, Repeat Theory: No, Repeat Practical: Yes, Lessons: No |
| TC12      | 85     | 400       | License: No, Repeat Theory: No, Repeat Practical: Yes, Lessons: No |
| TC12      | 84     | 3         | License: No, Repeat Theory: No, Repeat Practical: No, Lessons: Yes |
| TC12      | 0      | 400       | License: No, Repeat Theory: No, Repeat Practical: No, Lessons: Yes |

---