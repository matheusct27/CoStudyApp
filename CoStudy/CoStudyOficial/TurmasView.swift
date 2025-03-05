//
//  TurmasView.swift
//  CoStudyOficial
//
//  Created by found on 11/02/25.
//
import SwiftUI

struct TurmasView: View {
    
    // Variáveis
    @State var ModalConfigurar = false
    @State var ModalCriarEntrar = false
    @State var ModalCriarTurma = false
    @State private var turmaSelecionada: Turma?
    
    // Arrays
    @State var turmas: [Turma] = []
    @State var turmasTeste: [Turma] = [
        Turma(codigo: "ABC123", nome: "Matemática IV", descricao: "Análise Combinatória e Probabilidade")
    ]
    
    // Funções
    func removerTurma(_ turma: Turma) {
        turmas.removeAll { $0.id == turma.id }
    }
    
    var body: some View {
        ZStack {
            //"Filtro" amarelo
            Color(hex: "FFFBEF")
                .ignoresSafeArea(.all)
                .allowsHitTesting(false)
            
            NavigationStack {
                VStack(alignment: .leading) {
                    // Título e Botão de criar e entrar em turmas
                    HStack {
                        Text("Turmas")
                            .font(.system(size: 31, weight: .semibold))
                            .tracking(1.5)
                            .padding(.leading)
                        
                        Spacer()
                        
                        Button(action: {
                            ModalCriarEntrar = true
                        }) {
                            Label("", systemImage: "plus.square.fill")
                                .padding()
                                .font(.system(size: 40))
                                .foregroundStyle(Color(hex: "00504C"))
                        }
                    }
                    .sheet(isPresented: $ModalCriarEntrar) {
                        ModalCriarEntrarView(turmas: $turmas, turmasTeste: $turmasTeste) { novaTurma in
                            turmas.append(novaTurma)
                        }
                        .presentationDetents([.fraction(0.205)])
                        .presentationDragIndicator(.visible)
                    }
                }
                
                // Lista de turmas
                ScrollView {
                    ForEach($turmas, id: \.id) { $turma in
                        NavigationLink(destination: TurmaView(turma: $turma)) {
                            ZStack {
                                HStack {
                                    Image(systemName: "person.2.fill")
                                        .foregroundStyle(.white)
                                        .font(.system(size: 45))
                                    
                                    VStack(alignment: .leading) {
                                        Text(turma.nome)
                                            .font(.headline)
                                            .foregroundColor(.white)
                                            .padding(.top, 8)
                                        
                                        Spacer()
                                        
                                        Text(turma.descricao)
                                            .font(.subheadline)
                                            .foregroundColor(.white)
                                            .padding(.bottom, 8)
                                    }
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                }
                                
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .frame(height: 113)
                                .background(Color(hex: "227673"))
                                .cornerRadius(10)
                                .shadow(radius: 6)
                                .padding(.horizontal)
                                .sheet(isPresented: $ModalConfigurar) {
                                    ModalConfigurarView(
                                        turma: $turma,
                                        removerTurma: { removerTurma(turmaSelecionada!) }
                                    )
                                    .presentationDetents([.fraction(0.3)])
                                    .presentationDragIndicator(.visible)
                                }
                            }
                            .onLongPressGesture(minimumDuration: 1.0, perform: {
                                            turmaSelecionada = turma
                                            ModalConfigurar = true
                                        })
                        }
                    }
                }
            }
            .overlay {
                if turmas.isEmpty {
                    ContentUnavailableView(label: {
                        HStack(alignment: .top) {
                            Spacer()
                            Image(systemName: "arrow.turn.right.up")
                                .foregroundStyle(Color(hex: "D1D1D1"))
                                .font(.system(size: 60))
                                .offset(y: -180)
                                .padding(.trailing, -15)
                        }
                        
                        Label {
                            Text("Crie ou entre em uma turma!")
                                .fontWeight(.regular)
                        } icon: {
                            Image(systemName: "person.2.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 152, height: 115)
                                .foregroundColor(Color(hex: "D1D1D1"))
                        }
                    }, description: {
                        Text("Clique no botão sinalizado para adicionar uma nova turma")
                            .padding(.horizontal)
                            .padding(.trailing, 16)
                            .padding(.leading, 16)
                    })
                    .padding(.top, 50)
                }
            }
        }
    }
}
