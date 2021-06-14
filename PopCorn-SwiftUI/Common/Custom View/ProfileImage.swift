//
//  ProfileImage.swift
//  PopCorn-SwiftUI
//
//  Created by Valmir Junior on 04/06/21.
//

import SwiftUI

struct ProfileImage: View {
    var url: URL?
    var width: CGFloat
    var height: CGFloat
    
    var body: some View {
        AsyncImage(url: url) { imageLoaded in
            imageLoaded
                .resizable()
        } placeholder: {
            Image(systemName: "person.fill")
                .resizable()
                .foregroundColor(.gray)
        }
        .scaledToFill()
        .frame(width: width, height: height)
        .clipShape(Circle())
        .overlay(Circle().stroke(Color.accentColor, lineWidth: 2))
    }
}

struct ProfileImage_Previews: PreviewProvider {
    static var previews: some View {
        ProfileImage(url: nil, width: 92, height: 92)
    }
}
