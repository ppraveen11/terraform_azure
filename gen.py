import sys
import pandas as pd
import math
import json
import colorama
from colorama import Fore

file = ""
try:
    file = sys.argv[1]
except IndexError:
    print(Fore.RED + "Please pass the name of the CSV file")
    print(Fore.WHITE)
    sys.exit(1)

from os.path import exists
if exists("TF_auto_var.auto.tfvars"):
    f = open("TF_auto_var.auto.tfvars", "w")
    f.write("")
    f.close()

dfs = []
try:
    xls = pd.ExcelFile(file)
    for sheet_name in xls.sheet_names:
        if sheet_name == "Summary_of_Prerequisites":
            continue  # Skip this sheet
        dfs.append(pd.read_excel(file, sheet_name=sheet_name))
except FileNotFoundError:
    print('Excel file not found in the directory')
    sys.exit(1)

data = {}
for df in dfs:
    quantity = ""
    flag = True
    new_quantity_index = 0
    interface_id = []
    for h in range(len(df["KEY"])):
        if quantity > "1":
            h = new_quantity_index
            flag = False
            quantity = int(quantity) - 1
        else:
            flag = True
            quantity = "0"

        if flag == True:
            if df["KEY"][h] not in data:
                data[df["KEY"][h]] = []
            if df["KEY"][h] == 'Interface_id':
                interface_id.append(str(df["Value"][h]))
            elif pd.isna(df["Value"][h]):
                continue
            else:
                data[df["KEY"][h]].append(str(df["Value"][h]))

            if df["KEY"][h] == 'Quantity':
                quantity = str(df["Value"][h])
                new_quantity_index = h + 1

for key in data:
    f = open("TF_auto_var.auto.tfvars", "a")
    if key == "VM_tags":
        dictionary = json.loads(data[key][0])
        d_string = json.dumps(dictionary, sort_keys=True, ensure_ascii=True)
        print(d_string)

        test_arr = []
        for obj_str in data[key]:
            dictionary = json.loads(obj_str)
            test_arr.append(dictionary)

        f.write(f'{key} = {json.dumps(test_arr)}\n')
        f.close()
    elif isinstance(key, str) and "_tags" in key:
        test_arr = []
        for obj_str in data[key]:
            if obj_str == "nan":
                continue
            dictionary = json.loads(obj_str)
            test_arr.append(dictionary)

        f.write(f'{key} = {json.dumps(test_arr)}\n')
        f.close()
    else:
        if data[key]:
            list_01 = json.dumps(data[key])
            f.write(f'{key} = {list_01}\n')
            f.close()
