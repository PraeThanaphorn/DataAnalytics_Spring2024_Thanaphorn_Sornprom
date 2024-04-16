data("cars")
str(cars)
plot(speed ~ dist, data = cars)

help("lowess")
lowess(cars$speed ~ cars$dist)
lines(lowess(cars$speed ~ cars$dist, f = 2/3), col="blue")

# Change the "f" value and observe the shape of the line.
# lines(lowess(cars$speed ~ cars$dist, f=0.75), col="gray")  # f = 0.75
lines(lowess(cars$speed ~ cars$dist, f=0.8), col="red")  # f = 0.8
lines(lowess(cars$speed ~ cars$dist, f=0.9), col="green")  # f = 0.9
lines(lowess(cars$speed ~ cars$dist, f=0.1), col= 5)  # f = 0.1
lines(lowess(cars$speed ~ cars$dist, f=0.01), col= 6)  # f = 0.01 
# Observe that, when we try to have a very lower values for "f", in this example, it will 
#try to overfit points

