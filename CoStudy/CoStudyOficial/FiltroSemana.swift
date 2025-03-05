//
//  FiltroSemana.swift
//  CoStudyOficial
//
//  Created by found on 27/02/25.
//
import SwiftUI

struct FiltroSemanaView: View {
    @State private var diaSemana = 0

    var body: some View {
        VStack {
            Picker("What is your favorite color?", selection: $diaSemana) {
                Text("Segunda").tag(0)
                Text("Terça").tag(1)
                Text("Quarta").tag(2)
                Text("Quinta").tag(3)
                Text("Sexta").tag(4)
            }
            .pickerStyle(.segmented)
        }
    }
}
