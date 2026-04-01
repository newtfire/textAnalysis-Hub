# Uma Musume Pull Tracker

## About This Program
This Python program I made in my python 101 class and it tracks gacha pull results in Uma Musume. It calculates the percentage rates of SSR, SR, and R cards pulled during a banner.

## Features
- Tracks total pulls
- Calculates pull rates
- Displays results as percentages

## Python Code Example

```python
print("Welcome to Uma Musume pull tracker!")
print("Want to see your luck? Press Enter")

Trainername = input ("What is Your Trainer Name?")
print(Trainername)

Pulls = int(input("How many pulls did You do this banner?"))
print(Pulls)

SSR = int(input("How many SSR cards did you pull this banner?"))
print(SSR)

SR = int(input("How many SR cards did you pull this banner?"))
print(SR)

R = int(input("How many R cards did you pull this banner?"))
print(R)                

if Pulls == 0:
    SSRrate = 0
    SRrate = 0
    Rrate = 0
else:
    SSRrate = (SSR / Pulls) * 100
    SRrate = (SR / Pulls) * 100
    Rrate = (R / Pulls) * 100
    
print("SSR pull rate:", SSRrate, "%")
print("SR pull rate:", SRrate, "%")
print("R pull rate:", Rrate, "%")
print("These were your percentage odds of your pulls. Please compare with your friends!!!")

input("Press Enter to exit...")
