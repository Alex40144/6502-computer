import os

file = input("name of file to convert: ")


os.system("vasm6502_oldstyle -Fbin -dotdir " + file)