# Heading

* sugar
* milk
* bread




````
print ("Verbs ending in 'ing':")
for token in doc:
        if token.pos_ == "VERB" and token.text.endswith("ing"):
            print(token.text)