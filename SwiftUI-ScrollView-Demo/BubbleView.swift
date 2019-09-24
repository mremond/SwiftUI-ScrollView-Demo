//
//  BubbleView.swift
//  SwiftUI-ScrollView-Demo
//

import SwiftUI

struct BubbleView: View {
    var message: String
    
    var body: some View {
        HStack {
            Spacer()
            Text(message)
        }
        .padding(10)
        .background(Color.gray)
    }
}

struct BubbleView_Previews: PreviewProvider {
    static var previews: some View {
        BubbleView(message: "Hello")
            .previewLayout(.sizeThatFits)
    }
}
