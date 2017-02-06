
library(cluster)  
library(shiny)
library(shinydashboard)
library(shinythemes)
library(plotly)
dashboardPage(skin=NULL,
              dashboardHeader(title="PDF Tags Finder",titleWidth=400),
              
              dashboardSidebar(width=250,
                               sidebarMenu(
                                 br(),
                                 menuItem(tags$em("Provide PDFs",style="font-size:150%"),icon=icon("upload"),tabName="data"),
                                 menuItem(tags$em("Summaries",style="font-size:150%"),icon=icon("bar-chart-o"),tabName="summary"),
                                 menuItem(tags$em("Dendrogram",style="font-size:150%"),icon=icon("tree"),tabName="Dendrogram"),
                                 menuItem(tags$em("Search and Filter",style="font-size:150%"),icon=icon("search"),tabName="search")
                                 
                                 
                                 
                               )
              ),
              
              dashboardBody(
                
                 
                
                tabItems(
                  tabItem(tabName="data",
                          
                          
                          br(),
                          br(),
                          tags$h4("This is a tool will help you to find ideal tag words for your documents. 
                                  You can upload one or more PDF files." ),
                          
                                              
                         
                          
                          tags$h4("Upload PDF documents (books, journals, surveys,etc.) from disk and/or provide links of PDF documents. 
                                  Then go to the", tags$span("Summaries",style="color:red"), tags$span("section in the sidebar to get summaries of the uploaded documents.
                                                                                                       We can search one or more terms and see their distribution across the uploaded documents in 
                                                                                                       the" , tags$span("Search and Filter",style="color:red"), tags$span("menu item. We can also filter to display words with certain frequency range only.
                                                                                                                                                                          Finally you can observe the"),tags$span("Dendrogram",style="color:red"), tags$span("tab in order to find interesting combination of words."))),
                          
                          
                          br(),
                          br(),
                          br(),
                          
                          column(width = 5,
                                 textInput("link", label = p("Provide link(s) to your PDF document(s) separated by comma",style="text-align:center;color:#990099;font-size:110%"),
                                           value = ""),
                                 
                                 br()
                          ),
                          
                          column(width = 3,
                                 
                                 tags$h3("And/Or", style="text-align:center;color:blue;font-size:120%"),
                                 br()
                                 
                          ),
                          column(width = 4,
                                 fileInput('file1', em('Choose PDF File',style="text-align:center;color:red;font-size:120%"),multiple = TRUE,
                                           accept=c('.pdf')),
                                 
                                 br()
                          )
                         
                        #A select input to choose the language for the stopwords function.
                        
                         # selectInput("language", "Language:",
                                     # c("Spanish" = "spanish",
                                      #  "German" = "german",
                                       # "English" = "english"))
                          
                          
                          ),
                  
                  
                  tabItem(tabName="summary",
                          fluidRow(
                            tabBox(width=12,
                                   tabPanel(tags$em("Word Cloud",style="font-size:150%"),
                                            
                                            column(width = 8,
                                                   plotOutput("wordcloud")),
                                            
                                            column(width = 4,
                                                   br(),
                                                   uiOutput("minfreq"),
                                                   br(),
                                                   uiOutput("maxwords"),
                                                   br(),
                                                   uiOutput("forEach"))
                                            
                                   ),
                                   
                                   
                                   tabPanel(tags$em("Plotly Bar graph",style="font-size:150%"),
                                            
                                            plotlyOutput("myplot",height = "700px"),
                                            br(),
                                            
                                            uiOutput("numwords")
                                            
                                   )
                                   
                                   
                                   
                                   
                                   
                            ))),
                  
                  
                  
                  
                  
                  tabItem(tabName="search",
                          
                          
                          
                          DT::dataTableOutput("DataTable"),
                          br(),
                          uiOutput("text"),
                          uiOutput('forsearch'),
                          uiOutput('searchbutton'),
                          plotlyOutput("searched",height = '600px')
                          
                          
                          
                          
                  ),
                  
                  tabItem(tabName="Dendrogram",style="font-size:150%",
                                   
                                   sliderInput("sparcity",
                                               "Maximum Sparcity",
                                               min = 0.01,
                                               max = 0.99,
                                               value = c(0.75),
                                               round=T),
                                   
                                   plotOutput("dendrogram",height = "600px")
                          
                                                       
                          )
                  
                  )
                
                ))
