//
//  ModaisMateriaView.swift
//  CoStudyOficial
//
//  Created by found on 21/02/25.
//
import SwiftUI

struct ModalCriarTopicoView : View {
    
    @Binding var materia : Materia
    @State private var nomeTopico : String = ""
    
    func adicionarTopico() {
        let novoTopico = Topico(nome: nomeTopico, conteudos: [])
        materia.topicos.append(novoTopico)
        nomeTopico = ""
    }
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Color(hex: "FFFBEF")
                .ignoresSafeArea(.all)
                .allowsHitTesting(false)
            
            NavigationStack {
                VStack (alignment: .leading, spacing: 10) {
                    HStack {
                        Text("Nome")
                            .foregroundStyle(.black)
                            .padding(.trailing, 45.5)
                        TextField("Digite aqui", text: $nomeTopico)
                    }
                    Divider()
                        .presentationDragIndicator(.visible)
                }
                .padding(.horizontal, 16)
                .toolbar {
                    ToolbarItem(placement: .navigation) {
                        Button("Voltar") {
                            dismiss()
                        }
                    }
                    
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Adicionar") {
                            adicionarTopico()
                            dismiss()
                        }
                        .disabled(nomeTopico.isEmpty)
                    }
                }
            }
            
        }
    }
}

struct ModalCriarConteudoView: View {
    
    @Binding var topico: Topico
    @State private var nomeConteudo: String = ""
    @State private var paginaDeTexto: String = ""
    
    @Environment(\.dismiss) var dismiss
    
    func adicionarConteudo() {
        let novoConteudo = Conteudo(nome: nomeConteudo, paginaDeTexto: paginaDeTexto)
        topico.conteudos.append(novoConteudo)
        nomeConteudo = ""
        paginaDeTexto = ""
    }
    
    var body: some View {
        ZStack {
            Color(hex: "FFFBEF")
                .ignoresSafeArea(.all)
                .allowsHitTesting(false)
            
            NavigationStack {
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Text("Nome")
                            .foregroundStyle(.black)
                            .padding(.trailing, 45.5)
                        TextField("Digite aqui", text: $nomeConteudo)
                    }
                    Divider()
                        .presentationDragIndicator(.visible)
                }
                .padding(.horizontal, 16)
                .toolbar {
                    ToolbarItem(placement: .navigation) {
                        Button("Voltar") {
                            dismiss()
                        }
                    }
                    
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Adicionar") {
                            adicionarConteudo()
                            dismiss()
                        }
                        .disabled(nomeConteudo.isEmpty)
                    }
                }
            }
        }
    }
}

