
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Log Normal Distribution"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      HTML("Skewed distributions can mess with clustering algorithms such as k-means clustering.  A lognormal distribution can help correct for both the size of the data and it's skew.  In this app you will attempt to convert a skewed distribution showed at right to the standard normal distribution."),
      sliderInput("bins",
                  "Number of bins:",
                  min = 1,
                  max = 50,
                  value = 25),
      HTML("<strong>Note: the following 2 controls affect the x-axis of the last plot</strong>"),
      sliderInput("lmean",
                  "Mean of Log Normal:",
                  min = 0,
                  max = 10,
                  step = 0.5,
                  value = 5),
      sliderInput("lsd",
                  "Standard Deviation of Log Normal:",
                  min = 0,
                  max = 5,
                  step = 0.25,
                  value = 2.5)
    ),

    # Show a plot of the generated distribution
    mainPanel(
      HTML("The following plot is the original data set that follows a log normal distribution with a long right tail."),
      plotOutput("original"),
      HTML("In a clustering algorithm such as k-means normalizing the data prior to clustering is generally desired to prevent bias to certain features.  For data sets such that follow a skewed distribution such as the log normal distribution above the overall data set is normalized, but outliers will still have a larger influence on the resulting distance calculation."),
      plotOutput("normalized"),
      HTML("Taking the log of the data prior to normalization can correct for both the size and the skew of the data set.  Adjust the mean and standard deviation sliders above until the distribution below matches a standard normal distribution."),
      plotOutput("lognormalized")
    )
  )
))
