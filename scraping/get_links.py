import csv #for csv file to write data
from selenium import webdriver #web driver to open broswers such as chrome, firfox ..etc  using selenium
from webdriver_manager.chrome import ChromeDriverManager #here we use just chrome to work it
from selenium.webdriver.common.by import By #this we use it in new version of selenium 4 before that we use dirct method such as find_elements_by_tag_name now we use By.CLASS_NAME


browser = webdriver.Chrome(ChromeDriverManager().install()) #set a broswers drive in varible

browser.get("https://www.pathe.fr/en/movies-events") #to open target links 

posters = browser.find_elements(By.CLASS_NAME, "poster") #for select all elements have  poster class

for element in posters:
    tag_a = element.find_element(By.TAG_NAME, "a")  
    link = tag_a.get_attribute("href") 
    with open("movies.csv", "a", encoding="utf-8") as new_file:
        csv_writer = csv.writer(new_file)
        csv_writer.writerow([link])

browser.quit()
