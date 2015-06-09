library(shiny);
library(ggplot2);
library(dichromat);


shinyUI(fluidPage(
    fluidRow(div(style="padding-left:20px;",
        h1("Audit Risk Score")
    )),

    fluidRow(
        column(3, div(style="background-color:#87CEFA; border: solid 1px lightgray; border-radius:10px; padding:20px; margin-bottom:15px; margin-top:0px;",
            dateInput("FundedDate", "Funded Date:"),
            numericInput(inputId="LoanAmt",label="Loan Amount:", value=20000, min=0, max=100000, step=250),
            numericInput(inputId="Wholesale",label="Wholesale Value:", value=16000, min=0, max=100000, step=250),
            checkboxGroupInput("Profile", "Vehicle Profile:",
                c(
                    "1) Used"=1, 
                    "2) Vehicle Age > 5"=2,
                    "3) Mileage > 100,000"=3)
                )),
            submitButton('Submit')
        ),
        column(3,div(style="background-color:white; border: solid 1px lightgray; border-radius:10px; padding:5px 15px 5px 15px;",
            h4('Funded Date:'),
                verbatimTextOutput("odate"),
            h4('Loan Amount:'),
                verbatimTextOutput("oid1"),
            h4('Wholesale Value:'),
                verbatimTextOutput("oid2"),
            h4('Vehicle Profile:'),
                verbatimTextOutput("oid3"),
            h4('Audit Risk Score:'),
                verbatimTextOutput("RiskScore")
        ))
    ),

    
    fluidRow(div(style="padding-left:15px; padding-top: 15px;",
        h4('Documentation'),
        h5('The purpose of this model is to calculate a score ranging from 500-900 
            that assesses a loan applicant\'s risk; higher scores indicate increased 
            levels of risk.  The score takes into account the loan amount and 
            wholesale value of the vehicle as well as its general condition.'),
        h5('-'),
        h5('Notes:'),
        h5('1) Model inputs are located in the light blue shaded area above on 
            the left.'),
        h5('2) Model outputs are located in the unshaded are above on the right.'),
        h5('-'),
        h5('Instructions:'),
        h5('1) Enter the date the loan was funded.'),
        h5('2) Enter the amount of the loan.'),
        h5('3) Enter the wholesale amount of the vehicle.'),
        h5('4) Select all of the applicable vehicle profile attributes.'),
        h5('5) Select the "Submit" button.'),
        h5('6) The score will update at the bottom of the output area under the 
            heading "Audit Risk Score."')
        )
    ))

)


