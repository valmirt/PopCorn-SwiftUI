//
//  ProfileImage.swift
//  PopCorn-SwiftUI
//
//  Created by Valmir Junior on 04/06/21.
//

import SwiftUI

struct ProfileImage: View {
    var image: UIImage?
    var width: CGFloat
    var height: CGFloat
    
    var body: some View {
        Group {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
            } else {
                Image(systemName: "person.fill")
                    .resizable()
            }
        }
        .scaledToFill()
        .foregroundColor(.gray)
        .frame(width: width, height: height)
        .clipShape(Circle())
        .overlay(Circle().stroke(Color.accentColor, lineWidth: 2))
    }
}

struct ProfileImage_Previews: PreviewProvider {
    static var previews: some View {
        ProfileImage(image: nil, width: 92, height: 92)
    }
}
