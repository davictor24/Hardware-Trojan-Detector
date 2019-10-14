import matplotlib.pyplot as plt
import numpy as np
from sklearn.preprocessing import StandardScaler
from sklearn.decomposition import PCA
from sklearn import svm
from sklearn import metrics

fs = 50 # sample rate
tp = 10 # test duration
N = fs*tp # number of samples
ts = 1/fs # sample period
threshold = 0.6

def golden_chip():
    return np.random.normal(5.0, 0.005, N)

def trojan_chip_1():
    return np.concatenate((np.random.normal(5.0, 0.005, int(N/4)), 
           np.random.normal(4.998, 0.007, int(N/4)), 
           np.random.normal(5.0, 0.005, int(N/2))))

def trojan_chip_2():
    return np.concatenate((np.random.normal(5.0, 0.005, int(N/2)), 
           np.random.normal(4.998, 0.007, int(N/4)), 
           np.random.normal(5.0, 0.005, int(N/4))))

# training
golden_arr = [golden_chip() for i in range(100)]
trojan_arr = [trojan_chip_1() for i in range(100)]
dataset = golden_arr + trojan_arr
classes = [0 for i in range(100)] + [1 for i in range(100)] # 0 - no trojan, 1 - trojan

scaler = StandardScaler()
dataset = scaler.fit_transform(dataset)
pca = PCA(n_components=100)
dataset = pca.fit_transform(dataset)
clf = svm.SVC(kernel='linear', probability=True)
clf.fit(dataset, classes)

# testing
golden_arr_test = [golden_chip() for i in range(100)]
trojan_arr_test = [trojan_chip_1() for i in range(100)]
dataset_test = golden_arr_test + trojan_arr_test
classes_test = [0 for i in range(100)] + [1 for i in range(100)] # 0 - no trojan, 1 - trojan

dataset_test = scaler.transform(dataset_test)
dataset_test = pca.transform(dataset_test)
classes_pred = [0 if x[0] > threshold else 1 for x in clf.predict_proba(dataset_test)]

print('Accuracy:', metrics.accuracy_score(classes_test, classes_pred))
print('Precision:', metrics.precision_score(classes_test, classes_pred))
print('Recall:', metrics.recall_score(classes_test, classes_pred))

# single test
arr_test = [trojan_chip_1() for i in range(1)]
arr_test = scaler.transform(arr_test)
arr_test = pca.transform(arr_test)
pred = clf.predict_proba(arr_test)[0]
print()
print(pred)
print('no trojan' if pred[0] > threshold else 'trojan')

t = [i*ts for i in range(N)]
golden = golden_chip()
trojan1 = trojan_chip_1()
# trojan2 = trojan_chip_2()

plt.plot(t, golden)
plt.plot(t, trojan1)
# plt.plot(t, trojan2)
plt.legend(['golden', 'trojan 1', 'trojan 2'], loc='upper left')
plt.xlabel('t (seconds)')
plt.ylabel('V (volts)')
plt.minorticks_on()
plt.grid(b=True, which='major', linestyle='-')
plt.grid(b=True, which='minor', linestyle='--')
plt.show()
