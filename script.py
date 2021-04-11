with open("Eiyo.csv", "r") as f:
    s = f.read()
s = s.replace("\[.+?\]", "")

with open("Eiyo.csv", "w") as f:
    f.write(s)