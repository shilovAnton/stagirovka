"use strict";
//возвращает максимальное значение в массиве
function getMaxOfArray(numArray) {
    return Math.max.apply(null, numArray);
}

//возвращает минимальное значение в массиве
function getMinOfArray(numArray) {
    return Math.min.apply(null, numArray);
}

//возвращает сумму значений массива
function arraySum(array) {
    let sum = 0;
    for(let i = 0; i < array.length; i++){
        sum += array[i];
    }
    return sum;
}

//Класс велосопидист
class Cyclist {
    static countCyclist = 0;
    
    timeFirstRound = [];
    timeSecondRound = [];

    placeCyclistFirstRound = [];
    placeCyclistSecondRound = [];

    constructor(surname, name, country) {
        Cyclist.countCyclist++;
        this.cyclistNumber = Cyclist.countCyclist;
        this.surname = surname;
        this.name = name;
        this.country = country;
        this.ratingCyclist = 0;
    }
}

class Сountry {
    cyclistCountry = [];

    finalResultFirstRound;
    placeСountryFirstRound = [];
    placeСountryFirstRoundLuser = [];
    placeСountryFirstRoundTop;

    constructor(cyclistArr, country) {
        this.cyclistArr = cyclistArr;
        this.country = country;
    }

    setCyclistsCountry() {
        for (let i = 0; i < this.cyclistArr.length; i++) {
            if (this.cyclistArr[i].country === this.country) {
                this.cyclistCountry.push(this.cyclistArr[i]);
            }
        }
    }
}

class FirstRound {
    constructor(N, cyclistArr, countryArr) {
        this.amountStage = N;
        this.cyclistArr = cyclistArr;
        this.countryArr = countryArr;
    }

    setFinalResultFirstRound() {
        this.countryArr.sort(function(a, b) {
            if (arraySum(a.placeСountryFirstRound) === arraySum(b.placeСountryFirstRound)) {
                if (a.placeСountryFirstRoundTop > b.placeСountryFirstRoundTop) {
                    return -1;
                } else {
                    return 1;
                }
            }
            return arraySum(a.placeСountryFirstRound) - arraySum(b.placeСountryFirstRound);
        });
    }

    setTopCyclistCountry() {
        for (let i = 0; i < this.countryArr.length; i++) {
            let tmp = [];
            for (let j = 0; j < this.countryArr[i].cyclistCountry.length; j++) {
                tmp.push(this.countryArr[i].cyclistCountry[j].ratingCyclist);
            }
            this.countryArr[i].placeСountryFirstRoundTop = getMaxOfArray(tmp);
        }
    }

    randTime() {
        let minMinut = 30;
        let maxMinut = 45;
        let min = 0;
        let max = 60;

        let minutes = Math.round(Math.random() * (maxMinut - minMinut) + minMinut);
        let sec = Math.round(Math.random() * (max - min) + min);
        let ms = Math.round(Math.random() * (max - min) + min);
        let time = new Date();
        
        return time.setHours(0, minutes, sec, ms);
    }

    setTime() {
        for (let i = 0; i < this.cyclistArr.length; i++) {
            for (let j = 0; j < this.amountStage; j++) {
                this.cyclistArr[i].timeFirstRound.push(this.randTime());
            }
        }                       
    }

    setPlaceStageLuser() {
        for (let i = 0; i < this.countryArr.length; i++) {
            for (let j = 0; j < this.amountStage; j++) {
                let tmp = [];
                for (let k = 0; k < this.countryArr[i].cyclistCountry.length; k++) {
                    tmp.push(this.countryArr[i].cyclistCountry[k].placeCyclistFirstRound[j]);
                }
                this.countryArr[i].placeСountryFirstRoundLuser.push(getMaxOfArray(tmp));
            }
        }
    }

    sortTopCyclist() {
        this.cyclistArr.sort(function(a, b) {
            return b.ratingCyclist - a.ratingCyclist;
        });
    }

    sortCountryFirstStage(i) {
        this.countryArr.sort(function(a, b) {
            return a.placeСountryFirstRoundLuser[i] - b.placeСountryFirstRoundLuser[i];
        });
    }

    setPlaceCountryFirstyStage() {
        for (let i = 0; i < this.amountStage; i++) {
            this.sortCountryFirstStage(i);
            for (let j = 0; j < this.countryArr.length; j++) {
                this.countryArr[j].placeСountryFirstRound.push(j+1);
            }
        }
    }

    sortTime(k) {
        for (let i = 0; i < this.cyclistArr.length-1; i++) {
            for (let j = 0; j < this.cyclistArr.length-i-1; j++) {
                if (this.cyclistArr[j].timeFirstRound[k] > this.cyclistArr[j+1].timeFirstRound[k]) {
                    let tmp = this.cyclistArr[j+1];
                    this.cyclistArr[j+1] = this.cyclistArr[j];
                    this.cyclistArr[j] = tmp;   
                }
            }
        }
    }

    setPlaceFirstRound() {
        for (let i = 0; i < this.amountStage; i++) {
            this.sortTime(i);
            for (let j = 0; j < this.cyclistArr.length; j++) {
                this.cyclistArr[j].placeCyclistFirstRound.push(j+1);
                this.cyclistArr[j].ratingCyclist += this.cyclistArr.length - j;
            }
        }
    }
}

class SecondRound extends FirstRound {
    amountStage = 2;
    placeСountrySecondRound = [];

    constructor(cyclistSecond, countrySecond) {
        super(cyclistSecond);
        this.cyclistSecond = cyclistSecond;
        this.countrySecond = countrySecond;
    }

    setTime() {
        for (let i = 0; i < this.cyclistSecond.length; i++) {
            for (let j = 0; j < this.amountStage; j++) {
                this.cyclistSecond[i].timeSecondRound.push(super.randTime());
            }
        }  
    }

    sortTimeCountru(k) {
        for (let i = 0; i < this.cyclistSecond.length-1; i++) {
            for (let j = 0; j < this.cyclistSecond.length-i-1; j++) {
                if (this.cyclistSecond[j].timeSecondRound[k] > this.cyclistSecond[j+1].timeSecondRound[k]) {
                    let tmp = this.cyclistSecond[j+1];
                    this.cyclistSecond[j+1] = this.cyclistSecond[j];
                    this.cyclistSecond[j] = tmp;   
                }
            }
        }
    }

    setPlaceSecondRound() {
        for (let i = 0; i < this.amountStage; i++) {
            this.sortTimeCountru(i);
            for (let j = 0; j < this.cyclistSecond.length; j++) {
                this.cyclistSecond[j].placeCyclistSecondRound.push(j+1);
                this.cyclistSecond[j].ratingCyclist += this.cyclistSecond.length - j;
            }
        }
    }


}

class Competition {

    ferstRound(stgeCount) { 
        let cyclistArr = [
            new Cyclist('Shilov', 'Anton', 'Russia'),
            new Cyclist('Borisov', 'Ivan', 'Russia'),
            new Cyclist('Kusnecov', 'Oleg', 'Russia'),
            new Cyclist('Ivanov', 'Pavel', 'Russia'),

            new Cyclist('Monti', 'Abele', 'Italy'),
            new Cyclist('Rossi', 'Andrea', 'Italy'),
            new Cyclist('Esposito', 'Mario', 'Italy'),
            new Cyclist('Bruno', 'Fernando', 'Italy'),

            new Cyclist('Nielsen', 'Peter', 'Denmark'),
            new Cyclist('Andersen', 'Martin', 'Denmark'),
            new Cyclist('Thomsen', 'Hans', 'Denmark'),
            new Cyclist('Poulsen', 'Ole', 'Denmark'),

            new Cyclist('Peeters', 'Alexis', 'Belgium'),
            new Cyclist('Janssens', 'Clement', 'Belgium'),
            new Cyclist('Willems', 'Jelle', 'Belgium'),
            new Cyclist('Goossens', 'Louis', 'Belgium'),

            new Cyclist('Balestre', 'Andre', 'France'),
            new Cyclist('Guichard', 'Bernard', 'France'),
            new Cyclist('Dufour', 'Lammert', 'France'),
            new Cyclist('de La Fare', 'Mishel', 'France'),

            new Cyclist('Fischer', 'Peter', 'Germany'),
            new Cyclist('Schneider', 'Stephan', 'Germany'),
            new Cyclist('Meyer', 'Uwe', 'Germany'),
            new Cyclist('Müller', 'Jorg', 'Germany'),

            new Cyclist('Alonso', 'Agustín', 'Spain'),
            new Cyclist('Ferrer', 'Gustavo', 'Spain'),
            new Cyclist('Castillo', 'Benito', 'Spain'),
            new Cyclist('Rubio', 'Francisco', 'Spain'),

            new Cyclist('Silva', 'Alessandro', 'Portugal'),
            new Cyclist('Ferreira', 'Caio', 'Portugal'),
            new Cyclist('Oliveira', 'Diogo', 'Portugal'),
            new Cyclist('Rodrigues', 'Elvis', 'Portugal'),

            new Cyclist('Williams', 'Ethan', 'USA'),
            new Cyclist('Smith', 'Michael', 'USA'),
            new Cyclist('Thompson', 'Jacob', 'USA'),
            new Cyclist('Scott', 'Oscar', 'USA'),

            new Cyclist('Abramson', 'Jack', 'Great Britain'),
            new Cyclist('Cook', 'Charley', 'Great Britain'),
            new Cyclist('Dyson', 'George', 'Great Britain'),
            new Cyclist('Goodman', 'Harry', 'Great Britain'),
        ]

        let countryArr = [
            new Сountry(cyclistArr, 'Russia'),
            new Сountry(cyclistArr, 'Italy'),
            new Сountry(cyclistArr, 'Denmark'),
            new Сountry(cyclistArr, 'Belgium'),
            new Сountry(cyclistArr, 'France'),
            new Сountry(cyclistArr, 'Germany'),
            new Сountry(cyclistArr, 'Spain'),
            new Сountry(cyclistArr, 'Portugal'),
            new Сountry(cyclistArr, 'USA'),
            new Сountry(cyclistArr, 'Great Britain'),
        ]

        for (let i = 0; i < countryArr.length; i++) {
            countryArr[i].setCyclistsCountry();
        }

        let firstRound = new FirstRound(stgeCount, cyclistArr, countryArr);

        firstRound.setTime();

        firstRound.setPlaceFirstRound();

        firstRound.setPlaceStageLuser();

        firstRound.setPlaceCountryFirstyStage();

        firstRound.setTopCyclistCountry();
        
        firstRound.setFinalResultFirstRound();

        firstRound.sortTopCyclist();

        this.countryArrAndcyclistArr = {countryArr: countryArr, cyclistArr: cyclistArr};

        return this.countryArrAndcyclistArr;
    }

    secondRound() {
        let countryArr = this.countryArrAndcyclistArr.countryArr;
        let cyclistArr = this.countryArrAndcyclistArr.cyclistArr;

        //переход четырёх стран во второй круг
        let cyclistSecond = [];
        let countrySecond = [];
        for (let i = 0; i < 4; i++) {
            countrySecond.push(countryArr[i]);
            for (let j = 0; j < countrySecond[i].cyclistCountry.length; j++) {
                cyclistSecond.push(countrySecond[i].cyclistCountry[j]);
            }
        }

        let secondRound = new SecondRound(cyclistSecond, countrySecond);

        secondRound.setTime();

        secondRound.setPlaceSecondRound();

        return {countryArr: countryArr, cyclistArr: cyclistArr};

        //результат второго круга высчитывается не верно
    }
}


        

