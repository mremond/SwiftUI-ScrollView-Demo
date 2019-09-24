//
//  ReverseScrollView.swift
//  SwiftUI-ScrollView-Demo
//
//  Created by Mickaël Rémond on 24/09/2019.
//  Copyright © 2019 ProcessOne. All rights reserved.
//

import SwiftUI

struct ReverseScrollView<Content>: View where Content: View {
    var content: () -> Content
    
    var body: some View {
        GeometryReader { outerGeometry in
            // Render the content
            //  ... and set its sizing inside the parent
            self.content()
            .frame(height: outerGeometry.size.height)
            .clipped()
        }
    }
}

struct ReverseScrollView_Previews: PreviewProvider {
    static var previews: some View {
        ReverseScrollView {
            BubbleView(message: "Hello")
        }
        .previewLayout(.sizeThatFits)
    }
}
