import csv #for csv file to write data
from selenium import webdriver #web driver to open broswers such as chrome, firfox ..etc  using selenium
from webdriver_manager.chrome import ChromeDriverManager #here we use just chrome to work it
from selenium.webdriver.common.by import By #this we use it in new version of selenium 4 before that we use dirct method such as find_elements_by_tag_name now we use By.CLASS_NAME
from selenium.webdriver.support import expected_conditions as EC


browser = webdriver.Chrome(ChromeDriverManager().install()) #set a broswers drive in varible

links = [
"https://www.pathe.fr/en/movies-events/venom-the-last-dance-38422"
,"https://www.pathe.fr/en/movies-events/l-amour-ouf"
,"https://www.pathe.fr/en/movies-events/monsieur-aznavour-35492"
,"https://www.pathe.fr/en/movies-events/jure-n-2-42498"
,"https://www.pathe.fr/en/movies-events/anora-38943"
,"https://www.pathe.fr/en/movies-events/le-robot-sauvage-37764"
,"https://www.pathe.fr/en/movies-events/the-substance-40005"
,"https://www.pathe.fr/en/movies-events/a-toute-allure-35334"
,"https://www.pathe.fr/en/movies-events/louise-violet-37065"
,"https://www.pathe.fr/en/movies-events/here-les-plus-belles-annees-de-notre-vie-42366"
,"https://www.pathe.fr/en/movies-events/croquette-le-chat-merveilleux-40221"
,"https://www.pathe.fr/en/movies-events/smile-2-40082"
,"https://www.pathe.fr/en/movies-events/le-lac-des-cygnes-39994"
,"https://www.pathe.fr/en/movies-events/transformers-le-commencement-13712"
,"https://www.pathe.fr/en/movies-events/flow-le-chat-qui-n-avait-plus-peur-de-l-eau-39044"
,"https://www.pathe.fr/en/movies-events/trois-amies-39058"
,"https://www.pathe.fr/en/events/ma-mini-seance-pat-et-mat-un-dernier-tour-de-vis-42585"
,"https://www.pathe.fr/en/movies-events/l-histoire-de-souleymane-38927"
,"https://www.pathe.fr/en/movies-events/4-zeros-38703"
,"https://www.pathe.fr/en/movies-events/le-comte-de-monte-cristo-20027"
,"https://www.pathe.fr/en/movies-events/challenger-37290"
,"https://www.pathe.fr/en/movies-events/angelo-dans-la-foret-mysterieuse-36935"
,"https://www.pathe.fr/en/movies-events/l-ombre-du-commandant-40145"
,"https://www.pathe.fr/en/movies-events/sur-un-fil-37938"
,"https://www.pathe.fr/en/movies-events/veer-zaara-42926"
,"https://www.pathe.fr/en/movies-events/moi-moche-et-mechant-4-19174"
,"https://www.pathe.fr/en/movies-events/vice-versa-2-19501"
,"https://www.pathe.fr/en/movies-events/amaran-version-tamoul-43009"
,"https://www.pathe.fr/en/movies-events/au-boulot-42368"
,"https://www.pathe.fr/en/movies-events/l-affaire-nevenka-40409"
,"https://www.pathe.fr/en/movies-events/seance-all-inclusive-gladiator-ii-43025"
,"https://www.pathe.fr/en/movies-events/terrifier-3-38623"
,"https://www.pathe.fr/en/movies-events/the-apprentice-38942"
,"https://www.pathe.fr/en/movies-events/beetlejuice-beetlejuice-35311"
,"https://www.pathe.fr/en/movies-events/lee-miller-38695"
,"https://www.pathe.fr/en/movies-events/coraline"
,"https://www.pathe.fr/en/movies-events/le-fil-36337"
,"https://www.pathe.fr/en/movies-events/megalopolis-39056"
,"https://www.pathe.fr/en/movies-events/un-p-tit-truc-en-plus-37489"
,"https://www.pathe.fr/en/movies-events/emilia-perez-38789"
,"https://www.pathe.fr/en/movies-events/blink-twice-38161"
,"https://www.pathe.fr/en/movies-events/the-killer-40381"
,"https://www.pathe.fr/en/movies-events/barbes-little-algerie-39847"
,"https://www.pathe.fr/en/movies-events/bloody-beggar-version-tamoul-43010"
,"https://www.pathe.fr/en/movies-events/brother-version-tamoul-43011"
,"https://www.pathe.fr/en/movies-events/harold-et-le-crayon-magique-16112"
,"https://www.pathe.fr/en/movies-events/l-art-d-etre-heureux-40089"
,"https://www.pathe.fr/en/movies-events/niki-39046"
,"https://www.pathe.fr/en/movies-events/pat-et-mat-un-dernier-tour-de-vis-38151"
,"https://www.pathe.fr/en/movies-events/jamais-plus-it-ends-with-us-38075"
,"https://www.pathe.fr/en/movies-events/toute-la-beaute-et-le-sang-verse-19686"
,"https://www.pathe.fr/en/movies-events/call-me-by-your-name"
,"https://www.pathe.fr/en/movies-events/les-graines-du-figuier-sauvage-39096"
,"https://www.pathe.fr/en/movies-events/lucky-baskhar-version-tamoul-42771"
,"https://www.pathe.fr/en/movies-events/misericorde-38920"
,"https://www.pathe.fr/en/movies-events/singham-again-version-hindi-42811"
,"https://www.pathe.fr/en/movies-events/conjuring-3-sous-l-emprise-du-diable"
,"https://www.pathe.fr/en/movies-events/le-garcon-et-le-heron-36090"
,"https://www.pathe.fr/en/movies-events/le-peuple-loup"
,"https://www.pathe.fr/en/movies-events/portrait-de-la-jeune-fille-en-feu"
,"https://www.pathe.fr/en/movies-events/carol"
,"https://www.pathe.fr/en/movies-events/love-lies-bleeding-38874"
,"https://www.pathe.fr/en/movies-events/120-battements-par-minute"
,"https://www.pathe.fr/en/movies-events/bodyguard"
,"https://www.pathe.fr/en/movies-events/conjuring-2-le-cas-enfield"
,"https://www.pathe.fr/en/movies-events/conjuring-les-dossiers-warren"
,"https://www.pathe.fr/en/movies-events/dragons"
,"https://www.pathe.fr/en/movies-events/hayao-miyazaki-and-the-heron-43065"
,"https://www.pathe.fr/en/movies-events/la-nonne"
,"https://www.pathe.fr/en/movies-events/la-petite-fabrique-de-nuages"
,"https://www.pathe.fr/en/movies-events/la-soiree-stand-up-37420"
,"https://www.pathe.fr/en/movies-events/le-diner-de-cons"
,"https://www.pathe.fr/en/movies-events/les-rendez-vous-de-l-anime-le-garcon-et-le-heron-36868"
,"https://www.pathe.fr/en/movies-events/ni-chaines-ni-maitres-38248"
,"https://www.pathe.fr/en/movies-events/smain-deconne-finement-42149"
,"https://www.pathe.fr/en/movies-events/stars-80"]
movies_info = {}

for link in links:
    browser.get(link) #to open target links 
    movie_link = link
    try:
        title_element  = browser.find_element(By.CLASS_NAME, "hero-film__content")  
        movies_info['movie_title'] = title_element.find_element(By.TAG_NAME,'h1').text
    except Exception as e:
        movies_info['movie_title'] = 'movie_title'
    
    try:
        duration_element  = browser.find_element(By.XPATH, "/html/body/cgp-root/main/cgp-movie-page/cgp-movie-header/div/div[3]/div/div[2]/p[1]")
        movies_info['movie_duration'] = duration_element.text
    except Exception as e:
        movies_info['movie_duration'] = 'movie_duration'
    
    try:
        image_element  = browser.find_element(By.CLASS_NAME, "hero-film__poster")  
        movies_info['movie_image'] = image_element.get_attribute('src')
    except Exception as e:
        movies_info['movie_image'] = 'movie_image'
    
    try:
        release_date_element  = browser.find_element(By.XPATH, "/html/body/cgp-root/main/cgp-movie-page/cgp-movie-header/div/div[3]/div/div[3]/div/p")  
        movies_info['movie_release_date'] = release_date_element.text
    except Exception as e:
        movies_info['movie_release_date'] = 'movie_release_date'
    
    try:
        categories_element  = browser.find_element(By.XPATH, "/html/body/cgp-root/main/cgp-movie-page/cgp-movie-header/div/div[3]/div/div[2]/p[2]")  
        movies_info['movie_categories'] = categories_element.text
    except Exception as e:
        movies_info['movie_categories'] = 'movie_categories'

    try:
        summary_element  = browser.find_element(By.XPATH, "/html/body/cgp-root/main/cgp-movie-page/cgp-movie-header/div/div[3]/div/div[3]/div/div")  
        movies_info['movie_summary'] = summary_element.text
    except Exception as e2:
        movies_info['movie_summary'] = 'movie_summary'

    try:
        more_click_element = browser.find_element(By.XPATH, '/html/body/cgp-root/main/cgp-movie-page/cgp-movie-header/div/div[3]/div[1]/div[3]/div/h2/a')
        browser.execute_script("arguments[0].click();", more_click_element)
        movies_info['more_click_element'] = 'no error'
    except Exception as e:
        movies_info['more_click_element'] = 'error_click'

    try:
        extra_info_element  = browser.find_element(By.XPATH, '/html/body/cgp-root/main/cgp-movie-page/cgp-movie-header/cgp-movie-details-modal/div/div/div[2]/div/div/div/div/div/p[2]')  
        movies_info['movie_extra_info'] = extra_info_element.text
    except Exception as e:
        movies_info['movie_extra_info'] = 'movie_extra_info'

    try:
        story_element  = browser.find_element(By.XPATH, '/html/body/cgp-root/main/cgp-movie-page/cgp-movie-header/cgp-movie-details-modal/div/div/div[2]/div/div/div/div/div/ul')  
        movies_info['movie_story_element'] = story_element.text
    except Exception as e:
        movies_info['movie_story_element'] = 'movie_story_element'

    movies_info['movie_link'] = movie_link

    with open("movies_data.csv", "a", encoding="utf-8") as new_file:
        csv_writer = csv.writer(new_file)
        csv_writer.writerow(movies_info.values())


    

browser.quit()
