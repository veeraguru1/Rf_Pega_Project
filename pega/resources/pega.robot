*** Settings ***
Variables                   ../config/__init__.py


*** Variables ***
##webvariables

${pega_login_url}                                ${SETTINGS['pega_url']}
${pega_login_uid}                                ${SETTINGS['pega_uid']}
${pega_login_pwd}                                ${SETTINGS['pega_pwd']}
${wait_for_button_timeout}                          3s

${pega_xpath_uid}                               //*[@id="txtUserID"]
${pega_xpath_pwd}                               //*[@id="txtPassword"]
${pega_xpath_clicksubmitbtn}                    //*[@id="sub"]
${pega_xpath_mainpage}                         //*[@id="RULE_KEY"]/div[1]/div/div/div[1]/div/div/div/div/div[1]/div/div/span/i/img


${xpath_click_add_service}          //*[contains(@data-click,'Interaction-Call')]

${pega_xpath_clickcreateinteraction}                    //*[@id="RULE_KEY"]/div[1]/div/div/div[1]/div/div/div/div/div[3]/div/div/span/a
${pega_xpath_selectcreateinteraction}                    //*[@id="RULE_KEY"]/div[1]/div/div/div[1]/div/div/div/div/div[3]/div/div/span/a/div
${pega_xpath_click_selectcreateinteraction}             //*[@id="RULE_KEY"]/div[1]/div/div/div[1]/div/div/span/a
${pega_xpath_click_searchlastname}                      //input[#'SearchLastName']
${pega_xpath_click_searchfirstname}                     //input[#'SearchFirstName']
${pega_xpath_click_searchpostcode}                      //input[#'SearchPostCode']

# Variable for Identify Customer

${xpath_cust_layout}                                    //*[@id="RULE_KEY"]/div/div/div/div[2]/div[2]/div/div[1]/div/fieldset/div

${cust_last_name}                                       george
${cust_post_code}                                       CV2 2SJ

${xpath_cust_last_name}                                  //*[@id="SearchLastName"]
#${xpath_cust_last_name}                                  //*[contains(@id,'SearchLastName')]
${xpath_cust_post_code}                                 //*[@id="SearchPostCode"]


${xpath_click_cust_search}                      //*[@id="CT"]/div/div/div/div/div[2]/div/div/span/button/div/div/div/div

${xpath_cust_results}                           //*[@id="$PD_SearchCustomer_pa7724315413590859pz$ppxResults$l1"]/td[9]/div/span/button/div/div/div/div
*** Keywords ***

Login into Pega

         [Documentation]                 PegaWeb
         [Tags]

        go to                                ${pega_login_url}
        capture page screenshot
        wait until element is visible       ${pega_xpath_uid}           ${wait_for_button_timeout}
        input text                           ${pega_xpath_uid}      ${pega_login_uid}
        capture page screenshot
        wait until element is visible       ${pega_xpath_pwd}           ${wait_for_button_timeout}
        input password                          ${pega_xpath_pwd}      ${pega_login_pwd}
#        capture page screenshot
        click button                        ${pega_xpath_clicksubmitbtn}
        wait until page contains element     ${pega_xpath_mainpage}
        capture page screenshot

Get Customer Info
         [Documentation]                 Get Customer Information
         [Tags]

#         click element  //*[contains(text(), 'ICL-')]
         select frame  //*[@id="PegaGadget1Ifr"]
#         wait until element is visible          //*[@id="RULE_KEY"]/div/div/div  ${wait_for_button_timeout}
         capture page screenshot
#         wait until element is visible       ${xpath_cust_last_name}           ${wait_for_button_timeout}
         input text     ${xpath_cust_last_name}     ${cust_last_name}

         capture page screenshot
#         wait until element is visible       ${xpath_cust_post_code}           ${wait_for_button_timeout}
         capture page screenshot
         input text     ${xpath_cust_post_code}     ${cust_post_code}
         click element  ${xpath_click_cust_search}
         wait until element is enabled  //*[contains(text(), 'Matching Customers')]        20s
         #${dict} =   Create Dictionary
         ${count}  get element count  //*[@id="PEGA_GRID_CONTENT"]
         should be equal as integers   ${count}   2
         Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
         ${dict}  get table cell  //*[@id="gridLayoutTable"]  1   1

         capture page screenshot







