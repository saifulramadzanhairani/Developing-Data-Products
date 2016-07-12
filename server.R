library(shiny)
library(ggplot2)

#}
#total all income
Income <- function(ysalary,yei,yi, gd) {
  ysalary+yei+yi+gd
}
#total expences
Expences <-function(wife,de_univ,de_nonwork,son_a,son_b,dis,cdc,cr){
  wife <- (wife*5000)
  de_univ <- (de_univ*2800)
  de_nonwork <- (de_nonwork*2300)
  son_a <- (son_a*2200)
  son_b <- (son_b*1450)
  
  dis <- (dis*2400)
  cdc <- (cdc*2400)
  cr <- (cr*2300)
  
  10750 + wife + de_univ + de_nonwork + son_a + son_b + dis + cdc + cr  
  
}

Others <-function(epf) epf

TH <- function(th) th

Bal <- function(ysalary,yei,yi, gd,wife,de_univ,de_nonwork,son_a,son_b,dis,cdc,cr,epf,th) {
  inc <- ysalary+yei+yi+gd
  
  wife <- (wife*5000)
  de_univ <- (de_univ*2800)
  de_nonwork <- (de_nonwork*2300)
  son_a <- (son_a*2200)
  son_b <- (son_b*1450)
  
  dis <- (dis*2400)
  cdc <- (cdc*2400)
  cr <- (cr*2300)
  
  exp <- 10750 + wife + de_univ + de_nonwork + son_a + son_b + dis + cdc + cr  + epf + th
  #inc - exp
   (inc - exp) * 2.5 / 100
}





shinyServer(
        
        function(input, output) {
                #output$Weight <- renderPrint({input$Wt})
                output$Income <- renderPrint({Income(input$YSalary,input$YEI, input$YI, input$GD)})
                output$Expences <- renderPrint({Expences(input$WIFE,input$DE_univ,input$DE_nonwork,input$son_a,input$son_b, input$DIS, input$CDC, input$CR)})
                output$Others <- renderPrint({Others(input$EPF)})
                output$Tabung <- renderPrint({TH(input$THS)})
                output$Clean<- renderPrint({Bal(input$YSalary,input$YEI, input$YI, input$GD, input$WIFE,input$DE_univ,input$DE_nonwork,input$son_a,input$son_b, input$DIS, input$CDC, input$CR, input$EPF,input$THS)})
            
        }
)