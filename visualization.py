import psycopg2
import matplotlib.pyplot as plt

username = 'postgres'
password = 'postgres'
database = 'db_lab3'
host = 'localhost'
port = '5432'

query_1 = '''
select region.region_name, 
       count(distinct region_units.unit_id) + 
       count(distinct region_spells.spell_id) + 
       count(distinct champion_region.champion_name) as total_cards
from region
left join region_units on region.region_name = region_units.region_name
left join region_spells on region.region_name = region_spells.region_name
left join champion_region on region.region_name = champion_region.region_name
group by region.region_name;
'''
query_2 = '''
select card_cost.cost as card_cost, count(*) as total_cards
from (
    select cost from unit_card
    union
    select cost from spell_card
    union
    select cost from champion_card
) as card_cost
left join unit_card on card_cost.cost = unit_card.cost
left join spell_card on card_cost.cost = spell_card.cost
left join champion_card on card_cost.cost = champion_card.cost
group by card_cost.cost
order by card_cost.cost;
'''
query_3 = '''
select u.cost, round(avg(u.attack), 1) as average_attack
from (
    select attack, cost from unit_card
    union
    select attack, cost from champion_card
) as u
group by u.cost
order by u.cost;
'''

conn = psycopg2.connect(user=username, password=password, dbname=database, host=host, port=port)

with conn:
    cur = conn.cursor()

    cur.execute(query_1)
    vendors = []
    total = []

    for row in cur:
        vendors.append(row[0])
        total.append(row[1])


    x_range = range(len(vendors))

    figure, (bar_ax, pie_ax, graph_ax) = plt.subplots(1, 3)
    bar = bar_ax.bar(x_range, total, label='Total')
    bar_ax.bar_label(bar, label_type='center')  # потрібен новий matplotlib
    bar_ax.set_xticks(x_range)
    bar_ax.set_xticklabels(vendors, rotation=10)
    bar_ax.set_xlabel('Регіони')
    bar_ax.set_ylabel('Кількість карток')
    bar_ax.set_title('Кількість карток в кожному регіоні')

    cur.execute(query_2)
    vendors = []
    total = []

    for row in cur:
        vendors.append(row[0])
        total.append(row[1])
    non_zero_total = [t for t in total if t > 0]
    non_zero_vendors = [v for t, v in zip(total, vendors) if t > 0]

    pie_ax.pie(non_zero_total, labels=non_zero_vendors, autopct='%1.1f%%')
    pie_ax.set_title('Частка кількості карт для кожної вартості')

    cur.execute(query_3)
    quantity = []
    item_price = []

    for row in cur:
        quantity.append(row[0])
        item_price.append(row[1])

    mark_color = 'blue'
    graph_ax.plot(quantity, item_price, color=mark_color, marker='o')

    for i in range(1, len(quantity)):
        qnt, price = quantity[i], item_price[i]
        graph_ax.annotate(price, xy=(qnt, price), color=mark_color,
                          xytext=(7, 2), textcoords='offset points')

    graph_ax.set_xlabel('Вартість')
    graph_ax.set_ylabel('Середня атака юніта')
    graph_ax.set_title('Графік залежності атаки юніта від його вартості')

mng = plt.get_current_fig_manager()
mng.resize(1400, 600)

plt.show()