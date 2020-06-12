import os
from os import listdir
from os.path import isfile, join


components_path = "components"
comp_dirs = [f for f in listdir(components_path) if not isfile(join(components_path, f))]

print(" === Component Directories ===")
for dir_ in comp_dirs:
    print("  "+dir_)

for dir_ in comp_dirs:
    print("\n")
    print(" === Next Directory ==========")
    print("   Directory Name: "+dir_)

    cad_files = []
    max_rev = {}  # {f_name_no_rev: max_rev_num}

    f_path = join(join(components_path, dir_), "CAD")
    if os.path.exists(f_path):
        for f in listdir(f_path):
            f_split = f.split(".")
            if len(f_split) > 2 and f_split[-2] in ("prt", "asm"):  # expect FNAME.EXTENSION.VERSION_NUMBER
                cad_files.append(f)
                rev_num = int(f_split[-1])
                f_name_no_rev = ".".join(f_split[:-1])
                if f_name_no_rev not in max_rev:
                    max_rev[f_name_no_rev] = rev_num
                else:
                    max_rev[f_name_no_rev] = max(max_rev[f_name_no_rev], rev_num)

    if len(cad_files) == 0:
        print("   No CAD")
    else:
        keep_set = {name+"."+str(rev_num) for name, rev_num in max_rev.items()}
        delete_list = []
        print("   KEEP:")
        for f in cad_files:
            if f in keep_set:
                print("     "+f)
        print("   DELETE:")
        for f in cad_files:
            if f not in keep_set:
                print("     "+f)
                delete_list.append(f)

        if len(delete_list) > 0:
            user_in = raw_input("   DELETE these files - (y/n): ")
            if "y" in user_in.lower():
                for f in delete_list:
                    f_path = join(join(join(components_path, dir_), "CAD"), f)
                    os.remove(f_path)
                print("   Deleted")
            else:
                print("   No Changes")
