# Заметим, что предложенные списки словарей без труда конвертируются в
# объекты DataFrame. Импортируем Pandas
import pandas as pd

# Тестовые примеры
users = [
{'id': 1, 'name': 'Vitaliy', 'age': 20},
{'id': 2, 'name': 'Alex', 'age': 24},
{'id': 3, 'name': 'Den', 'age': 21},
{'id': 4, 'name': 'Max', 'age': 26}
]

phones = [
{'id': 1, 'user_id': 1, 'number': "89009991011"},
{'id': 2, 'user_id': 1, 'number': "89002391231"},
{'id': 3, 'user_id': 2, 'number': "88005553535"},
{'id': 4, 'user_id': 3, 'number': "89045435335"}
]

# Преобразовываем и выполняем соединение. С учетом того, что нам нужно
# вывести всех людей, а телефоны есть не у всех, отлично подойдет left join
users_df = pd.DataFrame(users)
phones_df = pd.DataFrame(phones)
merged = pd.merge(users_df, phones_df, how='left',
    left_on='id', right_on='user_id')[['name', 'age', 'number']]

# Приводим данные к старому формату
result = [dict(merged.loc[i]) for i in merged.index]
print(result)
