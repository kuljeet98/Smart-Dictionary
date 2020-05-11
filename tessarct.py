from lib import*
from line_removal import*
def tess():
    text = pytesseract.image_to_string(r"C:/Users/jagno/Desktop/meaning_detection/image/final.png")
    print(text)
    
    syns = wordnet.synsets(text)
    a = text,"means:",syns[0].definition()
    # dictionary=PyDictionary()
    # return (dictionary.meaning(text)) #defintion extraction from the processed image
    #def syn returns the synonyms of the word fetched above
    synonyms = []
    # text = pytesseract.image_to_string(self.name+'_.png')
    for syn in wordnet.synsets(text):
        for l in syn.lemmas():
            synonyms.append(l.name()) # synonym extraction
            # if l.antonyms():
            #     antonyms.append(l.antonyms()[0].name())
    b = text,"synonyms are:",synonyms
    shutil.rmtree(r"C:/Users/jagno/Desktop/meaning_detection/image")
    return (a,b)



