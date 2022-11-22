'use strict'

class View {

    // Валидация значений во view
    static chekNumber(message) {
        let num;
        do {
            num = prompt(message);
            if (num == null) return false;
            if (num != null) {
                num = +num;
                if (isNaN(num) || num <= 0 || !Number.isInteger(num)) {
                    alert('Ввeдите целое число, больше нуля!');
                }
            }
        } while (isNaN(num) || num <= 0 || !Number.isInteger(num));
        return num;        
    }

    constructor() {
        alert('Результат соревнований выводиться в консоль!');

        const stgeCount = View.chekNumber('Введите число этапов первого круга!');

        if (stgeCount !== false) {
            this.controller = new Controller(stgeCount);
            this.controller.firstRoundCompetition(stgeCount)
        }
    }

    // метод печати результата в консоль
    static resultRound({countryArr, cyclistArr}, stgeCount, numberRound) {
        console.log(`---ИТОГОВЫЙ ПРОТОКОЛ ${numberRound} КРУГА-----`);
        console.log(`  *******${stgeCount} этапа(ов) круга*******        `);
        console.log('------Общий зачёт по странам-------');
        for (let i = 0; i < countryArr.length; i++) {
            console.log(`${i+1} место - ${countryArr[i].country}`);
        }
        console.log('      **********************        ');
        console.log(`-----------Личный зачёт---------`);
        for (let i = 0; i < cyclistArr.length; i++) {
        console.log(`${cyclistArr[i].ratingCyclist} ${cyclistArr[i].surname} ${cyclistArr[i].name} - ${cyclistArr[i].country}`);
        }
    }
}

//------------------------------------------------------

// точка запуска
const view = new View;




