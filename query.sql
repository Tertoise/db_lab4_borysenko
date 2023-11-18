-- 1. Вивести всі регіони і кількість карт в кожному
select region.region_name, 
       count(distinct region_units.unit_id) + 
       count(distinct region_spells.spell_id) + 
       count(distinct champion_region.champion_name) as total_cards
from region
left join region_units on region.region_name = region_units.region_name
left join region_spells on region.region_name = region_spells.region_name
left join champion_region on region.region_name = champion_region.region_name
group by region.region_name;

-- 2. Вивести кількість карт для кожної вартості
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

-- 3. Вивести залежність атаки юніта від його вартості
select u.cost, round(avg(u.attack), 1) as average_attack
from (
    select attack, cost from unit_card
    union
    select attack, cost from champion_card
) as u
group by u.cost
order by u.cost;