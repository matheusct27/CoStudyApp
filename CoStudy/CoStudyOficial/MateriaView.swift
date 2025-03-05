//
//  MateriaView.swift
//  CoStudyOficial
//
//  Created by found on 19/02/25.
//
import SwiftUI

struct MateriaView: View {
    @Binding var materia: Materia
    @State private var ModalCriarTopico = false
    @State private var indiceTopicoSelecionado: Int? = nil
    @State private var ModalCriarConteudo = false
    @State private var topicosEmExpansao: Set<UUID> = []
    @State private var searchTerm: String = ""
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Color(hex: "FFFBEF")
                .ignoresSafeArea(.all)
                .allowsHitTesting(false)
            
            VStack {
                // Título
                HStack {
                    Text("Conteúdos")
                        .font(.system(size: 31, weight: .semibold))
                        .tracking(1.5)
                        .padding(.leading)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                ScrollView {
                    if !materia.topicos.isEmpty {
                        SearchBar(text: $searchTerm)
                    }
                    LazyVStack {
                        
                        
                        
                        ForEach($materia.topicos) { $topico in
                            VStack {
                                HStack {
                                    Text(topico.nome)
                                    Spacer()
                                    Image(systemName: topicosEmExpansao.contains(topico.id) ? "chevron.up" : "chevron.down")
                                        .foregroundStyle(Color(hex: "00504C"))
                                }
                                .onTapGesture {
                                    if topicosEmExpansao.contains(topico.id) {
                                        topicosEmExpansao.remove(topico.id)
                                    } else {
                                        topicosEmExpansao.insert(topico.id)
                                    }
                                }
                                
                                Divider().padding(.bottom, 8)
                                
                                // Se o tópico estiver expandido
                                if topicosEmExpansao.contains(topico.id) {
                                    VStack(alignment: .leading) {
                                      
                                        HStack {
                                            Button(action: {
                                                indiceTopicoSelecionado = materia.topicos.firstIndex(where: { $0.id == topico.id })
                                                ModalCriarConteudo = true
                                            }) {
                                                Image(systemName: "plus.square.fill")
                                                    .foregroundStyle(Color(hex: "00504C"))
                                                    .font(.system(size: 20))
                                                    .padding(.horizontal, 16)
                                            }
                                            Text("Adicionar Conteúdo")
                                                .font(.system(size: 15).bold())
                                                .foregroundStyle(Color(hex: "3C3C43"))
                                        }
                                        
                                        Divider().padding(.bottom, 8)
                                        
                                        // Lista de conteúdos dentro do tópico
                                        TopicosView(topico: $topico)
                                    }
                                    .padding(.horizontal, 16)
                                }
                            }
                            .padding(.horizontal, 16)
                        }
                    }
                }
                .overlay {
                    if materia.topicos.isEmpty {
                        ContentUnavailableView(label: {
                            HStack {
                                Spacer()
                                Image(systemName: "arrow.turn.right.up")
                                    .foregroundStyle(Color(hex: "D1D1D1"))
                                    .font(.system(size: 60))
                                    .offset(y: -240)
                                    .padding(.trailing, -27)
                            }
                            Label {
                                Text("Que tal adicionarmos um tópico?")
                                    .fontWeight(.regular)
                            } icon: {
                                Image(systemName: "document.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 152, height: 115)
                                    .foregroundColor(Color(hex: "D1D1D1"))
                            }
                        }, description: {
                            Text("Clique no botão sinalizado para adicionar um novo tópico!")
                                .padding(.horizontal)
                                .padding(.trailing, 16)
                                .padding(.leading, 16)
                        })
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .navigationBarBackButtonHidden(true)
            .navigationTitle(materia.nome)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigation) {
                    Button(action: { dismiss() }) {
                        HStack {
                            Image(systemName: "chevron.left")
                                .foregroundStyle(Color(hex: "00504C"))
                            Text("Matérias")
                                .tint(Color(hex: "00504C"))
                        }
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button(action: {
                        ModalCriarTopico = true
                    }) {
                        Image(systemName: "plus.square.fill")
                            .foregroundStyle(Color(hex: "00504C"))
                            .font(.system(size: 25))
                    }
                    .tint(Color(hex: "00504C"))
                }
            }
            .sheet(isPresented: $ModalCriarTopico) {
                ModalCriarTopicoView(materia: $materia)
                    .presentationDetents([.fraction(0.2)])
            }
            .sheet(isPresented: $ModalCriarConteudo) {
                if let indice = indiceTopicoSelecionado {
                    ModalCriarConteudoView(topico: $materia.topicos[indice])
                        .presentationDetents([.fraction(0.2)])
                }
            }
        }
    }
}

struct TopicosView: View {
    @Binding var topico: Topico

    var body: some View {
        ForEach($topico.conteudos) { $conteudo in
            NavigationLink(destination: ConteudoView(conteudo: conteudo)) {
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "document.fill")
                            .foregroundStyle(Color(hex: "00504C"))
                            .font(.system(size: 20))
                            .padding(.horizontal, 16)
                        Text(conteudo.nome)
                            .foregroundStyle(Color(hex: "3C3C43"))
                    }
                    Divider().padding(.bottom, 8)
                }
            }
        }
    }
}
