import matplotlib.pyplot as plt
import numpy as np
import random
from sklearn.preprocessing import StandardScaler
from sklearn.decomposition import PCA
from sklearn import svm
from sklearn import metrics
from os import listdir, makedirs
from os.path import isfile, join
import jsonpickle

split = 0.8 # 80 percent train, 20 percent test
threshold = 0.6

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
    # print(folder, file)
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

# Training
scaler = StandardScaler()
data_train = scaler.fit_transform(data_train)
pca = PCA(n_components=100)
data_train = pca.fit_transform(data_train)
clf = svm.SVC(kernel='rbf', C=1.0, gamma='scale', probability=True)
clf.fit(data_train, classes_train)

# Testing
data_test = scaler.transform(data_test)
data_test = pca.transform(data_test)
classes_pred = [0 if x[0] > threshold else 1 for x in clf.predict_proba(data_test)]
print('Accuracy:', metrics.accuracy_score(classes_test, classes_pred))
print('Precision:', metrics.precision_score(classes_test, classes_pred))
print('Recall:', metrics.recall_score(classes_test, classes_pred))

# Save model
folder = 'modeldata'
makedirs(folder, exist_ok=True)
save_obj(scaler, folder, 'scaler.json')
save_obj(pca, folder, 'pca.json')
save_obj(clf, folder, 'clf.json')
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
