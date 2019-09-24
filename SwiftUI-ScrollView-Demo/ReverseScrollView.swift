//
//  ReverseScrollView.swift
//  SwiftUI-ScrollView-Demo
//
//  Created by Mickaël Rémond on 24/09/2019.
//  Copyright © 2019 ProcessOne. All rights reserved.
//

import SwiftUI

struct ReverseScrollView<Content>: View where Content: View {
    @State private var contentHeight: CGFloat = CGFloat.zero
    
    var content: () -> Content
    
    // Calculate content offset
    func offset(outerheight: CGFloat, innerheight: CGFloat) -> CGFloat {
        print("outerheight: \(outerheight) innerheight: \(innerheight)")
        
        return -(innerheight/2 - outerheight/2)
    }
    
    var body: some View {
        GeometryReader { outerGeometry in
            // Render the content
            //  ... and set its sizing inside the parent
            self.content()
            .modifier(ViewHeightKey())
            .onPreferenceChange(ViewHeightKey.self) { self.contentHeight = $0 }
            .frame(height: outerGeometry.size.height)
            .offset(y: self.offset(outerheight: outerGeometry.size.height, innerheight: self.contentHeight))
            .clipped()
        }
    }
}

struct ViewHeightKey: PreferenceKey {
    static var defaultValue: CGFloat { 0 }
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value = value + nextValue()
    }
}

extension ViewHeightKey: ViewModifier {
    func body(content: Content) -> some View {
        return content.background(GeometryReader { proxy in
            Color.clear.preference(key: Self.self, value: proxy.size.height)
        })
    }
}

struct ReverseScrollView_Previews: PreviewProvider {
    static var previews: some View {
        ReverseScrollView {
            VStack {
                ForEach(demoConversation.messages) { message in
                    BubbleView(message: message.body)
                }
            }
        }
        .previewLayout(.sizeThatFits)
    }
}
