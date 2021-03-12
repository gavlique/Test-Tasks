import pandas as pd
users = [
{'id':1, 'name':'Vitaliy', 'age':20},
{'id':2, 'name':'Alex', 'age':24},
{'id':3, 'name':'Den', 'age':21}
]

phones = [
{'id':1, 'user_id':1, 'number':"89009991011"},
{'id':2, 'user_id':1, 'number':"89002391231"},
{'id':3, 'user_id':2, 'number':"88005553535"},
{'id':4, 'user_id':3, 'number':"89045435335"}


users_df = pd.DataFrame(users)
phone_df = pd.DataFrame(phones
merged = pd.merge(users_df, phones_df, how='left',
                    left_on='id', right_on='user_id')
merged
