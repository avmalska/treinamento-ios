//
//  JogoDaMemoria.swift
//  Memoria
//
//  Created by Juan Andrey Valverde Malska on 22/07/22.
//

import Foundation

class JogoDaMemoria {
    var gameCardsNumbersArray = bonecosNumeros + bonecosNumeros
    
    func randomize() {
        gameCardsNumbersArray = gameCardsNumbersArray.shuffled()
    }
}



let bonecosNumeros = ["001", "002", "003", "004", "005"]
