//
//  ProfileView.swift
//  CoStudyOficial
//
//  Created by found on 11/02/25.
//
import SwiftUI

struct PerfilView: View {
    
    var body: some View {
        ZStack {
            Color(hex: "FFFBEF")
                .ignoresSafeArea(.all)
                .allowsHitTesting(false)
            
            VStack{
                Image(systemName: "person.circle.fill")
                    .font(.system(size: 96))
                    .foregroundStyle(Color(hex: "00504C"))
                Text("Usuário")
                HStack {
                    
                }
            }
        }
    }
}
