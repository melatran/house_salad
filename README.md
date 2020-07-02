# House Salad Base

This repo is used as a base for the Consuming API lesson taught in Backend Module 3. To complete the lesson you will need to sign-up for an API key from the [ProPublica Congress API](https://projects.propublica.org/api-docs/congress-api/).

### Versions

Rails 5.1.7
Ruby 2.5.3

### Setup

```bash
git clone https://github.com/turingschool-examples/house-salad-base house-salad

cd house-salad

rails db:{create,migrate}
```

### Exercise

Write a test and complete this user story

*NOTE: Please use the existing form in the application.*

```
As a user
When I visit "/"
And I select "Colorado" from the dropdown
And I click on "Locate Members of the House"
Then my path should be "/search" with "state=CO" in the parameters
And I should see a message "7 Results"
And I should see a list of the 7 members of the house for Colorado
And I should see a name, role, party, and district for each member
```

### Thoughts

My original thought going into this refactor exercise was to break down the code in the index of the SearchController in a model for search results. In that model, it would have housed all the individual methods that were split up with the PropublicaService model. However, I can now see the purpose of the PropublicaService model. It encapsulates the functionality of interacting with the API and abstracting those details away from the SearchResults object. The SearchResults object encapsulates the functionality of finding the members of the house. It serves as a single responsibility. Each model serves one purpose instead. The code was refactored this way because controllers should not interact with the API. That type of functionality belongs in the models. Controllers should be skinny and models should be fat.

The pros of refactoring the API consumption include:
  * Code is more readable between programmers
  * Follows the SRP
  * Controllers are not doing the work of obtaining raw data
  * Models are obtaining raw data but not changing it - left for view

The cons of refactoring the API consumption include:
  * I did find it strange that we aren't testing SearchResults - challenges the concept of TDD (what has been ingrained into us)
  * Figuring out if I can pull variables as their own methods in case it needs to be used in other methods like searching can be quite generic instead of specifing only find the house members
