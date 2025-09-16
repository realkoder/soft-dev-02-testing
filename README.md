# Software Dev - Testing - Notes & Misc 👩‍🔬

## Quality Management = Quality Assurance + Quality Control

**Quality Assurance (QA) - Proactive**

- Making sure that processes are undertaken correctly

**Quality Control (QC). Reactive**

- Making sure that the desired level of quality is achieved
    - _Testing_ - Enforcement of quality control by finding defects in a product

---

# Verification vs Validation

**Verification** - Checks that the work product meets the requirements

- Mostly a technical activity
- Verification ensures that we are building the product the right way

**Validation**

- Evaluates the work product against user needs
- Usually requires business knowledge
- Validation checks that we are building the right product

---

<br>

# Testing strategies

For _unit tests_ all values have to be hardcoded.

## Positive vs Negative Tests

- **Positive Tests:** Verify expected behavior with valid inputs (happy path).
- **Negative Tests:** Verify error handling and graceful degradation with invalid or unexpected inputs.

---

## Static Testing

Testing the code without it being executed.
Could be the IDE highlighting errors - looking at the code / reviewing the code / AI analyzing code.

---

<br>

## Unit Testing ⚖️

### Best Practices for Unit Testing ✅

![Best practices for unit testing](assets/1-best-practices-unit-testing.png)
![Best practices for unit testing](assets/2-best-practices-unit-testing.png)
![Best practices for unit testing](assets/3-best-practices-unit-testing.png)

---

### Anti-Patterns for Unit Testing 🛑

_(Check PP - **Unit Testing Best Practices and Anit-Patterns**)_

![Anti-Patterns unit testing](assets/1-anti-patterns-unit-testing.png)

---

## Detroit Approach

No mocking is allowed

![Detroit approach unit testing](assets/detroit-unit-test-approach.png)

## London Approach

Everything is mocked

![London approach unit testing](assets/london-unit-test-approach.png)

### Comparing Detroit with London

![Detroit vs London](assets/london-vs-detroit-unit-testing.png)

---

<br>

## Black Box vs White Box Testing

- **Black Box** (specification-based) - Based on the test basis

- **White Box** (structure-based) - Focused on the code or other structural elements
    - Experience-based

### Black Box Testing

**Based on specifications**

- _Requirements_
- _Architecture_
- _Technical_
- _Testing scope: what to do (specifications), not how to do it (internal design)_
- _They can be applied to all test levels_
    - Unit tests
    - Integration tests
    - System tests
    - Acceptance tests

#### Black-box Techniques

1. **Equivalence Partitioning**
    - Similar inputs can be grouped together(_positive integers_, _alphabetic characters_)
    - Any partition value can be used for testing (often a middle value)
    - Numbers: zero is a special case that may constitute a partition of its own
    - Input partitions
        - Based on input values

---

2. **Boundary Value Analysis**
    - Partitions have boundaries
    - Errors tend to cluster around boundaries
    - _Three point boundary value problem_ - _Three-point boundary value test_: lower bound, upper bound, and exact
      boundary value
    - Terms such as Lower boundary & Upper Boundary & Boundaries and their surroundings
    - Mostly based on:
        - _>vs >=_
        - _> <vs <=_
        - _> Loops. E.g.:_
            - for (i = 0; i < total; i++)
            - for (i = 1; i < total; i++)for (i = 0; i <= total; i++)
            - for (i = 1; i <= total; i++)
        - It works well in combination with equivalence partitioning

3-value boundary analysis

---

3. **Decision Table Testing**
    - Specifications often contain business rules to define the functions and conditions
    - Assessing the combination of these business rules can become complex
    - Assessment must be comprehensive

### Input form Example for Decision Table Design

An input form has two textboxes ("Username" and "Password"). Access to the homepage will be granted only if both fields
are correct. Represent the situation in a decision table.

#### Solution

|                  | R1 | R2 | R3 | R4 |
|------------------|----|----|----|----|
| **Conditions**   |    |    |    |    |
| Username correct | F  | T  | F  | T  |
| Password correct | F  | F  | T  | T  |
| **Actions**      |    |    |    |    |
| Go to homepage   | N  | N  | N  | Y  |

Reduced solution:

|                  | R1 | R2 | R3 |
|------------------|----|----|----|
| **Conditions**   |    |    |    |
| Username correct | F  | -  | T  |
| Password correct | -  | F  | T  |
| **Actions**      |    |    |    |
| Go to homepage   | N  | N  | Y  |

---

4. **State Transition Testing**

---

### White Box Testing

Most important is that white-box testing is focused on the code or other structural elements.

#### Statement coverage / test coverage / code coverage

- It focuses on covering all executable code statements

- Measure: percentage of executable lines of code tested

**Statement coverage is achieved when all executable statements—including conditionals, loops, and switches—are executed
at least once.**

```javascript
function higherNumber(numbers) {
    lethigher = -1;
    numbers.forEach(element => {
        if (element > higher) {
            higher = element;
        }
    });
    returnhigher;
}

/*Test cases for 100% statement coverage-#1. Values: [1] Any array with at least one number*/
```

---

#### Decision Coverage

- Also called **branch coverage**
- Every decision outcome (branch) must be tested at least once
- This means testing _else_ conditions with no associated code
- 100% decision coverage guarantees 100% statement coverage, but not the other way around

```javascript
function higherNumber(number1, number2, number3) {
    lethigher = number1;
    if (number2 > higher) {
        higher = number2;
        if (number3 > higher) {
            higher = number3;
        }
    }
    returnhigher;
}

/* 
Test cases for 100% decision coverage 
    - #1. Values: 1, 2, 3 (both ifs)        Path: a b
    - #2. Values: 1, 3, 2 (inner else)      Path: a c
    - #3. Values: 3, 1, 2 (outer else)      Path: d
*/
```

---

#### Statement vs Decision Coverage

Statement coverage ensures every statement runs at least once,
while decision coverage ensures every branch of conditionals (if/else) is tested.
For else if without else, statement coverage may pass even if some branches never execute,
but decision coverage will catch them.

---

<br>

## Doubles

A stand in for DB, Library, or similar type of third-part dependency.

`“A generic term for any case where you replace a production object for testing purposes”` (Martin Fowler)

- Fake objects that substitute other objects in the codebase
- They allow to•Test a unit in total isolation
- Substitute components not yet developed
- Speed up test execution© Pixabay at Pexels

---

## Mock

Outgoing interactions (e.g., an email service)

---

## Stub

Incoming interactions (e.g., an external API)

---

<br>

# Certifications

`International Software Testing Qualifications Board`

The _ISTQB_ is a global organization that offers standardized qualifications for software testers and QA professionals.

_Gemini's take on ISTQB_

```text
ISTQB certification, from the International Software Testing Qualifications Board,
is an internationally recognized credential for software testing and quality assurance (QA) professionals.
It validates knowledge and skills across different levels (Foundation, Advanced, Expert), specializations (Agile, AI, Security), and roles.
The certification is vendor-neutral and provides a strong foundation in testing principles,
practices, and terminology, which can enhance a professional's career profile and portability.
```

---

<br>

# Assets

**V-model**
![V-model](/assets/v-model.png)

---

<br>

# LINKS

[Difference between 'subject' and 'let'](https://stackoverflow.com/questions/38437162/whats-the-difference-between-rspecs-subject-and-let-when-should-they-be-used)

[Khorikov's site author of 'Unit Testing:Principles, Practices and Patterns'](https://khorikov.org/)

- [Here he's saying something about unmanaged dependencies and mocking](https://khorikov.org/posts/2021-12-06-unmanaged-dependencies-docker/)
