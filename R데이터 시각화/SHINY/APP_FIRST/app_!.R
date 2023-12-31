#웹앱 프로그램 구조----------------------------------------------
#- Front-End (UI) + Back-End (Server)
#- 앱 실행 코드
#----------------------------------------------------------------
#Front-End (UI) 처리 함수 구현 ----------------------------------
#웹페이지 구성 => 입력 & 출력 요소
ui <- fluidPage(
  #화면에 글자 보여주는 UI Widget
  #함수의 첫번째 매개변수는 output 객체의 속성, id
  textOutput("msg"), #id=msg
  textOutput("value"),
  verbatimTextOutput("code"),
  imageOutput("img1"),
  plotOutput("plot1", width = "400px"),
  tableOutput("static"),         # 정적 테이블
  dataTableOutput("dynamic"),     # 동적 테이블
  textInput("comment", "COMMENT", "input your message"),
  verbatimTextOutput("msg2"),
  numericInput("obs", "Observations:", 10, min = 1, max = 100),
  verbatimTextOutput("value")
  
)


#Back-End (Server) 기능 함수 구현 -------------------------------
#사용자의 요청에 해당하는 페이지 생성
#웹 페이지 출력 내용 생성
#-input: Front-End에서 입력한 데이터 저장 객체
#-output: Front-End로 보낼 데이터 저장 객체
server <- function(input, output, session){
  #화면에 출력할 내용 => output 객체 매개변수에 지정
  output$msg<-renderText("Good Luck 2023")
  output$value<-renderText("123456")
  #콘솔창에 출력 => renderPrint
  output$code<-renderPrint(summary(1:5))
  output$static <- renderTable(head(mtcars))
  output$dynamic <- renderDataTable(mtcars, options = list(pageLength = 5))
  #uput$msg2<- renderText({input$comment})
 output$value <- renderText({(input$obs)})
  
  output$plot1 = renderPlot(
    {
      cars2<-cars+rnorm(nrow(cars))
      plot(cars2, col='blue', pch=20)
    }
  )
  filename<-normalizePath(file.path('C:\\Users\\USER\\Documents\\R\\R데이터 시각화\\SHINY\\APP_FIRST\\image', 'dog.jpg'))
  output$img1<-renderImage(
    {
      list(src=filename,
           contentType='image/png',
           alt="This is alternate text")
    },deleteFile=FALSE
  )
}


  
  #Shiny Web App 실행----------------------------------------------
#-실행 앱의 Front-End, Back-End 지정
shinyApp(ui=ui,server=server)


# UI (User Interface) => 위젯



#웹앱 프로그램 구조----------------------------------------------
#- Front-End (UI) + Back-End (Server)
#- 앱 실행 코드
#----------------------------------------------------------------
#Front-End (UI) 처리 함수 구현 ----------------------------------
#웹페이지 구성 => 입력 & 출력 요소
ui2 <- fluidPage(
  #화면에 글자 보여주는 UI Widget
  #함수의 첫번째 매개변수는 output 객체의 속성, id
  textOutput("msg"), #id=msg
  textOutput("value"),
  verbatimTextOutput("code"),
  imageOutput("img1")
)

#Back-End (Server) 기능 함수 구현 -------------------------------
#사용자의 요청에 해당하는 페이지 생성
#웹 페이지 출력 내용 생성
#-input: Front-End에서 입력한 데이터 저장 객체
#-output: Front-End로 보낼 데이터 저장 객체
server2 <- function(input, output, session){
  #화면에 출력할 내용 => output 객체 매개변수에 지정
  output$msg<-renderText("Good Luck 2023")
  output$value<-renderText("123456")
  #콘솔창에 출력 => renderPrint
  output$code<-renderPrint(summary(1:5))
  filename<-normalizePath(file.path("C:\\Users\\USER\\Documents\\R\\R데이터 시각화\\SHINY\\APP_FIRST\\image\\dog.jpg"))
  output$img1<-renderImage(
    {
      list(src=filename,
           contentType='image/png',
           alt="This is alternate text")
    },deleteFile=FALSE
  )
}
#Shiny Web App 실행----------------------------------------------
#-실행 앱의 Front-End, Back-End 지정
shinyApp(ui=ui2, server=server2)

