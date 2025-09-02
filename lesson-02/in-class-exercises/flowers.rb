# https://github.com/arturomorarioja-ek/SD_Testing_E25/blob/main/Lesson02/02%20EP%20Flowers.md

# A mail-order company selling flower seeds charges 30 kr for postage and
# packing on all orders up to and including 150 kr value and 40 kr for orders above 150 kr value and
# up to and including 300 kr value. For orders above 300 kr value there is no charge for postage and packing.

# If you were using equivalence partitioning to prepare test cases for the postage and packing charges:

# What valid input partitions might you use?
# What test case values could be inferred from said partitions?
# With the information provided, would there be any invalid partitions?


# valid input partitions
price >= 0.00 && price <= 150.00 # returns 30
price > 150.00 && price <= 300.00 # returns 40
price > 300.00 # returns 0

# invalid partitions
price <= -0.01