//
//  ConteudoView.swift
//  CoStudyOficial
//
//  Created by found on 21/02/25.
//
import SwiftUI

struct ConteudoView: View {
    var conteudo: Conteudo
    @Environment(\.dismiss) var dismiss

    @State private var paginaDeTexto: String = ""

    init(conteudo: Conteudo) {
        self.conteudo = conteudo
        let savedText = UserDefaults.standard.string(forKey: "paginaDeTexto_\(conteudo.id)")
        _paginaDeTexto = State(initialValue: savedText ?? conteudo.paginaDeTexto)
    }

    var body: some View {
        let binding = Binding<String>(get: {
            self.paginaDeTexto
        }, set: {
            self.paginaDeTexto = $0
            UserDefaults.standard.set($0, forKey: "paginaDeTexto_\(conteudo.id)")
        })

        return ZStack {
            Color(hex: "FFFBEF")
                .ignoresSafeArea(.all)
                .allowsHitTesting(false)

            VStack {
                ScrollView {
                    TextField("Digite aqui...", text: binding, axis: .vertical)
                }
            }
            .frame(alignment: .topLeading)
            .padding(16)
            .navigationBarBackButtonHidden(true)
            .navigationTitle(conteudo.nome)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: { dismiss() }) {
                        HStack {
                            Image(systemName: "chevron.left")
                                .foregroundStyle(Color(hex: "00504C"))
                            Text("Conteúdos")
                                .tint(Color(hex: "00504C"))
                        }
                    }
                }
            }
        }
    }
}
