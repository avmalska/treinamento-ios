//
//  JogoDaForca.swift
//  Forca
//
//  Created by Juan Andrey Valverde Malska on 19/07/22.
//

import Foundation

class JogoDaForca {
    let palavra: String
    let dica: String
    
    private(set) var palavraMascarada: String
    private(set) var tentativasAnteriores: [String] = []
    private(set) var erros: Int = 0 {
        didSet {
            if erros > 5 {
                estadoDoJogo = .derrota
            }
        }
    }
    private(set) var estadoDoJogo: EstadoDoJogo = .emAndamento
    
    init(palavra: String, dica: String) {
        self.palavra = palavra.uppercased()
        self.dica = dica
        
        self.palavraMascarada = palavra.map { _ in "_" }.joined()
    }
    
    func tentar(letra: String) {
        guard let letraComparavel = letra.first?.comparavel else {
            return
        }
        
        guard !tentativasAnteriores.contains(letraComparavel) else {
            return
        }
        
        tentativasAnteriores.append(letraComparavel)
        
        guard palavra.contains(letraComparavel) else {
            erros += 1
            
            return
        }
        
        palavraMascarada = troca(letra: letraComparavel, na: palavraMascarada, original: palavra)
        
        if palavraMascarada.comparavel == palavra {
            estadoDoJogo = .vitoria
        }
    }
    
    
}

extension JogoDaForca {
    
    class func aleatorio() -> JogoDaForca {
        
        guard let item = palavras.randomElement() else {
            return .init(palavra: "abelha", dica: "inseto")
        }
        
        return .init(palavra: item.key, dica: item.value)
    }
}

enum EstadoDoJogo {
    case vitoria
    case emAndamento
    case derrota
}

let palavras = [
    "abelha": "inseto",
    "formiga": "inseto",
    "macaco": "animal",
    "cabra": "animal"
]
