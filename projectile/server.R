library(shiny)

shinyServer(function(input, output) {
  output$trajplot <- renderPlot({
    g <- 9.81
    x0 <- 0
    y0 <- input$height
    s0 <- input$speed
    a0 <- input$angle
    vx0 <- s0*cos(a0/180*pi)
    vy0 <- s0*sin(a0/180*pi)

    # time until hit ground
    t <- (sqrt(vy0^2 + 2*g*y0) + vy0) / g

    # computes the trajectory
    T <- seq(0, t, length.out=300)
    X <- vx0 * T
    Y <- -0.5*g*T^2 + vy0*T + y0

    if(input$xmax >  input$xmin & input$ymax>input$ymin) {
      plot(X, Y, type="l", xlab="distance (m)", ylab="height (m)", xlim=c(input$xmin,input$xmax), ylim=c(input$ymin,input$ymax))
      text(x0, y0, "start", col="red")
    }
  })
})
