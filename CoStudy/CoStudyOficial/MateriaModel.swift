//
//  MateriaModel.swift
//  CoStudyOficial
//
//  Created by found on 25/02/25.
//
import SwiftUI

struct Materia: Identifiable {
    let id = UUID()
    var nome: String
    var responsavel : String
    var topicos : [Topico]
}
