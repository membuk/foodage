sozluk= {"Kisi":            [395,378,400,400,360,380,387,403,390,370,400,374,402,395,392,
                             362,407,394,368,376,393,413,387,368,413,364,411,385],
       "Domates_Corbasi":   [1,0,0,0,0,1,0,0,0,0,0,0,0,1,1,0,0,0,0,1,0,0,0,0,0,0,0,1],
       "Misir_Corbasi":     [0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0],
       "Mercimek_Corbasi":  [0,0,1,1,0,0,0,0,0,1,1,0,0,0,0,0,1,1,0,0,0,0,0,1,1,0,0,0],
       "Yayla_Corbasi":     [0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0],
       "Sehriye_Corbasi":   [0,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,1,0],
       "Tarhana_Corbasi":     [0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0],
       "Pirasa":              [0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0],
       "Doner":               [0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0],
       "Ekmek_Arasi_Şinitzel":[0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0],
       "Misket_Kofte":      [1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0],
       "Ciftlik_Kebabi":    [0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0],
       "Cerkez_Tavugu":     [0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0],
       "Etli_Patates":      [0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0],
       "Pilav_Ustu_Kavurma":[0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0],
       "Ekmek_Arasi_Kofte": [0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0],
       "Pide":              [0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0],
       "Kuru_Fasulye":[0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0],
       "Tavuk_Pirzola":[0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,1],
       "Meyve_Suyu":[1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0],
       "Mozaik_Pasta":[0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0],
       "Ayran":[0,0,1,1,0,0,1,1,1,0,0,0,1,0,0,0,1,1,0,0,1,1,1,0,0,0,1,0],
       "Puding":[0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0],
       "Tursu":[0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0],
       "Kemalpasa":[0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0],
       "Salata":[0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1]}

import pandas as pd
veri = pd.DataFrame(sozluk)

X= veri[["Domates_Corbasi","Misir_Corbasi","Mercimek_Corbasi","Yayla_Corbasi","Sehriye_Corbasi",
         "Tarhana_Corbasi","Pirasa","Doner","Ekmek_Arasi_Şinitzel","Misket_Kofte","Ciftlik_Kebabi",
         "Cerkez_Tavugu","Etli_Patates","Pilav_Ustu_Kavurma","Ekmek_Arasi_Kofte","Pide","Kuru_Fasulye",
         "Tavuk_Pirzola", "Meyve_Suyu","Mozaik_Pasta","Ayran","Puding","Tursu","Kemalpasa","Salata"]]
Y= veri[["Kisi"]]

# çoklu regresyon tahmini
from sklearn.linear_model import LinearRegression
lm =LinearRegression()
model = lm.fit(X.values,Y)

model.predict([[1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0]]) #Gerçekleşen: 395

model.predict([[0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,1,0,0,0]]) #Gerçekleşen:  368

model.predict([[1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1]]) #Gerçekleşen:  385

model.predict([[0,0,0,0,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0]]) #Gerçekleşen:  411

model.predict([[0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0]]) #test menü

#model doğruluğu r2 hesaplaması
from sklearn.metrics import r2_score
r2_score(Y, model.predict(X))

#model doğruluk hesaplamaları
import statsmodels.api as sm
lm = sm.OLS(Y, X)
model = lm.fit()
print(model.summary())

#kişi sayısındaki sapma
from sklearn.model_selection import train_test_split
from sklearn.metrics import mean_squared_error
from sklearn.model_selection import cross_val_score
import numpy as np
x_train, x_test, y_train, y_test = train_test_split(X, Y, test_size = 0.10, random_state=99)
lm = LinearRegression()
model = lm.fit(x_train, y_train)
np.sqrt(np.mean(-cross_val_score(model, x_train, y_train, cv=10, scoring="neg_mean_squared_error")))

