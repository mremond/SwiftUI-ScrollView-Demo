//
//  Conversation.swift
//  SwiftUI-ScrollView-Demo
//

struct Conversation: Hashable, Codable {
    var messages: [Message] = []
}

struct Message: Hashable, Codable, Identifiable {
    public var id: Int
    let body: String
    // TODO: add more fields (from, to, timestamp, read indicators, etc).
}

// Create demo conversation to test our custom scroll view.
let demoConversation: Conversation = {
    var conversation = Conversation()
    for index in 0..<40 {
        var message = Message(id: index, body: "message \(index)")
        conversation.messages.append(message)
    }
    return conversation
}()

