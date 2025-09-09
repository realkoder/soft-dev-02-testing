### Airline discount policy

An airline offers only flights to India and Asia. Under special conditions, a discount is offered on the normal airfare:

- Passengers older than 18 with destinations in India are offered a discount of 20%, as long as the departure is not on
  a Monday or Friday
- For destinations outside of India, passengers are offered a discount of 25%, if the departure is not on a Monday or
  Friday
- Passengers who stay at least 6 days at their destination receive an additional discount of 10%
- Passengers older than 2 but younger than 18 years are offered a discount of 40% for all destinations
- Children 2 and under travel for free

Apply black-box test design:

1. Represent this information in a decision table.
2. Write the corresponding unit tests (one test case per business rule) using the programming language and unit test
   framework of your choice

<sub>Adapted from
FlexRule, ["Preparing a decision table"](https://resource.flexrule.com/knowledge-base/preparing-a-decision-table/)</sub>

# Solution

## 1. Decision Table

| **Airline Discount**            | R1 | R2 | R3 | R4 | R5 | R6 | R7 | R8 | R9 |
|---------------------------------|----|----|----|----|----|----|----|----|----|
| **Conditions**                  |    |    |    |    |    |    |    |    |    |
| _Age < 2_                       | T  | F  | F  | F  | F  | F  | F  | F  | F  |
| _Age > 2 && Age < 18_           | F  | T  | T  | F  | F  | F  | F  | F  | F  |
| _Age > 18_                      | F  | F  | F  | T  | T  | T  | T  | T  | T  |
| _Destination == India_          | /  | /  | /  | T  | T  | T  | F  | F  | F  |
| _Departure != Monday or Friday_ | /  | /  | /  | F  | T  | T  | T  | T  | F  |
| _Stay >= 6_                     | /  | F  | T  | F  | F  | T  | F  | T  | F  |
| **Actions**                     |
| _Extra discount of 10 %_        | N  | N  | Y  | N  | N  | Y  | N  | Y  | N  |
| _Discount of 20 %_              | N  | N  | N  | N  | Y  | Y  | N  | N  | N  |
| _Discount of 25 %_              | N  | N  | N  | N  | N  | N  | Y  | Y  | N  |
| _Discount of 40 %_              | N  | Y  | Y  | N  | N  | N  | N  | N  | N  |
| _Free 100 %_                    | Y  | N  | N  | N  | N  | N  | N  | N  | N  |

