for line in open("disneySongLyrics.txt", 'r', encoding='utf-8'):
    # hi there, this is a python comment!
    # ebb: I decided to add the "dressed" up version of opening files,
    # using `r` to mean 'read', and encoding='utf-8'
    # I added that just in case computers (like Windows) need to be told what character encoding to expect.
    # Try your code with and without these extra parameters.
    for word in line.split():
        if word.endswith('ing'):
            print(word)