Practice your query syntax using GraphiQL to get a feel for how schemas are set up in GraphQL. For problems that accept variables make sure to test each answer you come up with with multiple `id`s to make sure they work.

1. Write a query that will return the name, founder, ghost, and animal of Gryffindor (id: 1) and Ravenclaw (id: 4). Remember to alias - then DRY up your query with a fragment!

fragment findHouse on House {
  name,
  founder,
  ghost,
  animal
}

{
  Gryf: house(id: 1){
    ...findHouse
  }
  Raven: house(id: 4){
    ...findHouse
  }
}

2. Write a query that will return the core, length, owner name, and the name of the owner's house for both the wand with the `id` of 7 and the wand with the `id` of 10. Then use a fragment to DRY it up!

fragment findWand on Wand {
  core,
  length,
  wizard{
    name,
    house{
      name
    }
  }
}

{
  firstWand: wand(id: 7){
    ...findWand
  }
  secondWand: wand(id: 10){
    ...findWand
  }
}

3. Create a query that will accept an `id` variable and will return the patronus form associated with that `id`.

query findPatronus($firstId: Int, $secondId: Int) {
  firstPatronus: patronus(id: $firstId) {
    form
  },
  secondPatronus: patronus(id: $secondId) {
    form
  }
}

{
  "firstId" : 4,
  "secondId" : 2
}

4. Write a query with the operation name of `FetchWizardandWand` that will accept two variables, one for a wizard to be fetched(`$wizardId`) and one for a wand to be fetched(`$wandId`). For the wizard return their name and house name. For the wand return the core, length, and the wizard's patronus form.

query FetchWizardandWand($wizardId: Int, $wandId: Int){
  wizard: wizard(id: $wizardId){
    name,
    house{
      name
    }
  },
  wand(id: $wandId){
    core,
    length,
    wizard{
      patronus{
        form
      }
    }
  }
}

{
  "wizardId" : 2,
  "wandId" : 4
}

5. Now let's use variables, aliases and fragments! Write a query that will accept the `id` of two patronus. For each patronus return the form of that patronus, along with the name of the wizard that patronus belongs to.
fragment findPatronus on Patronus{
  form,
  wizards{
    name
  }
}

query TwoPatronuses($firstP: Int, $secondP: Int){
  firstPatronus: patronus(id: $firstP){
    ...findPatronus
  }
  secondPatronus: patronus(id: $secondP){
    ...findPatronus
  }
}

{
  "firstP" : 4,
  "secondP" : 2
}

6. Write a query that accepts two variables for the `id`s of two houses. For each house return the names of all the wizards of that house along with the core of their wands and their patronus forms. Use a fragment!

fragment findHouse on House{
  wizards{
    name,
    wands{
      core
    },
    patronus{
      form
    }
  }
}

query findHouses($firstId: Int, $secondId: Int){
  firstHouse: house(id: $firstId){
    ...findHouse
  },
  secondHouse: house(id: $secondId){
    ...findHouse
  }
}

{
  "firstId": 2,
  "secondId": 4
}

7. Write a query that accepts three variables for the `id` for three separate wizards. For the first wizard return their name, house name and patronus form. For the second wizard return their name, their house name, and their wand core. For the third wizard return their name, their house name, their patronus form, and their wand core. Though you are returning different information for each wizard you are still returning the name and house name of each wizard meaning you could use a fragment to DRY this up!

fragment findWizard on Wizard{
  name,
  house{
    name
  }
}

query ThreeWizards($first: Int, $second: Int, $third: Int){
  first: wizard(id: $first){
    ...findWizard,
    patronus{
      form
    }
  }
  second: wizard(id: $second){
    ...findWizard,
    wands{
      core
    }
  }
  third: wizard(id: $third){
    ...findWizard,
    patronus{
      form
    },
    wands{
      core
    }
  }
}

{
  "first" : 1,
  "second" : 2,
  "third" : 3
}

8. Write a query that will accept three variables for a query that can be broken down into three parts. The first variable will be the `id` for a house where you will return the name, founder, and patronus forms of all the wizards in that house. The second variable will be to fetch the length of a particular wand. The third variable will query to find the name, and the patronus form for the wizard with the specified id.

fragment findHouse on House{
  name,
  founder,
  wizards{
    patronus{
      form
    }
  }
}

fragment findWand on Wand{
  length
}

fragment findWizard on Wizard{
  name,
  patronus{
    form
  }
}

query findStuff($houseId: Int, $wandId: Int, $wizardId: Int){
  house: house(id: $houseId){
    ...findHouse
  },
  wand: wand(id: $wandId){
    ...findWand
  },
  wizard: wizard(id: $wizardId){
    ...findWizard
  }
}

{
  "houseId": 2,
  "wandId": 1,
  "wizardId": 4
}