library(shiny)
library(plotly)
library(tidyverse)
library(readr)

covidvaccine <- read_delim("data/project_data1.csv")

ui <- fluidPage(
  
    titlePanel("COVID-19 Vaccination Report in the United States by County"),
    tabsetPanel(
      tabPanel("About",
               mainPanel(
                 h1("COVID Vaccination Data Collection by States and County"),
                 p("COVID has been prevalent in the previous three years,
                   and many government authorities are encouraging residents to 
                   get vaccinated. Although many people believe getting vaccinated
                   is helpful for them, others prefer not to get their booster dose
                   after completing the COVID vaccination series. This data report
                   is aimed to find the relation between completing vaccination
                   series and receiving booster doses by state, age, and county.
                   The following description is to define each variable names used
                   in this set of data.\n"),
                 p("There are ", nrow(covidvaccine),"rows and ",
                   ncol(covidvaccine),"in this dataset"),
                 p("We are only going to use 8 to 24 columns here\n"),
                 dataTableOutput("sample")
                 
               )
      ),
      tabPanel("Plot",
            sidebarLayout(
              sidebarPanel(
                selectInput("plotstate", "Select State",
                            choices = covidvaccine$Recip_State),
                radioButtons("age", "Select Age Data (age+)",
                             choices = c("5-12" = "05", "12-18" = "12",
                                         "18-65" = "18", "65+" = "65")
                ),
                radioButtons("color","Select Color",
                             choices = c("#f90492","#f7d048","#098474",
                             "#505ba7","#927306","#6a5247"))
              ),
              mainPanel(
                textOutput("textcounty"),
                plotOutput("plotcounty")
              )
            )
      ),
      tabPanel("Table", 
            sidebarLayout(
              sidebarPanel(
                selectInput("State", "Select State",
                            choices = covidvaccine$Recip_State),
                checkboxGroupInput("Series", "Select Series Data",
                            choices = grep("Series_Complete_",
                            names(covidvaccine),value = TRUE)
                ),
                checkboxGroupInput("Booster", "Select Booster Data",
                             choices = grep("Booster_Doses",
                            names(covidvaccine),value = TRUE)
                )
              ),  
              mainPanel(
                textOutput("textstate"),
                dataTableOutput("covidvaccine")
                
              )
            )
          )
      )
)



server <- function(input, output) {
  tabs <- reactive({
    covidvaccine %>% 
      arrange(Recip_State,Recip_County) %>% 
      select(Date,Recip_State, Recip_County, input$Series,input$Booster) %>% 
      filter(Recip_State == input$State)
  })
  agecounty <- reactive({
    covidvaccine %>%
      filter(Recip_State == input$plotstate) %>%
      mutate(booster05 = Booster_Doses_5Plus - Booster_Doses_12Plus,
             booster12 = Booster_Doses_12Plus - Booster_Doses_18Plus,
             booster18 = Booster_Doses_18Plus- Booster_Doses_65Plus,
             booster65 = Booster_Doses_65Plus,
             series05 = Series_Complete_5Plus - Series_Complete_12Plus,
             series12 = Series_Complete_12Plus - Series_Complete_18Plus,
             series18 = Series_Complete_18Plus - Series_Complete_65Plus,
             series65 = Series_Complete_65Plus) %>%
      select(Recip_County, ends_with(input$age)) %>%
      drop_na()
  })
  output$sample <- renderDataTable({
    covidvaccine %>% 
      sample_n(10)
  })
  output$covidvaccine <- renderDataTable({
    tabs()
  })
  output$textstate <- renderText({
      paste("The state you selected contains:",nrow(tabs()),"entries.\n")
  })
  output$plotcounty <- renderPlot({
    agecounty() %>% 
      ggplot(aes(x = !!sym(paste0("series", input$age)), 
                 y = !!sym(paste0("booster", input$age)),
                 col = Recip_County)) +
      geom_point(col = input$color) +
      labs(title = "The Relation between Completing the Series Vaccination and Receiving Booster Doses by County",
           x = "Series Completed", y = "Booster Doses", col = "Each dot represent a county")
  })
  output$textcounty <- renderText({
    paste("The state you selected contains:",nrow(agecounty()),"counties.\n")
  })

}

shinyApp(ui = ui, server = server)
