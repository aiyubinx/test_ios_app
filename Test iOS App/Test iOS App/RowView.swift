//
//  RowView.swift
//  Test iOS App
//
//  Created by Jason Christopher on 12/19/24.
//

import SwiftUI

struct RowView: View {
          @ObservedObject var item: Item
          
          var body: some View {
              VStack {
                  HStack {
                      Text(item.title ?? "Untitled")
                          .font(.title)
                      Spacer()
                  }
                  HStack {
                      if let timestamp = item.timestamp {
                          Text(timestamp, formatter: itemFormatter)
                              .font(.subheadline)
                      } else {
                          Text("No timestamp available")
                              .font(.subheadline)
                              .foregroundColor(.gray)
                      }
                      Spacer()
                  }
              }
          }
      }

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

#Preview {
    let persistence = PersistenceController.preview
    let request = Item.fetchRequest()
    let items = try! persistence.container.viewContext.fetch(request)
    RowView(item: items[0])
}
