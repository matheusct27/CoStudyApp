//
//  TopicoModel.swift
//  CoStudyOficial
//
//  Created by found on 11/02/25.
//
import SwiftUI

struct Topico: Identifiable {
    let id = UUID()
    var nome : String
    var conteudos : [Conteudo]
}
