import matplotlib.pyplot as plt
import numpy as np
import random
from keras.models import Sequential
from keras.layers import Dense
from keras.layers import LSTM
from keras.layers import Dropout
from keras.layers.convolutional import Conv1D
from keras.layers.convolutional import MaxPooling1D
from sklearn.preprocessing import StandardScaler
from sklearn import metrics
from os import listdir, makedirs
from os.path import isfile, join
import jsonpickle

split = 0.8 # 80 percent train, 20 percent test
threshold = 0.4

def load_data():
    folders = ['golden', 'trojan']
    data_train, data_test = [], []
    classes_train, classes_test = [], []
    for i in range(len(folders)):
        folder = folders[i]
        files = [file for file in listdir(folder) if isfile(join(folder, file))]
        random.shuffle(files)
        k = int(split*len(files))
        files_train, files_test = files[:k], files[k:]
        for file in files_train:
            t, series = load_series(folder, file)
            data_train.append(series)
            classes_train.append(i)
        for file in files_test:
            t, series = load_series(folder, file)
            data_test.append(series)
            classes_test.append(i)
    return data_train, classes_train, data_test, classes_test, t

def load_series(folder, file):
    t = []
    series = []
    with open(join(folder, file)) as f:
        data = f.read().split('\n')
        for line in data:
            linearr = line.split(',')
            t.append(float(linearr[0]))
            series.append(float(linearr[2]))
    return t, series

def save_obj(obj, folder, file):
    filename = join(folder, file)
    f = open(filename, 'w')
    json_string = jsonpickle.encode(obj)
    f.write(json_string)
    f.close()

data_train, classes_train, data_test, classes_test, t = load_data()
golden_series = data_test[0]
trojan_series = data_test[-1]
N = len(golden_series)

# create the model
model = Sequential()
model.add(Dense(32, input_shape=(N,1)))
model.add(Conv1D(filters=32, kernel_size=200, padding='same', activation='relu'))
model.add(MaxPooling1D(pool_size=2))
model.add(Dropout(0.1))
model.add(LSTM(100))
model.add(Dropout(0.1))
model.add(Dense(1, activation='sigmoid'))
model.compile(loss='binary_crossentropy', optimizer='adam', metrics=['accuracy'])
print(model.summary())

# Training
scaler = StandardScaler()
data_train = scaler.fit_transform(data_train)
data_train = data_train[..., np.newaxis]
model.fit(data_train, classes_train, epochs=15)

# Testing
data_test = scaler.transform(data_test)
data_test = data_test[..., np.newaxis]
classes_pred = [0 if x[0] < threshold else 1 for x in model.predict(data_test)]
print('Accuracy:', metrics.accuracy_score(classes_test, classes_pred))
print('Precision:', metrics.precision_score(classes_test, classes_pred))
print('Recall:', metrics.recall_score(classes_test, classes_pred))

# Save model
folder = 'modeldata_rnn'
makedirs(folder, exist_ok=True)
save_obj(scaler, folder, 'scaler.json')
model.save(join(folder, 'model.h5'))
print('Model saved')

# Plot
plt.plot(t, golden_series)
plt.plot(t, trojan_series)
plt.title('Power traces')
plt.legend(['Golden', 'Trojan'], loc='upper left')
plt.xlabel('t (seconds)')
plt.ylabel('p (mW)')
plt.minorticks_on()
plt.grid(b=True, which='major', linestyle='-')
plt.grid(b=True, which='minor', linestyle='--')
plt.show()
