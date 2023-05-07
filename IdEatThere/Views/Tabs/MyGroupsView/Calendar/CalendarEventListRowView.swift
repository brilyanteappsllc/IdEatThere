//
//  CalendarEventListRowView.swift
//  IdEatThere
//
//  Created by Brilyante Apps LLC on 5/7/23.
//

import SwiftUI

struct CalendarEventListRowView: View {
    
    @ObservedObject var eventStore : CalendarEventStoreViewModel
    let event : CalendarEvents
    
    var body: some View {
        
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    Text(self.eventStore.eventIcon(groupType: CalendarEventType(rawValue: event.groupType!) ?? .unspecified))
                        .font(.system(size: 40))
                    Text(event.groupName ?? "")
                }
                Text(event.date ?? Date(), formatter: MyGroupsModel().dateFormatter)
                    .font(.bodyFont)
            }
            Spacer()
            Button {
                
            } label: {
                Text("Edit")
            }
            .buttonStyle(.bordered)
        }
    }
}

//struct CalendarEventListRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        CalendarEventListRowView()
//    }
//}
