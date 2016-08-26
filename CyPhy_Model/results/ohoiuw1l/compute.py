import json
import os
json_filename = os.path.join("", 'testbench_manifest.json')
json_data = {}
if os.path.isfile(json_filename):
    with open(json_filename, "r") as json_file:
        json_data = json.load(json_file) 
    for item in json_data['Parameters']:
        if "inertia"== item["Name"]:
            try:
                inertia=float(item["Value"])
            except:
                inertia=item["Value"]
        if "Sdep"== item["Name"]:
            try:
                Sdep=float(item["Value"])
            except:
                Sdep=item["Value"]
panels_prop=2
sum_parts_cost=209066.0
parts_mass=0.0
normalizedIntertia=inertia/59084338505

roughMass=parts_mass
bomCost=sum_parts_cost
Panels=panels_prop

##############################
for metric in json_data['Metrics']: 
    if metric["Name"] == "normalizedIntertia":
        metric["Value"] = normalizedIntertia
    if metric["Name"] == "roughMass":
        metric["Value"] = roughMass
    if metric["Name"] == "bomCost":
        metric["Value"] = bomCost
    if metric["Name"] == "Panels":
        metric["Value"] = Panels
with open(json_filename, "w") as json_file:
    json.dump(json_data, json_file, indent=4)
# json handler done
