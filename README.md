# Vest
>Vest is a personal investment management tool, powered by the D3.js graphing library, Ruby on Rails, the Alpha Vantage API, and the IEXTrading API.
![Portfolio](https://github.com/joshseyda/vest/blob/master/app/assets/images/Screen%20Shot%202018-06-06%20at%2023.20.31.png?raw=true)
![Asset](https://github.com/joshseyda/vest/blob/master/app/assets/images/Screen%20Shot%202018-06-06%20at%2023.19.59.png?raw=true)
---
![GitHub issue age](https://img.shields.io/badge/created%20on-2018--06--01-brightgreen.svg)
![GitHub closed pull requests](https://img.shields.io/badge/closed%20pull%20requests-09-blue.svg) 
![CocoaPods](https://img.shields.io/cocoapods/l/AFNetworking.svg)
---
## Table of Contents

- [Inspiration](#inspiration)
- [How to Use](#how-to-use)
- [Build Status](#build-status)
- [Code Example](#code-style)
- [Code Example](#code-example)
- [Goals](#goals)
- [Features](#features)
	- [Technologies](#technologies)
- [License](#license)
---
## Inspiration

This page was designed as a final project for my New York Code + Design Academy final project. After being blown away by D3 data visualizations I had seen, I decided to begin learning the basics of it. I am interested in Finance and Economics, and thought there was plenty of room to build out custom asset tracking, and potentially build some algorithmic trading functions. After realizing the limited scope of what I could accomplish in a week, I decided on focusing on pulling basic data and graphing it to start. 

## How To Use

Log-in with the email: ebonygoodwin@mann.info and password: password

Browse the NYSE page for stocks to view and add, play with the Line Graph on individual asset page, go to Home to view the user's portfolio with asset information and Donut Chart for Portfolio breakdown. 

## Build Status

Vest is currently a crude sketch of the functions to come. This is the absolute MVP to showcase the minimal data from 2 APIs(with tested Cryptocurrency functions), and 2 basic data visualizations(with a third 'Current Sector Performace' Bar Graph almost ready to deploy). After polisihing these components I want to add Gain/Loss tracking, interactive chart animations, toggling timescales and options on graphs, date of entry into a holding, additional asset types, comprehensive asset search, and Google Search API for News Updates on user holdings. 

## Code Style

The state of the codebase is absolutely what was essential to build out in 5 days. The main breadth of my work was done on the users#index file, where I am iterating through the user's portfolio on the Postgresql database, passing each element from Ruby into JavaScript AJAX calls, building custom objects from the response, and using that the graph with D3. This technique was able to make the project work, but moving forward I want to refactor and componetize the database calls and the client side data manipulation. 

## Code Example
#### This is how I structured my API data before rendering 
```javascript
        let symbol_key = data["Meta Data"]["2. Symbol"];
        let last_price = data["Time Series (1min)"];
        let price_key = Object.keys(last_price)[0];
        let first_value = last_price[price_key]["4. close"];
        let final_value = (first_value * <%= holding.num_of_shares %>);
        let holding_hash = {name: symbol_key , price: final_value};
        portfolio.push(holding_hash);
```
#### Here is the begining of invoking the SVG element and passing elements from my object to be graphed
```javascript
         var svg2 = d3.select("#graph-div").append("svg")
            .attr("width", width)
            .attr("height", height)
            .append("g")
            .attr("transform", "translate(" + width / 2 + "," + height / 2 + ")");
                            
            portfolio.forEach(function(d) {
            d.price = +d.price;
            d.name = d.name;
            })

         var g2 = svg2.selectAll(".arc2")
            .data(pie(Object.values(portfolio)))
            .enter().append("g")
            .attr("class", "arc2");

         g2.append("path")
            .attr("data-toggle", "tooltip")
            .attr("data-placement", "auto")
            .attr("data-trigger", "click hover")
            .attr("title", function(d){ return `$${d.data.price.toFixed(2)}`})
            .attr("d", arc2)
            .style("fill", function(d) {return color(d.data.name); })
            .transition()
            .ease(d3.easeLinear)
            .duration(2000)
            .attrTween("d", tweenDonut);

        g2.append("text")
            .transition()
            .ease(d3.easeLinear)
            .duration(2000)
            .attr("transform", function(d) { return "translate(" + labelArc.centroid(d) + ")"; })
            .attr("dy", ".35em")
            .text(function(d) { return d.data.name ; }); 
```
## Goals

My ultimate goal is to be able to showcase dynamic, interactive data visualizations that make powerful data easy to understand and engaging. I would also like to employ Web Sockets and perhaps Firebase for real-time rendering of data. Beyond that I would like to explore financial modeling and analysis on the back end of the application.

## Features

1. User accounts and Portfolios
2. Dynamic rendering of Current Stock information
3. Graphical Representations of data written in JavaScript

### Technologies

* D3.js for Data Visualization
* Devise for User Authentication
* AlphaVantage API
* IEXTRADE API
* Bootstrap UI
* jQuery
* Ruby on Rails



## License
MIT License

Copyright (c) [2018] [Josh Seyda]

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
