import pandas as pd
import os
df = pd.read_excel(os.path.join(os.getcwd(), 'earthquakes.xlsx'), sheet_name='Sheet1')
df.to_csv('earthquakes.csv', index = None, header=True)
