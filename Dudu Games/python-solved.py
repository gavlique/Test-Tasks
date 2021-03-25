# 1. Создайте отдельный список с мужчинами и отдельный список с женщинами.
men = [
    'Eddard Stark',
    'Robb Stark',
    'Jaime Lannister',
    'Tyrion Lannister',
    'Joffrey Baratheon',
    'Robert Baratheon',
    'Viserys Targarien',
    'Jon Snow'
]
women = [
    'Catelyn Stark',
    'Sansa Stark',
    'Cersei Lannister',
    'Daenerys Targarien'
]

# 2. Напишите функцию, которая принимает в качестве аргументов два списка с
# мужчинами и женщинами и возвращает список людей, оказавшихся вторыми.
def all_sorted(list1, list2):
    list_all = list1.copy()
    list_all.extend(list2)
    list_all.sort(key=lambda x: x.split()[::-1])
    return list_all

def second_ones(list1, list2):
    return all_sorted(list1, list2)[1::2]

# 3. Для каждой пары людей узнайте, являются ли они однофамильцами.
list_all = all_sorted(men, women)
import itertools
pairs = list(itertools.combinations(list_all, 2))
pair_dict = {i: (1 if i[0].split()[1] == i[1].split()[1] else 0) for i in pairs}

# 4. Узнайте состав каждой семьи, которая встречается в предоставленных
# списках
family_dict = {}
for i in list_all:
    family_dict.setdefault(i.split()[1], []).append(i)

# 5. Узнайте размер каждой семьи
for surname in family_dict:
    print(f'{surname}: {len(family_dict[surname])}')
