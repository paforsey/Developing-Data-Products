library(shiny);

RiskScore <- function(LoanAmt, Wholesale, Profile){
    ScoreMin = 500
    ScoreMax = 900 - (3 * 25)
    LTVMin = 0
    LTVMax = 2.00
    
    LTV = LoanAmt / Wholesale
    Penalty = 25 * length(Profile)
    
    RiskScore = ((ScoreMax - ScoreMin) / (LTVMax - LTVMin) * LTV) + (ScoreMax - (LTVMax * ((ScoreMax - ScoreMin) / (LTVMax - LTVMin))))
    RiskScore =  round(RiskScore + Penalty, 0)
    if(RiskScore > 900){
        RiskScore = 900
    }
    RiskScore
    
};

shinyServer(
    function(input, output){
        output$oid1 <- renderPrint({input$LoanAmt})
        output$oid2 <- renderPrint({input$Wholesale})
        output$oid3 <- renderPrint({input$Profile})
        output$odate <- renderPrint({input$FundedDate})
        output$RiskScore <- renderPrint({RiskScore(input$LoanAmt, input$Wholesale, input$Profile)})
    }
);

