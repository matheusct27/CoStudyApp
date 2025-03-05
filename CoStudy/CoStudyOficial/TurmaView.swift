//
//  TurmaView.swift
//  CoStudyOficial
//
//  Created by found on 11/02/25.
//
import SwiftUI

struct TurmaView: View {
    
    @Binding var turma: Turma
    @State private var ModalCriarMateria = false
    @State var ModalConfigurarMateria = false
    @State private var searchTerm: String = ""
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Color(hex: "FFFBEF")
                .ignoresSafeArea(.all)
                .allowsHitTesting(false)
            
            VStack(alignment: .leading) {
               
                VStack(alignment: .leading) {
                    Text("Matérias")
                        .font(.system(size: 31, weight: .semibold))
                        .tracking(1.5)
                        .padding(.leading)
                    
                    Text("Código da turma: \(turma.codigo)")
                        .padding(.leading)
                        .fontWeight(.light)
                        .italic()
                }
                .padding(.top, 10)
                
                
                ScrollView {
                    if !turma.materias.isEmpty {
                        VStack {
                            SearchBar(text: $searchTerm)
                            FiltroSemanaView()
                                .padding(.horizontal, 16)
                                .padding(.bottom, 16)
                        }
                        .padding(.horizontal, 16)
                    }
                    LazyVStack {
                        ForEach($turma.materias, id: \.id) { $materia in
                            NavigationLink(destination: MateriaView(materia: $materia)) {
                                ZStack {
                                    VStack {
                                        HStack {
                                            Image(systemName: "book.fill")
                                                .foregroundStyle(.white)
                                                .font(.system(size: 45))
                                            
                                            VStack(alignment: .leading) {
                                                Text(materia.nome)
                                                    .font(.headline)
                                                    .foregroundColor(.white)
                                                    .padding(.top, 8)
                                                
                                                Text(materia.responsavel)
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
                                    }
                                }
                            }
                        }
                    }
                }
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: { dismiss() }) {
                        HStack {
                            Image(systemName: "chevron.left")
                                .foregroundStyle(Color(hex: "00504C"))
                            Text("Turmas")
                                .tint(Color(hex: "00504C"))
                        }
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        ModalCriarMateria = true
                    }) {
                        Image(systemName: "plus.square.fill")
                            .foregroundStyle(Color(hex: "00504C"))
                            .font(.system(size: 25))
                    }
                    .tint(Color(hex: "00504C"))
                }
            }
            .sheet(isPresented: $ModalCriarMateria) {
                ModalCriacaoDeMateriaView(turma: $turma)
                    .presentationDetents([.fraction(0.2)])
                    
            }
        }
        .overlay {
            if turma.materias.isEmpty {
                ContentUnavailableView(label: {
                    HStack {
                        Spacer()
                        
                        Image(systemName: "arrow.turn.right.up")
                            .foregroundStyle(Color(hex: "D1D1D1"))
                            .font(.system(size: 60))
                            .offset(y: -225)
                            .padding(.trailing, -27)
                    }
                    Label {
                        Text("Adicione uma matéria!")
                            .fontWeight(.regular)
                    } icon: {
                        Image(.elBook)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 152, height: 115)
                            .foregroundColor(Color(hex: "D1D1D1"))
                        
                        
                    }
                }, description: {
                    Text("Sem matérias por enquanto, tente adicionar uma!")
                        .padding(.horizontal)
                        .padding(.trailing, 16)
                        .padding(.leading, 16)
                })
            }
        }
    }
}
