//
//  ConversationView.swift
//  SwiftUI-ScrollView-Demo
//

import SwiftUI

struct ConversationView: View {
    var conversation: Conversation
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    ForEach(self.conversation.messages) { message in
                        return BubbleView(message: message.body)
                    }
                }
            }
            .navigationBarTitle(Text("Conversation"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationView(conversation: demoConversation)
    }
}
