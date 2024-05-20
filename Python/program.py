# Set Variables and ask for user input
range = int(input("range: "))
mark = int(input("mark every: "))

# Loop
for num in range(range):
    # Increment num so it doesnt start with 0
    num += 1
    # Check if num hits mark
    if num % mark == 0:
        print(str(num), " <--")
    else
        print(num)
