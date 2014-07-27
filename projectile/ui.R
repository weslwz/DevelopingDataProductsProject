library(shiny)

shinyUI(fluidPage(
  titlePanel("Projectile Trajectory"),
  sidebarLayout(
    sidebarPanel(
        "The following application plots a projectile's trajectory until it hits the ground",
        wellPanel(
          h4("Trajectory Control", style="color:blue"),
          numericInput("height", label = "Initial Height (m)", value = 30, min=0, step=0.1),
          numericInput("speed", label = "Initial Speed (m/s)", value = 30, min=0, step=0.1),
          sliderInput("angle", label = "Angle (deg)", value = 70, min = 0, max = 360, step=0.1)
        ),
        wellPanel(
          h4("Axis Control", style="color:blue"),
          fluidRow(
            column(4, numericInput("xmin", "x-min", value=0, min=0)),
            column(4, numericInput("xmax", "x-max", value=100))
          ),
          fluidRow(
            column(4, numericInput("ymin", "y-min", value=0)),
            column(4, numericInput("ymax", "y-max", value=100))
          )
        )
    ),


    mainPanel(plotOutput("trajplot"))
  )
))
