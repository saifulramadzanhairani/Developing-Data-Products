library(shiny)
library(rsconnect)
 
shinyUI(shinyUI(fluidPage( theme = "bootstrap.css",

  titlePanel("Zakat Calculator (MY)"),

navbarPage(img(src="upm.jpeg",height = 20, width = 20),
                   
                   
        tabPanel("Calculator",
            sidebarPanel(
              helpText('This app calculates Zakat (Malaysia) based on your inputs.'),
                p(h4("Part A : Income")),
                numericInput('YSalary', 'Yearly Salary (RM)', min=0, step=100, 49068),
                numericInput('YEI', 'Yearly Extra Income (RM)', 0, min=0, step=100),
                numericInput('YI', 'Yearly Income (Al-Mustaghallat)', 0, min=0, step=10),
                numericInput('GD', 'Gift/ Donation (RM)', 0, min=0, step=10),
              HTML("<br>"),
                p(h4("Part B : Basic Expenses")),
                p(h6("B1 : Household Basic Expenses")),
              HTML("<br>"),
                p(h5("1. MySelf: RM10750")),
                numericInput('WIFE', '2. Wife (RM5000 per person)', 1, min=0, max=4, step=1),
                numericInput('DE_univ', '3. Dependent study at university (RM2800 per person)', 1, min=0, max=10, step=1),
                numericInput('DE_nonwork', '4. Non-working dependent (18+) (RM2300 per person)', 0, min=0, max=10, step=1),
                numericInput('son_a', '5. Child 7-17 years old (RM2200 per person)', 0, min=0, max=10, step=1),
                numericInput('son_b', '6. Child 0-6 years old (RM1450 per person)', 2, min=0, max=10, step=1),
              HTML("<br>"),
                p(h6("B2 : Another Had Kifayah")),
                numericInput('DIS', '1. Disable child (RM2400 per person)', 0, min=0, max=4, step=1),
                numericInput('CDC', '2. Chronic diseases child (RM2400 per person)', 0, min=0, max=10, step=1),
                numericInput('CR', '3. Child care (RM2300 per person)', 2, min=0, max=10, step=1),
                
              HTML("<br>"),
                p(h4("C : Other Deduction")),
                numericInput('EPF', '1. EPF contributions by employees under the age of 55 years (gross salary x 11 %)', 4464, min=0, step=100),
              HTML("<br>"),  
              p(h4("D : Tabung Haji")),
              numericInput('THS', '1. Tabung Haji Saving', 1000, min=0, step=100)
             
            ),
            mainPanel(
           
                        h4('Part A: Income'),
                        verbatimTextOutput('Income'),
              
                        h4('Part B: Basic Expences (B1+B2)'),
                        verbatimTextOutput('Expences'),
              
                        h4('Part C: Other Deduction'),
                        verbatimTextOutput('Others'),
                        
                        h4('Part D: Tabung Haji Saving'),
                        verbatimTextOutput('Tabung'),
                        
                        h4('Your Zakat (RM)'),
                        verbatimTextOutput('Clean'),
                        HTML("<br>"),
                        h4('Pay Zakat:'),
                        
                     
                        
                        a(img(src="ezakatpay.jpg",height = 80, width = 180), 
                          href = "https://secure.zakatsel.com.my/newdesign/e-zakatpay/bayarnow.asp")
                        
            )
        ), # end main page panel
        
          #tabPanel(p("Data x"),
                   
           #        mainPanel(
            #                    h4('Table'), 
             #                   dataTableOutput("dataTable")
                                
              #     ) # end mainPanel
                  
        #  ), # end tab 1
        tabPanel(p("Details of Income"),
                 mainPanel(
                   h4('Salary & Annual Wages'),
                   helpText('# Salary & Allowance & Bonus'),
                   helpText('# Reward , Gratuities and Profit ESOS (Employee Share Option Scheme)'),
                  
                   HTML("<br>"),
                   h4('Professional Service Annual Income'),
                   helpText('#Professional Consulting Services'),
                   HTML("<br>"),
                   h4('Royalties and Fees'),
                   helpText('# Seasonal Project Results'),
                   helpText('# Cash proceeds occasional'),
                    
                   HTML("<br>"),
                   h4('Al - Mustaghallat Annual Results : Net Result'),
                   
                   helpText('# Results Rental Land / Building / Transport / Transport'),
                   
                   helpText('# Agricultural income'), 
                   
                   
                    helpText('#Company and Livestock income') 
                   
                 )
        ), # end tab 2        
        
        
        
        
          tabPanel(p("About Zakat"),
                   mainPanel(
                     h2('What Is Zakat?'),
                     h4('Zakat is one of the five pillars of Islam and an act of worship. The meaning of Zakat is "to purify" and so to purify our own wealth all Muslims are obliged to pay a portion of ones assets to help those in need. Zakat benefits the giver as well as the receiver.'),
                     
                     
                     h2('Where do Zakat payments go?'),
                     h4('The Holy Quran tells us who may receive Zakat payments:'),
                       
                    h6('The poor, The destitute, Administrators/collectors of Zakat, New Muslims facing hardship, To free slaves, Those who are unable to pay their debt, In the path of Allah (swt), Travellers who cannot afford to return home')
                     
           )
           ), # end tab 2        
                        
        tabPanel(p("About Us"),
                 mainPanel(
                   h4('This is an App developed as a project for Data Science MOOC. This simple Shiny App is for calculating the Zakat Pendapatan.  
                      The outputs are amount that you need to pay. Simply enter the information required to get your zakat.'),
                   helpText("This Zakat Calculator make it quick and simple for you to work out, and pay, your Zakat.")
                   
                   )
                 ) # end tab 3     
))))