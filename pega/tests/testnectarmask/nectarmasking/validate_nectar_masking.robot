*** Settings ***
Documentation               This test is to validate Nectar card number masking
Library                     Selenium2Library
Library                     BuiltIn
Resource                    ../../resources/nectar_masking_source.robot
Resource                    ../../resources/browsers.robot
Variables                   ${CONFIG_PATH}




*** Test Cases ***

Validate Nectar Card Number Masking
    Login into csrinstore app
    Select View Open Complaints
#    select frame                        ${pega_xpath_selectpage1_frame}
#    wait until element is visible       ${pega_xpath_view_existing_refunds}
#    Capture Page ScreenShot
##    sleep                               1s
#    click element                       ${pega_xpath_view_existing_refunds}
#    sleep   2s
#    wait until element is visible       ${pega_xpath_select_refund_record}
#    Click element                       ${pega_xpath_select_refund_record}
#    sleep   3s
#    Unselect frame
#    Select frame                        ${pega_xpath_selectpage2_frame}
##    wait until element is visible       ${pega_xpath_cust_comment}
##    Input text                          ${pega_xpath_cust_comment}          ${cust_comment}
##    capture Page ScreenShot
##    wait until element is visible       ${pega_xpath_click_date_button}
##    sleep    3s
##    capture Page ScreenShot
##    Click element                       ${pega_xpath_click_date_button}
##    wait until element is visible       ${pega_xpath_select_date}
##    sleep   2s
##    Click link                          ${pega_xpath_select_date}
##    sleep   2s
##    capture Page ScreenShot
##    wait until element is visible       ${pega_xpath_suppliersode}
##    input text                          ${pega_xpath_suppliersode}      ${suppliersode_value}
##    wait until element is visible       ${pega_xpath_click_edit}
#    Click element                       ${pega_xpath_click_edit}
#    capture Page ScreenShot
#    Unselect frame
#    sleep   5s
#    Select Frame                        //iframe[contains(@name,'PegaGadget')]
##    select frame                        ${pega_xpath_selectpage3_frame}
##    Current Frame Should Contain        Name & Post Code
#
#    sleep   8s
#    Wait Until Element is Visible       ${pega_xpath_select_customer_search}
#    Click Element                       ${pega_xpath_select_customer_search}
#    wait until element is visible       ${pega_xpath_select_opt2}
#    click element                       ${pega_xpath_select_opt2}
#    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
#    Wait Until Element is visible       ${xpath_cust_last_name}
#    input text     ${xpath_cust_last_name}     ${cust_last_name}
#    capture page screenshot
#    input text     ${xpath_cust_post_code}     ${cust_post_code}
#    capture page screenshot
#    wait until element is visible       ${xpath_click_cust_search}
#    click element                       ${xpath_click_cust_search}
#    sleep   10s
#
#    capture page screenshot
#
#
##    wait until element is enabled  //*[contains(text(), 'Matching Customers')]        20s
##
##    ${count}  get element count  //*[@id="PEGA_GRID_CONTENT"]
##    should be equal as integers   ${count}   2
##    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
##    ${dict}  get table cell  //*[@id="gridLayoutTable"]  1   1
##    capture page screenshot
    Unselect frame
    wait until page contains element     ${pega_xpath_mainpage}
    Click element   ${pega_xpath_mainpage}
    sleep  2s
    capture page screenshot