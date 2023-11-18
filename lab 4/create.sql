CREATE TABLE unit_card
(
  name VARCHAR(30) NOT NULL,
  cost INT NOT NULL,
  health INT NOT NULL,
  attack INT NOT NULL,
  unit_id VARCHAR(30) NOT NULL,
  PRIMARY KEY (unit_id)
);

CREATE TABLE spell_card
(
  cost INT NOT NULL,
  effect VARCHAR(30) NOT NULL,
  name VARCHAR(30) NOT NULL,
  spell_id VARCHAR(30) NOT NULL,
  PRIMARY KEY (spell_id)
);

CREATE TABLE region
(
  region_name VARCHAR(30) NOT NULL,
  region_description VARCHAR(50),
  PRIMARY KEY (region_name)
);

CREATE TABLE region_units
(
  region_name VARCHAR(30) NOT NULL,
  unit_id VARCHAR(30) NOT NULL,
  PRIMARY KEY (region_name, unit_id),
  FOREIGN KEY (region_name) REFERENCES region(region_name),
  FOREIGN KEY (unit_id) REFERENCES unit_card(unit_id)
);

CREATE TABLE region_spells
(
  region_name VARCHAR(30) NOT NULL,
  spell_id VARCHAR(30) NOT NULL,
  PRIMARY KEY (region_name, spell_id),
  FOREIGN KEY (region_name) REFERENCES region(region_name),
  FOREIGN KEY (spell_id) REFERENCES spell_card(spell_id)
);

CREATE TABLE champion_card
(
  cost INT NOT NULL,
  attack INT NOT NULL,
  health INT NOT NULL,
  champion_name VARCHAR(30) NOT NULL,
  PRIMARY KEY (champion_name)
);

CREATE TABLE champion_region
(
  region_name VARCHAR(30) NOT NULL,
  champion_name VARCHAR(30) NOT NULL,
  PRIMARY KEY (region_name, champion_name),
  FOREIGN KEY (region_name) REFERENCES region(region_name),
  FOREIGN KEY (champion_name) REFERENCES champion_card(champion_name)
);