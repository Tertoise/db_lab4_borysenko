-- Populate champion_card

INSERT INTO champion_card (cost, attack, health, champion_name)
VALUES(1, 1, 1, 'Teemo');
INSERT INTO champion_card (cost, attack, health, champion_name)
VALUES(5, 4, 6, 'Sylas');
INSERT INTO champion_card (cost, attack, health, champion_name)
VALUES(4, 4, 4, 'Yasuo');
INSERT INTO champion_card (cost, attack, health, champion_name)
VALUES(3, 2, 2, 'Yuumi');
INSERT INTO champion_card (cost, attack, health, champion_name)
VALUES(1, 2, 1, 'Lucian');
INSERT INTO champion_card (cost, attack, health, champion_name)
VALUES(5, 4, 5, 'Sett');

-- Populate region

INSERT INTO region (region_name, region_description)
VALUES ('Ionia', 'The land of magic and spirits');
INSERT INTO region (region_name, region_description)
VALUES ('Shurima', 'The ancient empire, destroyed by eternal conflict');
INSERT INTO region (region_name)
VALUES ('Demacia');
INSERT INTO region (region_name, region_description)
VALUES ('Freljord', 'Ice and mountains cover the land of Freljord');
INSERT INTO region (region_name, region_description)
VALUES ('Bilgewater', 'A homeland of pirates and underwater monsters');
INSERT INTO region (region_name, region_description)
VALUES ('Shadow Isles', 'Once they were blessed,now they are home for dead');
INSERT INTO region (region_name, region_description)
VALUES ('Targon', 'The mountain of targon holds a lot of secrets');
INSERT INTO region (region_name, region_description)
VALUES ('Bandlecity', 'The city of yordles built around a bandle tree');

-- Populate champion_region

INSERT INTO champion_region (region_name, champion_name)
VALUES ('Bilgewater', 'Sett');
INSERT INTO champion_region (region_name, champion_name)
VALUES ('Ionia', 'Sett');
INSERT INTO champion_region (region_name, champion_name)
VALUES ('Bandlecity', 'Teemo');
INSERT INTO champion_region (region_name, champion_name)
VALUES ('Ionia', 'Teemo');
INSERT INTO champion_region (region_name, champion_name)
VALUES ('Freljord', 'Sylas');
INSERT INTO champion_region (region_name, champion_name)
VALUES ('Demacia', 'Sylas');
INSERT INTO champion_region (region_name, champion_name)
VALUES ('Ionia', 'Yasuo');
INSERT INTO champion_region (region_name, champion_name)
VALUES ('Targon', 'Yasuo');
INSERT INTO champion_region (region_name, champion_name)
VALUES ('Targon', 'Yuumi');
INSERT INTO champion_region (region_name, champion_name)
VALUES ('Bandlecity', 'Yuumi');
INSERT INTO champion_region (region_name, champion_name)
VALUES ('Demacia', 'Lucian');
INSERT INTO champion_region (region_name, champion_name)
VALUES ('Shadow Isles', 'Lucian');

-- Populate unit_card

INSERT INTO unit_card (name, cost, health, attack, unit_id)
VALUES ('Shark', 1, 2, 1, '1b');
INSERT INTO unit_card (name, cost, health, attack, unit_id)
VALUES ('Hardworking student', 1, 1, 1, '1i');
INSERT INTO unit_card (name, cost, health, attack, unit_id)
VALUES ('Butcher', 0, 2, 3, '1is');
INSERT INTO unit_card (name, cost, health, attack, unit_id)
VALUES ('Cosmic Youngling', 2, 4, 1, '1t');
INSERT INTO unit_card (name, cost, health, attack, unit_id)
VALUES ('Fallen sands general', 7, 7, 0, '1sh');
INSERT INTO unit_card (name, cost, health, attack, unit_id)
VALUES ('The Watcher', 13, 17, 11, '1f');

-- Populate region_units

INSERT INTO region_units (region_name, unit_id)
VALUES ('Bilgewater', '1b');
INSERT INTO region_units (region_name, unit_id)
VALUES ('Ionia', '1i');
INSERT INTO region_units (region_name, unit_id)
VALUES ('Shadow Isles', '1is');
INSERT INTO region_units (region_name, unit_id)
VALUES ('Targon', '1t');
INSERT INTO region_units (region_name, unit_id)
VALUES ('Shurima', '1sh');
INSERT INTO region_units (region_name, unit_id)
VALUES ('Freljord', '1f');
INSERT INTO region_units (region_name, unit_id)
VALUES ('Targon', '1f');

-- Populate spell_card

INSERT INTO spell_card (name, cost, effect, spell_id)
VALUES ('Warning shot', 1, 'Deal 1 to the enemy Nexus', '1sb');
INSERT INTO spell_card (name, cost, effect, spell_id)
VALUES ('Deny', 4, 'Deny next enemy spell', '1si');
INSERT INTO spell_card (name, cost, effect, spell_id)
VALUES ('Glimpse Beyond', 2, 'Kill an ally to draw 2', '1sis');
INSERT INTO spell_card (name, cost, effect, spell_id)
VALUES ('Guiding touch', 2, 'Heal an ally or your Nexus 2', '1st');
INSERT INTO spell_card (name, cost, effect, spell_id)
VALUES ('Shifting sands', 6, 'Deal 6 to a unit', '1ssh');
INSERT INTO spell_card (name, cost, effect, spell_id)
VALUES ('Avalanche', 4, 'Deal 2 to all units', '1sf');

-- Populate region_spells

INSERT INTO region_spells (region_name, spell_id)
VALUES ('Bilgewater', '1sb');
INSERT INTO region_spells (region_name, spell_id)
VALUES ('Ionia', '1si');
INSERT INTO region_spells (region_name, spell_id)
VALUES ('Shadow Isles', '1sis');
INSERT INTO region_spells (region_name, spell_id)
VALUES ('Targon', '1st');
INSERT INTO region_spells (region_name, spell_id)
VALUES ('Shurima', '1ssh');
INSERT INTO region_spells (region_name, spell_id)
VALUES ('Freljord', '1sf');
INSERT INTO region_spells (region_name, spell_id)
VALUES ('Targon', '1sf');


