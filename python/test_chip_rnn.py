import serial
import numpy as np
from keras.models import load_model
from os.path import join
import jsonpickle

K = 2**10 # number of samples
threshold = 0.4

def load_obj(folder, file):
    with open(join(folder, file)) as f:
        json_string = f.read()
    return jsonpickle.decode(json_string)

# Set up the serial line
ser = serial.Serial('COM12', 115200)
print('Connected to: ' + ser.portstr)
print('Test running...')
ser.write('RESET'.encode())

# Read and record the data
t = []
Q = []
p = []
lstatus = True
while True:
    b = ser.readline()         # read a byte string
    string_n = b.decode()      # decode byte string into Unicode  
    string = string_n.rstrip() # remove \n and \r
    try:
        data = string.split(',')
        ti = float(data[0])
        Qi = int(data[1], 2)
        pi = float(data[2])
    except: continue
    if len(t) == 0:
            if ti != 0.0: continue
            else: Q_ = -1
    t.append(ti)
    Q.append(Qi)
    p.append(pi)
    if Qi - Q_ != 1: lstatus = False
    if len(t) >= K: break
    Q_ = Qi
ser.close()

print('Logic test:', 'Passed' if lstatus else 'Failed')

# Load model
folder = 'modeldata_rnn'
scaler = load_obj(folder, 'scaler.json')
model = load_model(join(folder, 'model.h5'))

# Prediction
series = scaler.transform([p])
series = series[..., np.newaxis]
pred = model.predict(series)[0]
print()
print('Trojan probability:', pred[0])
print('Power SCA test:', 'Passed' if pred[0] < threshold else 'Failed')
