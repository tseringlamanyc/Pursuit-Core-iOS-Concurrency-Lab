# Pursuit-Core-iOS-Concurrency-Lab

# Summary

Create an app that loads a list of countries.  Selecting a country will go to a detail view controller with more information about that country, including the conversion rate from their currency into USD.

## Endpoints:

- https://restcountries.eu/rest/v2/name/united
- https://api.fixer.io/latest?base=USD
- https://www.metaweather.com/api/
 

## View Controller One:

This view controller should contain a:

- Search Bar
- Table View

Entering a term in the search bar should load the countries with a name matching the search term.  Each cell should have:

- An image of the flag
- The country's name
- The country's capital
- The country's population
- Selecting on a cell should segue to another View Controller

## View Controller Two:

An image of the flag
- The country's name
- The country's capital
- The country's population

## Bonus: Combining APIs

The detail View Controller should also show the following properties.  You will need to make a different network call to get this information:

- The currency and the currency's value in USD
- The current weather

