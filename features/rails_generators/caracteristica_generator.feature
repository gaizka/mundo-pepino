Feature: caracteristica generator

  Background:
    Given a Rails app
      And "mundo-pepino" in "." as one of its plugins
      And "string-mapper" in "features/support/app/vendor/plugins/string-mapper" as one of its plugins
      And I run executable "script/generate" with arguments "cucumber"
    
  Scenario Outline: generate caracteristica like README says
    Given I run executable "script/generate" with arguments "<generator>"
      And I run executable "script/generate" with arguments "caracteristica Orchard Huerto name:string:nombre"
      And I run executable "script/generate" with arguments "scaffold Orchard name:string"
      And I invoke task "rake db:migrate"

    When I invoke task "rake caracteristicas"

    Then I should see 'Could not find link with text or title or id "Borrar"'
     And I should see 'Could not find button "Crear"'

    Given I replace "Destroy" with "Borrar" in app/views/orchards/index.html.erb
      And I replace "Create" with "Crear" in app/views/orchards/new.html.erb
      
    When I invoke task "rake caracteristicas"

    Then I should see '2 scenarios (2 passed)'
     And I should see '7 steps (7 passed)'

    Examples:
      |     generator      |
      | mundo_pepino       |
      | mundo_pepino_steps |
