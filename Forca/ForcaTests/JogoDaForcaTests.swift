//
//  JogoDaForcaTests.swift
//  ForcaTests
//
//  Created by Juan Andrey Valverde Malska on 21/07/22.
//

import Foundation
import XCTest
@testable import Forca

class JogoDaForcaTests: XCTestCase {
    
    // SYSTEM UNDER TEST
    var sut: JogoDaForca?
    
    override func setUp() {
        sut = .init(palavra: "abelha", dica: "inseto")
    }
    
    func test_tentar_withTwoLetterRight_whenTryingARightLetter_shouldNotHaveAnyErrors() throws {
        // Given
        let sut = try XCTUnwrap(sut)
        sut.tentar(letra: "a")
        sut.tentar(letra: "b")
        
        // When
        sut.tentar(letra: "e")
        
        // Then
        XCTAssertEqual(sut.erros, 0)
        
    }
    
    func test_tentar_withTwoLettersRight_whenTryingAWrongLetter_shouldHaveOneError() throws {
        // Given
        let sut = try XCTUnwrap(sut)
        sut.tentar(letra: "a")
        sut.tentar(letra: "b")
        
        // When
        sut.tentar(letra: "X")
        
        // Then
        XCTAssertEqual(sut.erros, 1)
    }
    
    func test_letraVazia() throws {
        let sut = try XCTUnwrap(sut)
        sut.tentar(letra: "")
        
        XCTAssertEqual(sut.erros, 0)
        
    }
    
}
