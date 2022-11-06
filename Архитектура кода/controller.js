class Controller {

    firstRoundCompetition(stgeCount) {
        this.competition = new Competition(stgeCount);

        return View.resultRound(this.competition.ferstRound(stgeCount), stgeCount, 'ПЕРВОГО');
    }

    secondtRoundCompetition() {

        return View.resultRound(this.competition.secondRound(), 2, 'ВТОРОГО');
    }
}