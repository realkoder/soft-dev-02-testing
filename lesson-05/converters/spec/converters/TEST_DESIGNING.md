# Designing Tests for lesson-05

## Length Converter

**_Equivalence Partitions_**

|                 | Partition Types | Boundary Values   | Test case Values |
|-----------------|-----------------|-------------------|------------------|
| **CM / Inches** | Invalid         | -MAX DOUBLE - 0   | -50              |
|                 | Valid           | 0.01 - MAX DOUBLE | 500.50           |

**_3-value boundary value-based test cases_**

|                 | Partitions          | Boundary Values | Test case Values               |
|-----------------|---------------------|-----------------|--------------------------------|
| **CM / Inches** | -MAX DOUBLE - -0.01 | -MAX DOUBLE     | -MAX DOUBLE - -MAX DOUBLE+0.01 |
|                 | -MAX DOUBLE - -0.01 | -0.01           | -0.01 -0.02 0                  |
|                 | 0 - MAX DOUBLE      | 0               | -0.01 0 0.01                   |
|                 | 0 - MAX DOUBLE      | MAX DOUBLE      | MAX DOUBLE MAX DOUBLE-0.01     |

---

<br

## Temperature Converter

**_Equivalence Partitions_**

|       | Partition Types | Boundary Values        | Test case Values |
|-------|-----------------|------------------------|------------------|
| **C** | Invalid         | -MAX DOUBLE - -273.16  | -50              |
|       | Valid           | -273.15 - MAX DOUBLE   | 500.50           |
|       |                 |                        |                  |
| **K** | Invalid         | -MAX DOUBLE - -0.01    | -50              |
|       | Valid           | 0 - MAX DOUBLE         | 500.50           |
|       |                 |                        |                  |
| **F** | Invalid         | -MAX DOUBLE - -−459.68 | -800             |
|       | Valid           | -459.67 - MAX DOUBLE   | 500.50           |

**_3-value boundary value-based test cases_**

|       | Partitions            | Boundary Values | Test case Values               |
|-------|-----------------------|-----------------|--------------------------------|
| **C** | -MAX DOUBLE - -273.16 | -MAX DOUBLE     | -MAX DOUBLE - -MAX DOUBLE+0.01 |
|       | -MAX DOUBLE - -0.01   | -273.16         | -273.15 -273.16 −273.17        |
|       | -273.15 - MAX DOUBLE  | -273.15         | -273.14 -273.15 -273.16        |
|       | 0 - MAX DOUBLE        | MAX DOUBLE      | MAX DOUBLE MAX DOUBLE-0.01     |

---

<br>

## Grade

**_Equivalence Partitions_**

|       | Partition Types | Boundary Values        | Test case Values |
|-------|-----------------|------------------------|------------------|
| **C** | Invalid         | -MAX DOUBLE - -273.16  | -50              |
|       | Valid           | -273.15 - MAX DOUBLE   | 500.50           |
|       |                 |                        |                  |
| **K** | Invalid         | -MAX DOUBLE - -0.01    | -50              |
|       | Valid           | 0 - MAX DOUBLE         | 500.50           |
|       |                 |                        |                  |
| **F** | Invalid         | -MAX DOUBLE - -−459.68 | -800             |
|       | Valid           | -459.67 - MAX DOUBLE   | 500.50           |

**_3-value boundary value-based test cases_**

|       | Partitions            | Boundary Values | Test case Values               |
|-------|-----------------------|-----------------|--------------------------------|
| **C** | -MAX DOUBLE - -273.16 | -MAX DOUBLE     | -MAX DOUBLE - -MAX DOUBLE+0.01 |
|       | -MAX DOUBLE - -0.01   | -273.16         | -273.15 -273.16 −273.17        |
|       | -273.15 - MAX DOUBLE  | -273.15         | -273.14 -273.15 -273.16        |
|       | 0 - MAX DOUBLE        | MAX DOUBLE      | MAX DOUBLE MAX DOUBLE-0.01     |

---

<br>


