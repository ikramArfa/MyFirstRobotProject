*** Settings ***
Library    SeleniumLibrary
Suite Setup    log    im in inside test suite setup
Suite Teardown    log    im in inside test suite teardown
Test Setup    log    im in inside test test setup
Test Teardown    log    im in inside test test teardown
Default Tags    sanity

*** Comments ***        
    Click Button    class=btn
    Set Browser Implicit Wait    5 : wait 5 seconde avant chaque etape
    @{CREDENTIALS}[0] 
    @{CREDENTIALS}[1]
*** Test Cases ***
MyFirstTestCase
    [Tags]    smoke
    Log    hello world...
    
MysecondTestCase
    Log    hello world...
    Set Tags    regression1
    Remove Tags    regression1
MythirdTestCase
    Log    hello world...

MyFirstSeleniumTest
    Open Browser    http://localhost:4200/prm/    chrome
    Set Browser Implicit Wait    10
    Input Text    class=form-control   buchelay
    sleep    5
    # Click Button    class=btn
    Press Keys    class=form-control    ENTER
    sleep    5
    Close Browser
    Log    test completed
    
SimpleLoginTest
    [Documentation]    this is a simple login test
    Open Browser    ${URL}    chrome
    Set Browser Implicit Wait    5
    LoginKw
    Click Element    id=welcome
    Click Element    link=Logout    
    Close Browser
    Log    test completed 
    Log    this test is executed by %{username} on %{os}         

*** Variables ***
${URL}    https://opensource-demo.orangehrmlive.com/
@{CREDENTIALS}    Admin    admin123
&{LOGINDATA}    username=Admin    password=admin123

*** Keywords ***
LoginKw
    Input Text    name=txtUsername    @{CREDENTIALS}[0]
    Input Text    name=txtPassword    &{LOGINDATA}[password]
    Click Button    name=Submit
















