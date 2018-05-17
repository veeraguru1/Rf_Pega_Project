*** Settings ***
Variables                   ../config/__init__.py


*** Variables ***
##webvariables
#
${pega_login_url}                                ${SETTINGS['pega_url']}
${pega_login_uid}                                ${SETTINGS['pega_uid']}
${pega_login_pwd}                                ${SETTINGS['pega_pwd']}
${wait_for_button_timeout}                          2s

${pega_xpath_mainpage}                          //*[@id="RULE_KEY"]/div/div/div/div[1]/div/div/div/div/div/div/div/span/i/img
#                                                //*[@id="RULE_KEY"]/div/div/div/div[1]/div/div/div/div/div/div/div/span/i/img
${pega_xpath_uid}                               //*[@id="txtUserID"]
${pega_xpath_pwd}                               //*[@id="txtPassword"]
${pega_xpath_clicksubmitbtn}                    //*[@id="sub"]
#${pega_xpath_mainpage}                          //*[@id="RULE_KEY"]/div/div/div/div[1]/div/div/div/div/div/div/div/span/i/img

${pega_xpath_selectpage1_frame}                 //*[@id="PegaGadget0Ifr"]
${pega_xpath_view_existing_refunds}             //*[@id="RULE_KEY"]/div[2]/div/div/div[3]/div/div/span/button/div/div/div/div
${pega_xpath_select_refund_record}              //*[@id="$PpgRepPgSubSectionInstoreRefundCasesListBB$ppxResults$l3"]

${pega_xpath_selectpage2_frame}                 //*[@id="PegaGadget1Ifr"]
${pega_xpath_cust_comment}                      //*[@id="CustomerComments"]
${cust_comment}                                 OK

${pega_xpath_click_date_button}                 //*[@id="$PpyWorkPage$pPurchaseDateSpan"]/span
${pega_xpath_select_date}                       //*[@id="controlCalBody"]/tr[2]/td[5]/a


${pega_xpath_suppliersode}                      //*[@id="SupplierCode"]
${suppliersode_value}                           1234

${pega_xpath_click_discard_button}               //*[@id="RULE_KEY"]/div[2]/div/div/div[5]/div/div/span/button/div/div/div/div

${pega_xpath_click_edit}                        //*[@id="RULE_KEY"]/div[2]/span[2]/nobr/span/a

${pega_xpath_selectpage3_frame}                 //*[@id="PegaGadget2Ifr"]
${pega_xpath_select_customer_search}            //*[@id="RULE_KEY"]/div[2]/div/div/div/div/div/div/div/span[2]/label
${pega_xpath_select_opt2}                       //*[@id="RULE_KEY"]/div[1]/div/div/div[3]/div[1]/h3


${xpath_cust_last_name}                         //*[@id="LastName"]
${cust_last_name}                               kumar


${xpath_cust_post_code}                         //*[@id="PostCode"]
${cust_post_code}                               CV2 2SJ

${xpath_click_cust_search}                       //*[@id="RULE_KEY"]/div[1]/div/div/div[3]/div[2]/div/div[3]/div/div/span/button/div/div/div/div





*** Keywords ***
Login into csrinstore app

         [Documentation]                 login into csrinstore app
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
#        sleep       ${wait_for_button_timeout}
#        capture page screenshot
