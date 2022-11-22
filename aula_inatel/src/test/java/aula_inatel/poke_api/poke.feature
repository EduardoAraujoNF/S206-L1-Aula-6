Feature: Test Poke-api

Background: 
    * def url_base = "https://pokeapi.co/api/v2"

Scenario: Teste pikachu
    Given url url_base
    And path `/pokemon/pikachu`
    When method get
    Then status 200

Scenario: Teste de negativa
    Given url url_base
    And path `/pokemon/chocolate`
    When method get
    Then status 404

Scenario: Teste pikachu name e id
    Given url url_base
    And path `/pokemon/pikachu`
    When method get
    Then status 200
    And match response.name == 'pikachu'
    And match response.id == 25

Scenario: Teste retorno pokemon Red e entrando em um dos elementos do array
    Given url url_base
    And path `/version/1/`
    When method get 
    Then status 200
    And def idioma = $.names[5].language.url
    And print idioma
    And url idioma
    When method get 
    Then status 200
    And match response.name == 'es'
    And match response.id == 7

Scenario: Teste ratata name, id e weight
    Given url url_base
    And path `/pokemon/rattata`
    When method get
    Then status 200
    And match response.name == 'rattata'
    And match response.id == 19
    And match response.weight == 35


Scenario: Teste de verificação de pokemons roxos
    Given url url_base
    And path `/pokemon-species/19/`
    When method get 
    Then status 200
    And match response.color.name == 'purple'
    And def purple = $.color.url
    And print purple
    And url purple
    When method get 
    Then status 200
    And assert response.pokemon_species.length == 85