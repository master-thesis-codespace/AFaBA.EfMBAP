import pandas as pd

df = pd.read_csv('participants_unique.csv')
df_bas1 = df[df['session'] == 'BAS1']

df_bas1.to_csv('participants_BAS1.csv', index=False)
print(f"Rows kept: {len(df_bas1)}")