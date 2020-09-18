import http.server
import pandas as pd
import socketserver
import sys
from urllib import parse


database = pd.read_csv("Combined_Esperanto_English.tsv", delimiter="\t", names=["entry", "definition"])

def search(entry):
    rows = database[database.entry.str.contains(entry)].copy()
    rows['rank'] = 100
    rows.loc[rows[rows.entry.str.startswith(entry)].index, "rank"] += 1000
    rows['rank'] -= rows.entry.str.len()
    rows = rows.sort_values(by='rank', ascending=False)
    return rows[['entry', 'definition']]

def head():
    return "<table class='tab2'>\n<tr><th class='th1'>Word</th><th class='th1'>Definition</th></tr>"

def tail():
    return "</table>"

def defn(word):
    return "<span class='defn' onClick='populateDefinition(\"" + word + "\");'>" + word +  "</span>"

def style_row(row):
    word = row['entry']
    return "<tr><td class='td1'>" + row['entry'] + "</td> <td class='td1'>" + defn(row['definition']) + "</td></tr>"

def main(args):
    srch = args[0]
    if srch[0] == "/":
        srch = srch[1:]
    result = ""
    while len(srch) > 1:
        result = search(srch)
        if len(result) == 0:
            srch = srch[:-1]
        else:
            break
    if len(result) == 0:
        message = "No results."
    else:
        message = head()
        for i, row in result.iterrows():
            message += style_row(row)
        message += tail()

    print(message)

if __name__ == "__main__":
    main(sys.argv[1:])
