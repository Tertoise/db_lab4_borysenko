import psycopg2

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
print(type(conn))

with conn:
                       
    print ("Database opened successfully")

    cur = conn.cursor()
    print('\n1.  ')
    print("Display all regions and the number of cards in each")

    cur.execute(query_1)

    for row in cur:
        print(row)
    print('\n2.')
    print("Display the number of cards for each cost")

    
    cur.execute(query_2)
    for row in cur:
        print(row)
    print('\n3. ')
    print("Display the dependency of unit attack on its cost")

    cur.execute(query_3)

    for row in cur:
        print((row[0], float(row[1])))





