//
//  ModaisTurmaView.swift
//  CoStudyOficial
//
//  Created by found on 19/02/25.
//
import SwiftUI

/*
struct ModalCriarMateriaView : View {
    
    //Variáveis
    @Binding var turma : Turma
    @State private var ModalCriacaoDeMateria = false
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Color(hex: "FFFBEF")
                .ignoresSafeArea(.all)
                .allowsHitTesting(false)
            
            NavigationStack {
                VStack{
                    Button(action: {
                        ModalCriacaoDeMateria = true
                    }, label: {
                        ZStack{
                            Rectangle()
                                .foregroundColor(Color(hex:"298B87"))
                                .cornerRadius(15)
                                .foregroundStyle(.white)
                                .frame(width: 337 , height: 44)
                            HStack {
                                Text("Criar matéria")
                                    .foregroundStyle(.white)
                                    .font(.headline)
                                
                                Spacer()
                                
                                Image(systemName: "folder.fill.badge.plus")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 20))
                            }
                            .padding(.horizontal, 20)
                        }
                        
                    })
                    .sheet(isPresented: $ModalCriacaoDeMateria) {
                        ModalCriacaoDeMateriaView(turma: $turma)
                            .presentationDetents([.fraction(0.2)])
                    }
                    .padding(.horizontal)
                    .padding(.horizontal)
                }
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Cancelar") {
                            dismiss()
                        }
                    }
                }
            }
        }
    }
}
*/

struct ModalCriacaoDeMateriaView : View {
    
    //Variáveis
    @Binding var turma : Turma
    @State private var nomeMateria: String = ""
    @Environment(\.dismiss) var dismiss
    @State var responsavel = ""
    
    //Funções
    func adicionarMateria() {
        let novaMateria = Materia(nome: nomeMateria, responsavel: responsavel, topicos: [])
        turma.materias.append(novaMateria)
        nomeMateria = ""
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("Nome")
                        .padding(.trailing, 45.5)
                    TextField("Digite aqui", text: $nomeMateria)
                }
                Divider()
                    .padding(.bottom, 16)
                
                HStack {
                    Text("Responsável")
                        .padding(.trailing, 16)
                    TextField("Digite aqui", text: $responsavel)
                }
                Divider()

                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancelar") {
                                dismiss()
                            }
                        }
                        
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Adicionar") {
                                adicionarMateria()
                                dismiss()
                            }
                            .disabled(nomeMateria.isEmpty)
                        }
                    }
            }
            .padding(.horizontal, 16)
        }
    }
}

struct ModalConfigurarMateriaView : View {
    var body: some View {
        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Hello, world!@*/Text("Hello, world!")/*@END_MENU_TOKEN@*/
    }
}
