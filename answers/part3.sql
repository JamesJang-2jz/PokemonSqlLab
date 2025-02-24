Part 3:
-- //What is each pokemon's primary type?
SELECT pokemons.name, types.name
FROM pokemons
LEFT JOIN types
ON pokemons.primary_type = types.id;

-- //What is Rufflet's secondary type?
SELECT pokemons.name, types.name
    -> FROM pokemons
    -> INNER JOIN types
    -> ON pokemons.secondary_type = types.id
    -> WHERE pokemons.name = 'Rufflet';

-- // What are the names of the pokemon that belong to the trainer with trainerID 303?
SELECT trainerID, pokemons.name
FROM pokemon_trainer
LEFT JOIN pokemons
ON pokemon_trainer.pokemon_id = pokemons.id
WHERE pokemon_trainer.trainerID = 303;

-- //SELECT count(secondary_type) // if you know the number for poison type
FROM pokemons
WHERE secondary_type = 7;

-- //How many pokemon have a secondary type Poison
select COUNT(secondary_type)
    -> FROM pokemons
    -> INNER JOIN types
    -> ON pokemons.secondary_type = types.id
    -> WHERE types.name = 'Poison';

-- //What are all the primary types and how many pokemon have that type?
SELECT types.name, COUNT(pokemons.id) AS NumberPokemonByTypes
    -> FROM pokemons
    -> LEFT JOIN types
    -> ON pokemons.primary_type = types.id
    -> GROUP BY types.name;

-- //How many pokemon at level 100 does each trainer with at least one level 100 pokemone have? (Hint: your query should not display a trainer
SELECT trainerID, COUNT(pokemon_id) as Level100Pokemon
    -> FROM pokemon_trainer
    -> WHERE pokelevel = 100
    -> GROUP BY trainerID
    -> HAVING level100Pokemon > 1;

-- // How many pokemon only belong to one trainer and no other?
SELECT pokemon_id, COUNT(trainerID) as SinglePokemon
    -> FROM pokemon_trainer
    -> GROUP BY pokemon_id
    -> HAVING SinglePokemon = 1;