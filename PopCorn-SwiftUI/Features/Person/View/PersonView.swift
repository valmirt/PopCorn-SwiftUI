//
//  PersonView.swift
//  PopCorn-SwiftUI
//
//  Created by Valmir Junior on 04/06/21.
//

import SwiftUI

struct PersonView: View {
    @StateObject var viewModel: PersonViewModel
    
    var body: some View {
        ScrollView {
            VStack {
                ProfileImage(url: nil, width: 128, height: 128)
                    .padding()
                
                Text("Person Name")
                    .font(.title)
                
                PersonInfoView()
                
                Spacer()
            }
            .padding()
        }
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct PersonInfoView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 14) {
                Text("🎁 Birthday: yyyy/MM/dd")
                    .font(.body)
                    .fontWeight(.light)
                Text("🪦 Deathday: yyyy/MM/dd")
                    .font(.body)
                    .fontWeight(.light)
                Text("Department: ")
                    .font(.body)
                    .fontWeight(.light)
                Text("Popularity: ")
                    .font(.body)
                    .fontWeight(.light)
                Text("Place of Birth: ")
                    .font(.body)
                    .fontWeight(.light)
                Text("Biography: ")
                    .font(.title2)
                    .fontWeight(.medium)
                    .padding(.top)
                
                Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
                    .font(.body)
                    .fontWeight(.light)
                    .lineLimit(nil)
                    .padding(.top, 6)
                    .fixedSize(horizontal: false, vertical: true)
            }
            Spacer()
        }
        .padding(.top)
    }
}

struct PersonView_Previews: PreviewProvider {
    static var previews: some View {
        PersonView(viewModel: PersonViewModel(idPerson: -1))
    }
}
