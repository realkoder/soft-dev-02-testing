# https://github.com/arturomorarioja-ek/SD_Testing_E25/blob/main/Lesson02/01%20EP%20Bank%20account.md

# Suppose you have a bank account that offers variable interest rates: 0.5 per cent for the first 10000 kr credit
# 1 per cent for the next 10000 kr
# 1.5 per cent for the rest
# If you wanted to check that the bank was handling your account correctly: What input partitions might you use?
# What test case values could be inferred from said partitions?

# valid input partitions
credit <= 10000.00
credit > 10000.00 && credit <= 20000.00
credit > 20000.00

