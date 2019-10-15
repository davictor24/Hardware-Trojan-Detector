import serial
from os import makedirs
from os.path import join
import time

K = 2**10 # number of samples
folders = ['golden', 'trojan']

n = int(input('How many rounds?: '))
k = int(input('0 - golden, 1 - trojan: '))
folder = folders[0 if k == 0 else 1]

# Set up the serial line
ser = serial.Serial('COM12', 115200)
print('Connected to: ' + ser.portstr)

for i in range(n):
    print('Test running...')
    ser.write('RESET'.encode())
    # Read and record the data
    log = []
    while True:
        b = ser.readline()         # read a byte string
        string_n = b.decode()      # decode byte string into Unicode  
        string = string_n.rstrip() # remove \n and \r
        try:
            data = string.split(',')
            ti = float(data[0])
        except: continue
        if len(log) == 0 and ti != 0.0: continue
        log.append(string)
        if len(log) >= K: break
    makedirs(folder, exist_ok=True)
    filename = join(folder, str(int(round(time.time() * 1000))) + '.txt')
    f = open(filename, 'w')
    f.write('\n'.join(log))
    f.close()
    print('File', filename, 'saved!')

ser.close()
