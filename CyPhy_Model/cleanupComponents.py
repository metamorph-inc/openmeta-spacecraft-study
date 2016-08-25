import os
from os import listdir
from os.path import isfile, join
cpath = "components"
onlydirs = [ f for f in listdir(cpath) if isfile(join(cpath,f)) == False ]
print onlydirs
for dd in onlydirs:
    try:
    #if True:
        pp = []
        nn = []
        maxrev = 0
        maxrevidx = -1
        ii = 0
        print " ***** next dir ********"
        for f in listdir(join(join(cpath,dd),"CAD")) :
            if f.find("prt")  > 0 :
                rev = f.split(".")[2]
                revnum = int(rev)
                print f
                if revnum > maxrev:
                    maxrev = revnum
                    maxrevidx = ii
                    print maxrev
                pp.append(revnum)
                nn.append(f)
                ii = ii + 1             
        #print pp
        #print nn
        print "KEEP: "+nn[maxrevidx]
        for ee in nn:
            if ee != nn[maxrevidx]:
                fname = join(join(join(cpath,dd),"CAD"),ee)
                print "DELETE "+fname
                os.remove(fname)
          
    except:
    #else:
        print "NoCAD"